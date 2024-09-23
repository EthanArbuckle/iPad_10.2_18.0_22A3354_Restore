@implementation GDEntityFeatures

- (GDEntityFeatures)initWithCandidateNameSimilarity:(double)a3
{
  GDEntityFeatures *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GDEntityFeatures;
  result = -[GDEntityFeatures init](&v5, sel_init);
  if (result)
    result->_candidateNameSimilarity = a3;
  return result;
}

- (GDEntityFeatures)initWithCandidateNameScore:(double)a3 candidateCommunicationScore:(double)a4 candidateOrganizationScore:(double)a5 candidateLocationScore:(double)a6 candidateEventLocationScore:(double)a7 candidateEventNameScore:(double)a8 topicScore:(double)a9 messagePopularityGivenTimeOfDay:(uint64_t)a10 callPopularityGivenTimeOfDay:(int)a11 facetimePopularityGivenTimeOfDay:(int)a12 timeOfDayGivenMessageWithEntity:(int)a13 timeOfDayGivenCallWithEntity:(double)a14 timeOfDayGivenFacetimeWithEntity:(double)a15 messageWithEntityGivenTimeOfDay:(double)a16 callWithEntityGivenTimeOfDay:(double)a17 facetimeWithEntityGivenTimeOfDay:(double)a18 messagePopularityGivenCoarseTimeOfDay:(double)a19 callPopularityGivenCoarseTimeOfDay:(double)a20 facetimePopularityGivenCoarseTimeOfDay:(double)a21 coarseTimeOfDayGivenMessageWithEntity:(double)a22 coarseTimeOfDayGivenCallWithEntity:(double)a23 coarseTimeOfDayGivenFacetimeWithEntity:(double)a24 messageWithEntityGivenCoarseTimeOfDay:(double)a25 callWithEntityGivenCoarseTimeOfDay:(double)a26 facetimeWithEntityGivenCoarseTimeOfDay:(double)a27 messagePopularityGivenDayOfWeek:(double)a28 callPopularityGivenDayOfWeek:(double)a29 facetimePopularityGivenDayOfWeek:(double)a30 dayOfWeekGivenMessageWithEntity:(double)a31 dayOfWeekGivenCallWithEntity:(double)a32 dayOfWeekGivenFacetimeWithEntity:(double)a33 messageWithEntityGivenDayOfWeek:(double)a34 callWithEntityGivenDayOfWeek:(double)a35 facetimeWithEntityGivenDayOfWeek:(double)a36 messagePopularityGivenFocusMode:(double)a37 callPopularityGivenFocusMode:(double)a38 facetimePopularityGivenFocusMode:(double)a39 focusModeGivenMessageWithEntity:(double)a40 focusModeGivenCallWithEntity:(double)a41 focusModeGivenFacetimeWithEntity:(double)a42 messageWithEntityGivenFocusMode:(double)a43 callWithEntityGivenFocusMode:(double)a44 facetimeWithEntityGivenFocusMode:(double)a45 messagePopularityGivenLOI:(double)a46 callPopularityGivenLOI:(double)a47 facetimePopularityGivenLOI:(double)a48 LOIGivenMessageWithEntity:(double)a49 LOIGivenCallWithEntity:(double)a50 LOIGivenFacetimeWithEntity:(double)a51 messageWithEntityGivenLOI:(double)a52 callWithEntityGivenLOI:(double)a53 facetimeWithEntityGivenLOI:(double)a54 messagePopularityGivenSpecificGeoHash:(double)a55 callPopularityGivenSpecificGeoHash:(double)a56 facetimePopularityGivenSpecificGeoHash:(double)a57 specificGeoHashGivenMessageWithEntity:(double)a58 specificGeoHashGivenCallWithEntity:(double)a59 specificGeoHashGivenFacetimeWithEntity:(double)a60 messageWithEntityGivenSpecificGeoHash:(double)a61 callWithEntityGivenSpecificGeoHash:(double)a62 facetimeWithEntityGivenSpecificGeoHash:(double)a63 messagePopularityGivenCoarseGeoHash:callPopularityGivenCoarseGeoHash:facetimePopularityGivenCoarseGeoHash:coarseGeoHashGivenMessageWithEntity:coarseGeoHashGivenCallWithEntity:coarseGeoHashGivenFacetimeWithEntity:messageWithEntityGivenCoarseGeoHash:callWithEntityGivenCoarseGeoHash:facetimeWithEntityGivenCoarseGeoHash:messagePopularityGivenLargeGeoHash:callPopularityGivenLargeGeoHash:facetimePopularityGivenLargeGeoHash:largeGeoHashGivenMessageWithEntity:largeGeoHashGivenCallWithEntity:largeGeoHashGivenFacetimeWithEntity:messageWithEntityGivenLargeGeoHash:callWithEntityGivenLargeGeoHash:facetimeWithEntityGivenLargeGeoHash:messagePopularityGivenMicroLocation:callPopularityGivenMicroLocation:facetimePopularityGivenMicroLocation:microLocationGivenMessageWithEntity:microLocationGivenCallWithEntity:microLocationGivenFacetimeWithEntity:messageWithEntityGivenMicroLocation:callWithEntityGivenMicroLocation:facetimeWithEntityGivenMicroLocation:messagePopularityGivenMotionState:callPopularityGivenMotionState:facetimePopularityGivenMotionState:motionStateGivenMessageWithEntity:motionStateGivenCallWithEntity:motionStateGivenFacetimeWithEntity:messageWithEntityGivenMotionState:callWithEntityGivenMotionState:facetimeWithEntityGivenMotionState:messagePopularityGivenWiFi:callPopularityGivenWiFi:facetimePopularityGivenWiFi:wiFiGivenMessageWithEntity:wiFiGivenCallWithEntity:wiFiGivenFacetimeWithEntity:messageWithEntityGivenWiFi:callWithEntityGivenWiFi:facetimeWithEntityGivenWiFi:messagePopularityGivenSequence:callPopularityGivenSequence:facetimePopularityGivenSequence:sequenceGivenMessageWithEntity:sequenceGivenCallWithEntity:sequenceGivenFacetimeWithEntity:lastExecutionAge:medianTimeIntervalBetweenExecution:dailyDoseL1Error:dailyDoseL2Error:shortTermTrendingPopularity:trendingPopularity:longTermTrendingPopularity:
{
  double a64;
  double a65;
  double a66;
  double a67;
  double a68;
  double a69;
  double a70;
  double a71;
  double a72;
  double a73;
  double a74;
  double a75;
  double a76;
  double a77;
  GDEntityFeatures *result;
  objc_super v97;

  v97.receiver = a1;
  v97.super_class = (Class)GDEntityFeatures;
  result = -[GDEntityFeatures init](&v97, sel_init);
  if (result)
  {
    result->_candidateNameScore = a2;
    result->_candidateCommunicationScore = a3;
    result->_candidateOrganizationScore = a4;
    result->_candidateLocationScore = a5;
    result->_candidateEventLocationScore = a6;
    result->_candidateEventNameScore = a7;
    result->_topicScore = a8;
    result->_messagePopularityGivenTimeOfDay = a9;
    result->_callPopularityGivenTimeOfDay = a14;
    result->_facetimePopularityGivenTimeOfDay = a15;
    result->_timeOfDayGivenMessageWithEntity = a16;
    result->_timeOfDayGivenCallWithEntity = a17;
    result->_timeOfDayGivenFacetimeWithEntity = a18;
    result->_messageWithEntityGivenTimeOfDay = a19;
    result->_callWithEntityGivenTimeOfDay = a20;
    result->_facetimeWithEntityGivenTimeOfDay = a21;
    result->_messagePopularityGivenCoarseTimeOfDay = a22;
    result->_callPopularityGivenCoarseTimeOfDay = a23;
    result->_facetimePopularityGivenCoarseTimeOfDay = a24;
    result->_coarseTimeOfDayGivenMessageWithEntity = a25;
    result->_coarseTimeOfDayGivenCallWithEntity = a26;
    result->_coarseTimeOfDayGivenFacetimeWithEntity = a27;
    result->_messageWithEntityGivenCoarseTimeOfDay = a28;
    result->_callWithEntityGivenCoarseTimeOfDay = a29;
    result->_facetimeWithEntityGivenCoarseTimeOfDay = a30;
    result->_messagePopularityGivenDayOfWeek = a31;
    result->_callPopularityGivenDayOfWeek = a32;
    result->_facetimePopularityGivenDayOfWeek = a33;
    result->_dayOfWeekGivenMessageWithEntity = a34;
    result->_dayOfWeekGivenCallWithEntity = a35;
    result->_dayOfWeekGivenFacetimeWithEntity = a36;
    result->_messageWithEntityGivenDayOfWeek = a37;
    result->_callWithEntityGivenDayOfWeek = a38;
    result->_facetimeWithEntityGivenDayOfWeek = a39;
    result->_messagePopularityGivenFocusMode = a40;
    result->_callPopularityGivenFocusMode = a41;
    result->_facetimePopularityGivenFocusMode = a42;
    result->_focusModeGivenMessageWithEntity = a43;
    result->_focusModeGivenCallWithEntity = a44;
    result->_focusModeGivenFacetimeWithEntity = a45;
    result->_messageWithEntityGivenFocusMode = a46;
    result->_callWithEntityGivenFocusMode = a47;
    result->_facetimeWithEntityGivenFocusMode = a48;
    result->_messagePopularityGivenLOI = a49;
    result->_callPopularityGivenLOI = a50;
    result->_facetimePopularityGivenLOI = a51;
    result->_LOIGivenMessageWithEntity = a52;
    result->_LOIGivenCallWithEntity = a53;
    result->_LOIGivenFacetimeWithEntity = a54;
    result->_messageWithEntityGivenLOI = a55;
    result->_callWithEntityGivenLOI = a56;
    result->_facetimeWithEntityGivenLOI = a57;
    result->_messagePopularityGivenSpecificGeoHash = a58;
    result->_callPopularityGivenSpecificGeoHash = a59;
    result->_facetimePopularityGivenSpecificGeoHash = a60;
    result->_specificGeoHashGivenMessageWithEntity = a61;
    result->_specificGeoHashGivenCallWithEntity = a62;
    result->_specificGeoHashGivenFacetimeWithEntity = a63;
    result->_messageWithEntityGivenSpecificGeoHash = a64;
    result->_callWithEntityGivenSpecificGeoHash = a65;
    result->_facetimeWithEntityGivenSpecificGeoHash = a66;
    result->_messagePopularityGivenCoarseGeoHash = a67;
    result->_callPopularityGivenCoarseGeoHash = a68;
    result->_facetimePopularityGivenCoarseGeoHash = a69;
    result->_coarseGeoHashGivenMessageWithEntity = a70;
    result->_coarseGeoHashGivenCallWithEntity = a71;
    result->_coarseGeoHashGivenFacetimeWithEntity = a72;
    result->_messageWithEntityGivenCoarseGeoHash = a73;
    result->_callWithEntityGivenCoarseGeoHash = a74;
    result->_facetimeWithEntityGivenCoarseGeoHash = a75;
    result->_messagePopularityGivenLargeGeoHash = a76;
    result->_callPopularityGivenLargeGeoHash = a77;
    *(_QWORD *)&result->_facetimePopularityGivenLargeGeoHash = STACK[0x280];
    *(_QWORD *)&result->_largeGeoHashGivenMessageWithEntity = STACK[0x288];
    *(_QWORD *)&result->_largeGeoHashGivenCallWithEntity = STACK[0x290];
    *(_QWORD *)&result->_largeGeoHashGivenFacetimeWithEntity = STACK[0x298];
    *(_QWORD *)&result->_messageWithEntityGivenLargeGeoHash = STACK[0x2A0];
    *(_QWORD *)&result->_callWithEntityGivenLargeGeoHash = STACK[0x2A8];
    *(_QWORD *)&result->_facetimeWithEntityGivenLargeGeoHash = STACK[0x2B0];
    *(_QWORD *)&result->_messagePopularityGivenMicroLocation = STACK[0x2B8];
    *(_QWORD *)&result->_callPopularityGivenMicroLocation = STACK[0x2C0];
    *(_QWORD *)&result->_facetimePopularityGivenMicroLocation = STACK[0x2C8];
    *(_QWORD *)&result->_microLocationGivenMessageWithEntity = STACK[0x2D0];
    *(_QWORD *)&result->_microLocationGivenCallWithEntity = STACK[0x2D8];
    *(_QWORD *)&result->_microLocationGivenFacetimeWithEntity = STACK[0x2E0];
    *(_QWORD *)&result->_messageWithEntityGivenMicroLocation = STACK[0x2E8];
    *(_QWORD *)&result->_callWithEntityGivenMicroLocation = STACK[0x2F0];
    *(_QWORD *)&result->_facetimeWithEntityGivenMicroLocation = STACK[0x2F8];
    *(_QWORD *)&result->_messagePopularityGivenMotionState = STACK[0x300];
    *(_QWORD *)&result->_callPopularityGivenMotionState = STACK[0x308];
    *(_QWORD *)&result->_facetimePopularityGivenMotionState = STACK[0x310];
    *(_QWORD *)&result->_motionStateGivenMessageWithEntity = STACK[0x318];
    *(_QWORD *)&result->_motionStateGivenCallWithEntity = STACK[0x320];
    *(_QWORD *)&result->_motionStateGivenFacetimeWithEntity = STACK[0x328];
    *(_QWORD *)&result->_messageWithEntityGivenMotionState = STACK[0x330];
    *(_QWORD *)&result->_callWithEntityGivenMotionState = STACK[0x338];
    *(_QWORD *)&result->_facetimeWithEntityGivenMotionState = STACK[0x340];
    *(_QWORD *)&result->_messagePopularityGivenWiFi = STACK[0x348];
    *(_QWORD *)&result->_callPopularityGivenWiFi = STACK[0x350];
    *(_QWORD *)&result->_facetimePopularityGivenWiFi = STACK[0x358];
    *(_QWORD *)&result->_wiFiGivenMessageWithEntity = STACK[0x360];
    *(_QWORD *)&result->_wiFiGivenCallWithEntity = STACK[0x368];
    *(_QWORD *)&result->_wiFiGivenFacetimeWithEntity = STACK[0x370];
    *(_QWORD *)&result->_messageWithEntityGivenWiFi = STACK[0x378];
    *(_QWORD *)&result->_callWithEntityGivenWiFi = STACK[0x380];
    *(_QWORD *)&result->_facetimeWithEntityGivenWiFi = STACK[0x388];
    *(_QWORD *)&result->_messagePopularityGivenSequence = STACK[0x390];
    *(_QWORD *)&result->_callPopularityGivenSequence = STACK[0x398];
    *(_QWORD *)&result->_facetimePopularityGivenSequence = STACK[0x3A0];
    *(_QWORD *)&result->_sequenceGivenMessageWithEntity = STACK[0x3A8];
    *(_QWORD *)&result->_sequenceGivenCallWithEntity = STACK[0x3B0];
    *(_QWORD *)&result->_sequenceGivenFacetimeWithEntity = STACK[0x3B8];
    *(_QWORD *)&result->_dailyDoseL2Error = STACK[0x3C0];
    *(_QWORD *)&result->_shortTermTrendingPopularity = STACK[0x3C8];
    *(_QWORD *)&result->_trendingPopularity = STACK[0x3D0];
    *(_QWORD *)&result->_longTermTrendingPopularity = STACK[0x3D8];
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_locationTrendingPopularity = _Q0;
    result->_lastExecutionAge = a11;
    result->_medianTimeIntervalBetweenExecution = a12;
    result->_dailyDoseL1Error = a13;
    result->_locationLastExecutionAge = -1;
  }
  return result;
}

- (GDEntityFeatures)initWithCandidateNameScore:(double)a3 candidateCommunicationScore:(double)a4 candidateOrganizationScore:(double)a5 candidateLocationScore:(double)a6 candidateEventLocationScore:(double)a7 candidateEventNameScore:(double)a8 topicScore:(double)a9 messagePopularityGivenTimeOfDay:(uint64_t)a10 callPopularityGivenTimeOfDay:(int)a11 facetimePopularityGivenTimeOfDay:(int)a12 timeOfDayGivenMessageWithEntity:(int)a13 timeOfDayGivenCallWithEntity:(int)a14 timeOfDayGivenFacetimeWithEntity:(double)a15 messageWithEntityGivenTimeOfDay:(double)a16 callWithEntityGivenTimeOfDay:(double)a17 facetimeWithEntityGivenTimeOfDay:(double)a18 messagePopularityGivenCoarseTimeOfDay:(double)a19 callPopularityGivenCoarseTimeOfDay:(double)a20 facetimePopularityGivenCoarseTimeOfDay:(double)a21 coarseTimeOfDayGivenMessageWithEntity:(double)a22 coarseTimeOfDayGivenCallWithEntity:(double)a23 coarseTimeOfDayGivenFacetimeWithEntity:(double)a24 messageWithEntityGivenCoarseTimeOfDay:(double)a25 callWithEntityGivenCoarseTimeOfDay:(double)a26 facetimeWithEntityGivenCoarseTimeOfDay:(double)a27 messagePopularityGivenDayOfWeek:(double)a28 callPopularityGivenDayOfWeek:(double)a29 facetimePopularityGivenDayOfWeek:(double)a30 dayOfWeekGivenMessageWithEntity:(double)a31 dayOfWeekGivenCallWithEntity:(double)a32 dayOfWeekGivenFacetimeWithEntity:(double)a33 messageWithEntityGivenDayOfWeek:(double)a34 callWithEntityGivenDayOfWeek:(double)a35 facetimeWithEntityGivenDayOfWeek:(double)a36 messagePopularityGivenFocusMode:(double)a37 callPopularityGivenFocusMode:(double)a38 facetimePopularityGivenFocusMode:(double)a39 focusModeGivenMessageWithEntity:(double)a40 focusModeGivenCallWithEntity:(double)a41 focusModeGivenFacetimeWithEntity:(double)a42 messageWithEntityGivenFocusMode:(double)a43 callWithEntityGivenFocusMode:(double)a44 facetimeWithEntityGivenFocusMode:(double)a45 messagePopularityGivenLOI:(double)a46 callPopularityGivenLOI:(double)a47 facetimePopularityGivenLOI:(double)a48 LOIGivenMessageWithEntity:(double)a49 LOIGivenCallWithEntity:(double)a50 LOIGivenFacetimeWithEntity:(double)a51 messageWithEntityGivenLOI:(double)a52 callWithEntityGivenLOI:(double)a53 facetimeWithEntityGivenLOI:(double)a54 messagePopularityGivenSpecificGeoHash:(double)a55 callPopularityGivenSpecificGeoHash:(double)a56 facetimePopularityGivenSpecificGeoHash:(double)a57 specificGeoHashGivenMessageWithEntity:(double)a58 specificGeoHashGivenCallWithEntity:(double)a59 specificGeoHashGivenFacetimeWithEntity:(double)a60 messageWithEntityGivenSpecificGeoHash:(double)a61 callWithEntityGivenSpecificGeoHash:(double)a62 facetimeWithEntityGivenSpecificGeoHash:(double)a63 messagePopularityGivenCoarseGeoHash:callPopularityGivenCoarseGeoHash:facetimePopularityGivenCoarseGeoHash:coarseGeoHashGivenMessageWithEntity:coarseGeoHashGivenCallWithEntity:coarseGeoHashGivenFacetimeWithEntity:messageWithEntityGivenCoarseGeoHash:callWithEntityGivenCoarseGeoHash:facetimeWithEntityGivenCoarseGeoHash:messagePopularityGivenLargeGeoHash:callPopularityGivenLargeGeoHash:facetimePopularityGivenLargeGeoHash:largeGeoHashGivenMessageWithEntity:largeGeoHashGivenCallWithEntity:largeGeoHashGivenFacetimeWithEntity:messageWithEntityGivenLargeGeoHash:callWithEntityGivenLargeGeoHash:facetimeWithEntityGivenLargeGeoHash:messagePopularityGivenMicroLocation:callPopularityGivenMicroLocation:facetimePopularityGivenMicroLocation:microLocationGivenMessageWithEntity:microLocationGivenCallWithEntity:microLocationGivenFacetimeWithEntity:messageWithEntityGivenMicroLocation:callWithEntityGivenMicroLocation:facetimeWithEntityGivenMicroLocation:messagePopularityGivenMotionState:callPopularityGivenMotionState:facetimePopularityGivenMotionState:motionStateGivenMessageWithEntity:motionStateGivenCallWithEntity:motionStateGivenFacetimeWithEntity:messageWithEntityGivenMotionState:callWithEntityGivenMotionState:facetimeWithEntityGivenMotionState:messagePopularityGivenWiFi:callPopularityGivenWiFi:facetimePopularityGivenWiFi:wiFiGivenMessageWithEntity:wiFiGivenCallWithEntity:wiFiGivenFacetimeWithEntity:messageWithEntityGivenWiFi:callWithEntityGivenWiFi:facetimeWithEntityGivenWiFi:messagePopularityGivenSequence:callPopularityGivenSequence:facetimePopularityGivenSequence:sequenceGivenMessageWithEntity:sequenceGivenCallWithEntity:sequenceGivenFacetimeWithEntity:lastExecutionAge:medianTimeIntervalBetweenExecution:dailyDoseL1Error:dailyDoseL2Error:shortTermTrendingPopularity:trendingPopularity:longTermTrendingPopularity:locationLastExecutationAge:locationPopularityGivenSpecificGeoHash:locationTrendingPopularity:
{
  double a64;
  double a65;
  double a66;
  double a67;
  double a68;
  double a69;
  double a70;
  double a71;
  double a72;
  double a73;
  double a74;
  double a75;
  double a76;
  double a77;
  double a78;
  GDEntityFeatures *result;
  objc_super v93;

  v93.receiver = a1;
  v93.super_class = (Class)GDEntityFeatures;
  result = -[GDEntityFeatures init](&v93, sel_init);
  if (result)
  {
    result->_candidateNameScore = a2;
    result->_candidateCommunicationScore = a3;
    result->_candidateOrganizationScore = a4;
    result->_candidateLocationScore = a5;
    result->_candidateEventLocationScore = a6;
    result->_candidateEventNameScore = a7;
    result->_topicScore = a8;
    result->_messagePopularityGivenTimeOfDay = a9;
    result->_callPopularityGivenTimeOfDay = a15;
    result->_facetimePopularityGivenTimeOfDay = a16;
    result->_timeOfDayGivenMessageWithEntity = a17;
    result->_timeOfDayGivenCallWithEntity = a18;
    result->_timeOfDayGivenFacetimeWithEntity = a19;
    result->_messageWithEntityGivenTimeOfDay = a20;
    result->_callWithEntityGivenTimeOfDay = a21;
    result->_facetimeWithEntityGivenTimeOfDay = a22;
    result->_messagePopularityGivenCoarseTimeOfDay = a23;
    result->_callPopularityGivenCoarseTimeOfDay = a24;
    result->_facetimePopularityGivenCoarseTimeOfDay = a25;
    result->_coarseTimeOfDayGivenMessageWithEntity = a26;
    result->_coarseTimeOfDayGivenCallWithEntity = a27;
    result->_coarseTimeOfDayGivenFacetimeWithEntity = a28;
    result->_messageWithEntityGivenCoarseTimeOfDay = a29;
    result->_callWithEntityGivenCoarseTimeOfDay = a30;
    result->_facetimeWithEntityGivenCoarseTimeOfDay = a31;
    result->_messagePopularityGivenDayOfWeek = a32;
    result->_callPopularityGivenDayOfWeek = a33;
    result->_facetimePopularityGivenDayOfWeek = a34;
    result->_dayOfWeekGivenMessageWithEntity = a35;
    result->_dayOfWeekGivenCallWithEntity = a36;
    result->_dayOfWeekGivenFacetimeWithEntity = a37;
    result->_messageWithEntityGivenDayOfWeek = a38;
    result->_callWithEntityGivenDayOfWeek = a39;
    result->_facetimeWithEntityGivenDayOfWeek = a40;
    result->_messagePopularityGivenFocusMode = a41;
    result->_callPopularityGivenFocusMode = a42;
    result->_facetimePopularityGivenFocusMode = a43;
    result->_focusModeGivenMessageWithEntity = a44;
    result->_focusModeGivenCallWithEntity = a45;
    result->_focusModeGivenFacetimeWithEntity = a46;
    result->_messageWithEntityGivenFocusMode = a47;
    result->_callWithEntityGivenFocusMode = a48;
    result->_facetimeWithEntityGivenFocusMode = a49;
    result->_messagePopularityGivenLOI = a50;
    result->_callPopularityGivenLOI = a51;
    result->_facetimePopularityGivenLOI = a52;
    result->_LOIGivenMessageWithEntity = a53;
    result->_LOIGivenCallWithEntity = a54;
    result->_LOIGivenFacetimeWithEntity = a55;
    result->_messageWithEntityGivenLOI = a56;
    result->_callWithEntityGivenLOI = a57;
    result->_facetimeWithEntityGivenLOI = a58;
    result->_messagePopularityGivenSpecificGeoHash = a59;
    result->_callPopularityGivenSpecificGeoHash = a60;
    result->_facetimePopularityGivenSpecificGeoHash = a61;
    result->_specificGeoHashGivenMessageWithEntity = a62;
    result->_specificGeoHashGivenCallWithEntity = a63;
    result->_specificGeoHashGivenFacetimeWithEntity = a64;
    result->_messageWithEntityGivenSpecificGeoHash = a65;
    result->_callWithEntityGivenSpecificGeoHash = a66;
    result->_facetimeWithEntityGivenSpecificGeoHash = a67;
    result->_messagePopularityGivenCoarseGeoHash = a68;
    result->_callPopularityGivenCoarseGeoHash = a69;
    result->_facetimePopularityGivenCoarseGeoHash = a70;
    result->_coarseGeoHashGivenMessageWithEntity = a71;
    result->_coarseGeoHashGivenCallWithEntity = a72;
    result->_coarseGeoHashGivenFacetimeWithEntity = a73;
    result->_messageWithEntityGivenCoarseGeoHash = a74;
    result->_callWithEntityGivenCoarseGeoHash = a75;
    result->_facetimeWithEntityGivenCoarseGeoHash = a76;
    result->_messagePopularityGivenLargeGeoHash = a77;
    result->_callPopularityGivenLargeGeoHash = a78;
    *(_QWORD *)&result->_facetimePopularityGivenLargeGeoHash = STACK[0x290];
    *(_QWORD *)&result->_largeGeoHashGivenMessageWithEntity = STACK[0x298];
    *(_QWORD *)&result->_largeGeoHashGivenCallWithEntity = STACK[0x2A0];
    *(_QWORD *)&result->_largeGeoHashGivenFacetimeWithEntity = STACK[0x2A8];
    *(_QWORD *)&result->_messageWithEntityGivenLargeGeoHash = STACK[0x2B0];
    *(_QWORD *)&result->_callWithEntityGivenLargeGeoHash = STACK[0x2B8];
    *(_QWORD *)&result->_facetimeWithEntityGivenLargeGeoHash = STACK[0x2C0];
    *(_QWORD *)&result->_messagePopularityGivenMicroLocation = STACK[0x2C8];
    *(_QWORD *)&result->_callPopularityGivenMicroLocation = STACK[0x2D0];
    *(_QWORD *)&result->_facetimePopularityGivenMicroLocation = STACK[0x2D8];
    *(_QWORD *)&result->_microLocationGivenMessageWithEntity = STACK[0x2E0];
    *(_QWORD *)&result->_microLocationGivenCallWithEntity = STACK[0x2E8];
    *(_QWORD *)&result->_microLocationGivenFacetimeWithEntity = STACK[0x2F0];
    *(_QWORD *)&result->_messageWithEntityGivenMicroLocation = STACK[0x2F8];
    *(_QWORD *)&result->_callWithEntityGivenMicroLocation = STACK[0x300];
    *(_QWORD *)&result->_facetimeWithEntityGivenMicroLocation = STACK[0x308];
    *(_QWORD *)&result->_messagePopularityGivenMotionState = STACK[0x310];
    *(_QWORD *)&result->_callPopularityGivenMotionState = STACK[0x318];
    *(_QWORD *)&result->_facetimePopularityGivenMotionState = STACK[0x320];
    *(_QWORD *)&result->_motionStateGivenMessageWithEntity = STACK[0x328];
    *(_QWORD *)&result->_motionStateGivenCallWithEntity = STACK[0x330];
    *(_QWORD *)&result->_motionStateGivenFacetimeWithEntity = STACK[0x338];
    *(_QWORD *)&result->_messageWithEntityGivenMotionState = STACK[0x340];
    *(_QWORD *)&result->_callWithEntityGivenMotionState = STACK[0x348];
    *(_QWORD *)&result->_facetimeWithEntityGivenMotionState = STACK[0x350];
    *(_QWORD *)&result->_messagePopularityGivenWiFi = STACK[0x358];
    *(_QWORD *)&result->_callPopularityGivenWiFi = STACK[0x360];
    *(_QWORD *)&result->_facetimePopularityGivenWiFi = STACK[0x368];
    *(_QWORD *)&result->_wiFiGivenMessageWithEntity = STACK[0x370];
    *(_QWORD *)&result->_wiFiGivenCallWithEntity = STACK[0x378];
    *(_QWORD *)&result->_wiFiGivenFacetimeWithEntity = STACK[0x380];
    *(_QWORD *)&result->_messageWithEntityGivenWiFi = STACK[0x388];
    *(_QWORD *)&result->_callWithEntityGivenWiFi = STACK[0x390];
    *(_QWORD *)&result->_facetimeWithEntityGivenWiFi = STACK[0x398];
    *(_QWORD *)&result->_messagePopularityGivenSequence = STACK[0x3A0];
    *(_QWORD *)&result->_callPopularityGivenSequence = STACK[0x3A8];
    *(_QWORD *)&result->_facetimePopularityGivenSequence = STACK[0x3B0];
    *(_QWORD *)&result->_sequenceGivenMessageWithEntity = STACK[0x3B8];
    *(_QWORD *)&result->_sequenceGivenCallWithEntity = STACK[0x3C0];
    *(_QWORD *)&result->_sequenceGivenFacetimeWithEntity = STACK[0x3C8];
    *(_QWORD *)&result->_dailyDoseL2Error = STACK[0x3D0];
    *(_QWORD *)&result->_shortTermTrendingPopularity = STACK[0x3D8];
    *(_QWORD *)&result->_trendingPopularity = STACK[0x3E0];
    *(_QWORD *)&result->_longTermTrendingPopularity = STACK[0x3E8];
    *(_QWORD *)&result->_locationPopularityGivenSpecificGeoHash = STACK[0x3F0];
    *(_QWORD *)&result->_locationTrendingPopularity = STACK[0x3F8];
    result->_lastExecutionAge = a11;
    result->_medianTimeIntervalBetweenExecution = a12;
    result->_dailyDoseL1Error = a13;
    result->_locationLastExecutionAge = a14;
  }
  return result;
}

- (GDEntityFeatures)initWithLocationLastExecutationAge:(int)a3 locationPopularityGivenSpecificGeoHash:(double)a4 locationTrendingPopularity:(double)a5
{
  self->_locationPopularityGivenSpecificGeoHash = a4;
  self->_locationTrendingPopularity = a5;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_candidateNameScore = _Q0;
  *(_OWORD *)&self->_candidateOrganizationScore = _Q0;
  *(_OWORD *)&self->_candidateEventLocationScore = _Q0;
  *(_OWORD *)&self->_topicScore = _Q0;
  *(_OWORD *)&self->_callPopularityGivenTimeOfDay = _Q0;
  *(_OWORD *)&self->_timeOfDayGivenMessageWithEntity = _Q0;
  *(_OWORD *)&self->_timeOfDayGivenFacetimeWithEntity = _Q0;
  *(_OWORD *)&self->_callWithEntityGivenTimeOfDay = _Q0;
  *(_OWORD *)&self->_messagePopularityGivenCoarseTimeOfDay = _Q0;
  *(_OWORD *)&self->_facetimePopularityGivenCoarseTimeOfDay = _Q0;
  *(_OWORD *)&self->_coarseTimeOfDayGivenCallWithEntity = _Q0;
  *(_OWORD *)&self->_messageWithEntityGivenCoarseTimeOfDay = _Q0;
  *(_OWORD *)&self->_facetimeWithEntityGivenCoarseTimeOfDay = _Q0;
  *(_OWORD *)&self->_callPopularityGivenDayOfWeek = _Q0;
  *(_OWORD *)&self->_dayOfWeekGivenMessageWithEntity = _Q0;
  *(_OWORD *)&self->_dayOfWeekGivenFacetimeWithEntity = _Q0;
  *(_OWORD *)&self->_callWithEntityGivenDayOfWeek = _Q0;
  *(_OWORD *)&self->_messagePopularityGivenFocusMode = _Q0;
  *(_OWORD *)&self->_facetimePopularityGivenFocusMode = _Q0;
  *(_OWORD *)&self->_focusModeGivenCallWithEntity = _Q0;
  *(_OWORD *)&self->_messageWithEntityGivenFocusMode = _Q0;
  *(_OWORD *)&self->_facetimeWithEntityGivenFocusMode = _Q0;
  *(_OWORD *)&self->_callPopularityGivenLOI = _Q0;
  *(_OWORD *)&self->_LOIGivenMessageWithEntity = _Q0;
  *(_OWORD *)&self->_LOIGivenFacetimeWithEntity = _Q0;
  *(_OWORD *)&self->_callWithEntityGivenLOI = _Q0;
  *(_OWORD *)&self->_messagePopularityGivenSpecificGeoHash = _Q0;
  *(_OWORD *)&self->_facetimePopularityGivenSpecificGeoHash = _Q0;
  *(_OWORD *)&self->_specificGeoHashGivenCallWithEntity = _Q0;
  *(_OWORD *)&self->_messageWithEntityGivenSpecificGeoHash = _Q0;
  *(_OWORD *)&self->_facetimeWithEntityGivenSpecificGeoHash = _Q0;
  *(_OWORD *)&self->_callPopularityGivenCoarseGeoHash = _Q0;
  *(_OWORD *)&self->_coarseGeoHashGivenMessageWithEntity = _Q0;
  *(_OWORD *)&self->_coarseGeoHashGivenFacetimeWithEntity = _Q0;
  *(_OWORD *)&self->_callWithEntityGivenCoarseGeoHash = _Q0;
  *(_OWORD *)&self->_messagePopularityGivenLargeGeoHash = _Q0;
  *(_OWORD *)&self->_facetimePopularityGivenLargeGeoHash = _Q0;
  *(_OWORD *)&self->_largeGeoHashGivenCallWithEntity = _Q0;
  *(_OWORD *)&self->_messageWithEntityGivenLargeGeoHash = _Q0;
  *(_OWORD *)&self->_facetimeWithEntityGivenLargeGeoHash = _Q0;
  *(_OWORD *)&self->_callPopularityGivenMicroLocation = _Q0;
  *(_OWORD *)&self->_microLocationGivenMessageWithEntity = _Q0;
  *(_OWORD *)&self->_microLocationGivenFacetimeWithEntity = _Q0;
  *(_OWORD *)&self->_callWithEntityGivenMicroLocation = _Q0;
  *(_OWORD *)&self->_messagePopularityGivenMotionState = _Q0;
  *(_OWORD *)&self->_facetimePopularityGivenMotionState = _Q0;
  *(_OWORD *)&self->_motionStateGivenCallWithEntity = _Q0;
  *(_OWORD *)&self->_messageWithEntityGivenMotionState = _Q0;
  *(_OWORD *)&self->_facetimeWithEntityGivenMotionState = _Q0;
  *(_OWORD *)&self->_callPopularityGivenWiFi = _Q0;
  *(_OWORD *)&self->_wiFiGivenMessageWithEntity = _Q0;
  *(_OWORD *)&self->_wiFiGivenFacetimeWithEntity = _Q0;
  *(_OWORD *)&self->_callWithEntityGivenWiFi = _Q0;
  *(_OWORD *)&self->_messagePopularityGivenSequence = _Q0;
  *(_OWORD *)&self->_facetimePopularityGivenSequence = _Q0;
  *(_OWORD *)&self->_sequenceGivenCallWithEntity = _Q0;
  *(_QWORD *)&self->_lastExecutionAge = -1;
  self->_dailyDoseL1Error = -1;
  self->_locationLastExecutionAge = a3;
  *(_OWORD *)&self->_dailyDoseL2Error = _Q0;
  *(_OWORD *)&self->_trendingPopularity = _Q0;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  double candidateNameScore;
  id v5;
  void *v6;
  const char *v7;
  double candidateCommunicationScore;
  void *v9;
  const char *v10;
  double candidateOrganizationScore;
  void *v12;
  const char *v13;
  double candidateLocationScore;
  void *v15;
  const char *v16;
  double candidateEventLocationScore;
  void *v18;
  const char *v19;
  double candidateEventNameScore;
  void *v21;
  const char *v22;
  double topicScore;
  void *v24;
  const char *v25;
  double messagePopularityGivenTimeOfDay;
  void *v27;
  const char *v28;
  double callPopularityGivenTimeOfDay;
  void *v30;
  const char *v31;
  double facetimePopularityGivenTimeOfDay;
  void *v33;
  const char *v34;
  double timeOfDayGivenMessageWithEntity;
  void *v36;
  const char *v37;
  double timeOfDayGivenCallWithEntity;
  void *v39;
  const char *v40;
  double timeOfDayGivenFacetimeWithEntity;
  void *v42;
  const char *v43;
  double messageWithEntityGivenTimeOfDay;
  void *v45;
  const char *v46;
  double callWithEntityGivenTimeOfDay;
  void *v48;
  const char *v49;
  double facetimeWithEntityGivenTimeOfDay;
  void *v51;
  const char *v52;
  double messagePopularityGivenCoarseTimeOfDay;
  void *v54;
  const char *v55;
  double callPopularityGivenCoarseTimeOfDay;
  void *v57;
  const char *v58;
  double facetimePopularityGivenCoarseTimeOfDay;
  void *v60;
  const char *v61;
  double coarseTimeOfDayGivenMessageWithEntity;
  void *v63;
  const char *v64;
  double coarseTimeOfDayGivenCallWithEntity;
  void *v66;
  const char *v67;
  double coarseTimeOfDayGivenFacetimeWithEntity;
  void *v69;
  const char *v70;
  double messageWithEntityGivenCoarseTimeOfDay;
  void *v72;
  const char *v73;
  double callWithEntityGivenCoarseTimeOfDay;
  void *v75;
  const char *v76;
  double facetimeWithEntityGivenCoarseTimeOfDay;
  void *v78;
  const char *v79;
  double messagePopularityGivenDayOfWeek;
  void *v81;
  const char *v82;
  double callPopularityGivenDayOfWeek;
  void *v84;
  const char *v85;
  double facetimePopularityGivenDayOfWeek;
  void *v87;
  const char *v88;
  double dayOfWeekGivenMessageWithEntity;
  void *v90;
  const char *v91;
  double dayOfWeekGivenCallWithEntity;
  void *v93;
  const char *v94;
  double dayOfWeekGivenFacetimeWithEntity;
  void *v96;
  const char *v97;
  double messageWithEntityGivenDayOfWeek;
  void *v99;
  const char *v100;
  double callWithEntityGivenDayOfWeek;
  void *v102;
  const char *v103;
  double facetimeWithEntityGivenDayOfWeek;
  void *v105;
  const char *v106;
  double messagePopularityGivenFocusMode;
  void *v108;
  const char *v109;
  double callPopularityGivenFocusMode;
  void *v111;
  const char *v112;
  double facetimePopularityGivenFocusMode;
  void *v114;
  const char *v115;
  double focusModeGivenMessageWithEntity;
  void *v117;
  const char *v118;
  double focusModeGivenCallWithEntity;
  void *v120;
  const char *v121;
  double focusModeGivenFacetimeWithEntity;
  void *v123;
  const char *v124;
  double messageWithEntityGivenFocusMode;
  void *v126;
  const char *v127;
  double callWithEntityGivenFocusMode;
  void *v129;
  const char *v130;
  double facetimeWithEntityGivenFocusMode;
  void *v132;
  const char *v133;
  double messagePopularityGivenLOI;
  void *v135;
  const char *v136;
  double callPopularityGivenLOI;
  void *v138;
  const char *v139;
  double facetimePopularityGivenLOI;
  void *v141;
  const char *v142;
  double LOIGivenMessageWithEntity;
  void *v144;
  const char *v145;
  double LOIGivenCallWithEntity;
  void *v147;
  const char *v148;
  double LOIGivenFacetimeWithEntity;
  void *v150;
  const char *v151;
  double messageWithEntityGivenLOI;
  void *v153;
  const char *v154;
  double callWithEntityGivenLOI;
  void *v156;
  const char *v157;
  double facetimeWithEntityGivenLOI;
  void *v159;
  const char *v160;
  double messagePopularityGivenSpecificGeoHash;
  void *v162;
  const char *v163;
  double callPopularityGivenSpecificGeoHash;
  void *v165;
  const char *v166;
  double facetimePopularityGivenSpecificGeoHash;
  void *v168;
  const char *v169;
  double specificGeoHashGivenMessageWithEntity;
  void *v171;
  const char *v172;
  double specificGeoHashGivenCallWithEntity;
  void *v174;
  const char *v175;
  double specificGeoHashGivenFacetimeWithEntity;
  void *v177;
  const char *v178;
  double messageWithEntityGivenSpecificGeoHash;
  void *v180;
  const char *v181;
  double callWithEntityGivenSpecificGeoHash;
  void *v183;
  const char *v184;
  double facetimeWithEntityGivenSpecificGeoHash;
  void *v186;
  const char *v187;
  double messagePopularityGivenCoarseGeoHash;
  void *v189;
  const char *v190;
  double callPopularityGivenCoarseGeoHash;
  void *v192;
  const char *v193;
  double facetimePopularityGivenCoarseGeoHash;
  void *v195;
  const char *v196;
  double coarseGeoHashGivenMessageWithEntity;
  void *v198;
  const char *v199;
  double coarseGeoHashGivenCallWithEntity;
  void *v201;
  const char *v202;
  double coarseGeoHashGivenFacetimeWithEntity;
  void *v204;
  const char *v205;
  double messageWithEntityGivenCoarseGeoHash;
  void *v207;
  const char *v208;
  double callWithEntityGivenCoarseGeoHash;
  void *v210;
  const char *v211;
  double facetimeWithEntityGivenCoarseGeoHash;
  void *v213;
  const char *v214;
  double messagePopularityGivenLargeGeoHash;
  void *v216;
  const char *v217;
  double callPopularityGivenLargeGeoHash;
  void *v219;
  const char *v220;
  double facetimePopularityGivenLargeGeoHash;
  void *v222;
  const char *v223;
  double largeGeoHashGivenMessageWithEntity;
  void *v225;
  const char *v226;
  double largeGeoHashGivenCallWithEntity;
  void *v228;
  const char *v229;
  double largeGeoHashGivenFacetimeWithEntity;
  void *v231;
  const char *v232;
  double messageWithEntityGivenLargeGeoHash;
  void *v234;
  const char *v235;
  double callWithEntityGivenLargeGeoHash;
  void *v237;
  const char *v238;
  double facetimeWithEntityGivenLargeGeoHash;
  void *v240;
  const char *v241;
  double messagePopularityGivenMicroLocation;
  void *v243;
  const char *v244;
  double callPopularityGivenMicroLocation;
  void *v246;
  const char *v247;
  double facetimePopularityGivenMicroLocation;
  void *v249;
  const char *v250;
  double microLocationGivenMessageWithEntity;
  void *v252;
  const char *v253;
  double microLocationGivenCallWithEntity;
  void *v255;
  const char *v256;
  double microLocationGivenFacetimeWithEntity;
  void *v258;
  const char *v259;
  double messageWithEntityGivenMicroLocation;
  void *v261;
  const char *v262;
  double callWithEntityGivenMicroLocation;
  void *v264;
  const char *v265;
  double facetimeWithEntityGivenMicroLocation;
  void *v267;
  const char *v268;
  double messagePopularityGivenMotionState;
  void *v270;
  const char *v271;
  double callPopularityGivenMotionState;
  void *v273;
  const char *v274;
  double facetimePopularityGivenMotionState;
  void *v276;
  const char *v277;
  double motionStateGivenMessageWithEntity;
  void *v279;
  const char *v280;
  double motionStateGivenCallWithEntity;
  void *v282;
  const char *v283;
  double motionStateGivenFacetimeWithEntity;
  void *v285;
  const char *v286;
  double messageWithEntityGivenMotionState;
  void *v288;
  const char *v289;
  double callWithEntityGivenMotionState;
  void *v291;
  const char *v292;
  double facetimeWithEntityGivenMotionState;
  void *v294;
  const char *v295;
  double messagePopularityGivenWiFi;
  void *v297;
  const char *v298;
  double callPopularityGivenWiFi;
  void *v300;
  const char *v301;
  double facetimePopularityGivenWiFi;
  void *v303;
  const char *v304;
  double wiFiGivenMessageWithEntity;
  void *v306;
  const char *v307;
  double wiFiGivenCallWithEntity;
  void *v309;
  const char *v310;
  double wiFiGivenFacetimeWithEntity;
  void *v312;
  const char *v313;
  double messageWithEntityGivenWiFi;
  void *v315;
  const char *v316;
  double callWithEntityGivenWiFi;
  void *v318;
  const char *v319;
  double facetimeWithEntityGivenWiFi;
  void *v321;
  const char *v322;
  double messagePopularityGivenSequence;
  void *v324;
  const char *v325;
  double callPopularityGivenSequence;
  void *v327;
  const char *v328;
  double facetimePopularityGivenSequence;
  void *v330;
  const char *v331;
  double sequenceGivenMessageWithEntity;
  void *v333;
  const char *v334;
  double sequenceGivenCallWithEntity;
  void *v336;
  const char *v337;
  double sequenceGivenFacetimeWithEntity;
  void *v339;
  const char *v340;
  uint64_t lastExecutionAge;
  void *v342;
  const char *v343;
  uint64_t medianTimeIntervalBetweenExecution;
  void *v345;
  const char *v346;
  uint64_t dailyDoseL1Error;
  void *v348;
  const char *v349;
  double dailyDoseL2Error;
  void *v351;
  const char *v352;
  double shortTermTrendingPopularity;
  void *v354;
  const char *v355;
  double trendingPopularity;
  void *v357;
  const char *v358;
  double longTermTrendingPopularity;
  void *v360;
  const char *v361;
  uint64_t locationLastExecutionAge;
  void *v363;
  const char *v364;
  double locationTrendingPopularity;
  void *v366;
  const char *v367;
  double locationPopularityGivenSpecificGeoHash;
  const char *v369;
  id v370;

  candidateNameScore = self->_candidateNameScore;
  v5 = a3;
  NSStringFromSelector(sel_candidateNameScore);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v7, (uint64_t)v6, candidateNameScore);

  candidateCommunicationScore = self->_candidateCommunicationScore;
  NSStringFromSelector(sel_candidateCommunicationScore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v10, (uint64_t)v9, candidateCommunicationScore);

  candidateOrganizationScore = self->_candidateOrganizationScore;
  NSStringFromSelector(sel_candidateOrganizationScore);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v13, (uint64_t)v12, candidateOrganizationScore);

  candidateLocationScore = self->_candidateLocationScore;
  NSStringFromSelector(sel_candidateLocationScore);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v16, (uint64_t)v15, candidateLocationScore);

  candidateEventLocationScore = self->_candidateEventLocationScore;
  NSStringFromSelector(sel_candidateEventLocationScore);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v19, (uint64_t)v18, candidateEventLocationScore);

  candidateEventNameScore = self->_candidateEventNameScore;
  NSStringFromSelector(sel_candidateEventNameScore);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v22, (uint64_t)v21, candidateEventNameScore);

  topicScore = self->_topicScore;
  NSStringFromSelector(sel_topicScore);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v25, (uint64_t)v24, topicScore);

  messagePopularityGivenTimeOfDay = self->_messagePopularityGivenTimeOfDay;
  NSStringFromSelector(sel_messagePopularityGivenTimeOfDay);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v28, (uint64_t)v27, messagePopularityGivenTimeOfDay);

  callPopularityGivenTimeOfDay = self->_callPopularityGivenTimeOfDay;
  NSStringFromSelector(sel_callPopularityGivenTimeOfDay);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v31, (uint64_t)v30, callPopularityGivenTimeOfDay);

  facetimePopularityGivenTimeOfDay = self->_facetimePopularityGivenTimeOfDay;
  NSStringFromSelector(sel_facetimePopularityGivenTimeOfDay);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v34, (uint64_t)v33, facetimePopularityGivenTimeOfDay);

  timeOfDayGivenMessageWithEntity = self->_timeOfDayGivenMessageWithEntity;
  NSStringFromSelector(sel_timeOfDayGivenMessageWithEntity);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v37, (uint64_t)v36, timeOfDayGivenMessageWithEntity);

  timeOfDayGivenCallWithEntity = self->_timeOfDayGivenCallWithEntity;
  NSStringFromSelector(sel_timeOfDayGivenCallWithEntity);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v40, (uint64_t)v39, timeOfDayGivenCallWithEntity);

  timeOfDayGivenFacetimeWithEntity = self->_timeOfDayGivenFacetimeWithEntity;
  NSStringFromSelector(sel_timeOfDayGivenFacetimeWithEntity);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v43, (uint64_t)v42, timeOfDayGivenFacetimeWithEntity);

  messageWithEntityGivenTimeOfDay = self->_messageWithEntityGivenTimeOfDay;
  NSStringFromSelector(sel_messageWithEntityGivenTimeOfDay);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v46, (uint64_t)v45, messageWithEntityGivenTimeOfDay);

  callWithEntityGivenTimeOfDay = self->_callWithEntityGivenTimeOfDay;
  NSStringFromSelector(sel_callWithEntityGivenTimeOfDay);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v49, (uint64_t)v48, callWithEntityGivenTimeOfDay);

  facetimeWithEntityGivenTimeOfDay = self->_facetimeWithEntityGivenTimeOfDay;
  NSStringFromSelector(sel_facetimeWithEntityGivenTimeOfDay);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v52, (uint64_t)v51, facetimeWithEntityGivenTimeOfDay);

  messagePopularityGivenCoarseTimeOfDay = self->_messagePopularityGivenCoarseTimeOfDay;
  NSStringFromSelector(sel_messagePopularityGivenCoarseTimeOfDay);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v55, (uint64_t)v54, messagePopularityGivenCoarseTimeOfDay);

  callPopularityGivenCoarseTimeOfDay = self->_callPopularityGivenCoarseTimeOfDay;
  NSStringFromSelector(sel_callPopularityGivenCoarseTimeOfDay);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v58, (uint64_t)v57, callPopularityGivenCoarseTimeOfDay);

  facetimePopularityGivenCoarseTimeOfDay = self->_facetimePopularityGivenCoarseTimeOfDay;
  NSStringFromSelector(sel_facetimePopularityGivenCoarseTimeOfDay);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v61, (uint64_t)v60, facetimePopularityGivenCoarseTimeOfDay);

  coarseTimeOfDayGivenMessageWithEntity = self->_coarseTimeOfDayGivenMessageWithEntity;
  NSStringFromSelector(sel_coarseTimeOfDayGivenMessageWithEntity);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v64, (uint64_t)v63, coarseTimeOfDayGivenMessageWithEntity);

  coarseTimeOfDayGivenCallWithEntity = self->_coarseTimeOfDayGivenCallWithEntity;
  NSStringFromSelector(sel_coarseTimeOfDayGivenCallWithEntity);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v67, (uint64_t)v66, coarseTimeOfDayGivenCallWithEntity);

  coarseTimeOfDayGivenFacetimeWithEntity = self->_coarseTimeOfDayGivenFacetimeWithEntity;
  NSStringFromSelector(sel_coarseTimeOfDayGivenFacetimeWithEntity);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v70, (uint64_t)v69, coarseTimeOfDayGivenFacetimeWithEntity);

  messageWithEntityGivenCoarseTimeOfDay = self->_messageWithEntityGivenCoarseTimeOfDay;
  NSStringFromSelector(sel_messageWithEntityGivenCoarseTimeOfDay);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v73, (uint64_t)v72, messageWithEntityGivenCoarseTimeOfDay);

  callWithEntityGivenCoarseTimeOfDay = self->_callWithEntityGivenCoarseTimeOfDay;
  NSStringFromSelector(sel_callWithEntityGivenCoarseTimeOfDay);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v76, (uint64_t)v75, callWithEntityGivenCoarseTimeOfDay);

  facetimeWithEntityGivenCoarseTimeOfDay = self->_facetimeWithEntityGivenCoarseTimeOfDay;
  NSStringFromSelector(sel_facetimeWithEntityGivenCoarseTimeOfDay);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v79, (uint64_t)v78, facetimeWithEntityGivenCoarseTimeOfDay);

  messagePopularityGivenDayOfWeek = self->_messagePopularityGivenDayOfWeek;
  NSStringFromSelector(sel_messagePopularityGivenDayOfWeek);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v82, (uint64_t)v81, messagePopularityGivenDayOfWeek);

  callPopularityGivenDayOfWeek = self->_callPopularityGivenDayOfWeek;
  NSStringFromSelector(sel_callPopularityGivenDayOfWeek);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v85, (uint64_t)v84, callPopularityGivenDayOfWeek);

  facetimePopularityGivenDayOfWeek = self->_facetimePopularityGivenDayOfWeek;
  NSStringFromSelector(sel_facetimePopularityGivenDayOfWeek);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v88, (uint64_t)v87, facetimePopularityGivenDayOfWeek);

  dayOfWeekGivenMessageWithEntity = self->_dayOfWeekGivenMessageWithEntity;
  NSStringFromSelector(sel_dayOfWeekGivenMessageWithEntity);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v91, (uint64_t)v90, dayOfWeekGivenMessageWithEntity);

  dayOfWeekGivenCallWithEntity = self->_dayOfWeekGivenCallWithEntity;
  NSStringFromSelector(sel_dayOfWeekGivenCallWithEntity);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v94, (uint64_t)v93, dayOfWeekGivenCallWithEntity);

  dayOfWeekGivenFacetimeWithEntity = self->_dayOfWeekGivenFacetimeWithEntity;
  NSStringFromSelector(sel_dayOfWeekGivenFacetimeWithEntity);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v97, (uint64_t)v96, dayOfWeekGivenFacetimeWithEntity);

  messageWithEntityGivenDayOfWeek = self->_messageWithEntityGivenDayOfWeek;
  NSStringFromSelector(sel_messageWithEntityGivenDayOfWeek);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v100, (uint64_t)v99, messageWithEntityGivenDayOfWeek);

  callWithEntityGivenDayOfWeek = self->_callWithEntityGivenDayOfWeek;
  NSStringFromSelector(sel_callWithEntityGivenDayOfWeek);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v103, (uint64_t)v102, callWithEntityGivenDayOfWeek);

  facetimeWithEntityGivenDayOfWeek = self->_facetimeWithEntityGivenDayOfWeek;
  NSStringFromSelector(sel_facetimeWithEntityGivenDayOfWeek);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v106, (uint64_t)v105, facetimeWithEntityGivenDayOfWeek);

  messagePopularityGivenFocusMode = self->_messagePopularityGivenFocusMode;
  NSStringFromSelector(sel_messagePopularityGivenFocusMode);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v109, (uint64_t)v108, messagePopularityGivenFocusMode);

  callPopularityGivenFocusMode = self->_callPopularityGivenFocusMode;
  NSStringFromSelector(sel_callPopularityGivenFocusMode);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v112, (uint64_t)v111, callPopularityGivenFocusMode);

  facetimePopularityGivenFocusMode = self->_facetimePopularityGivenFocusMode;
  NSStringFromSelector(sel_facetimePopularityGivenFocusMode);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v115, (uint64_t)v114, facetimePopularityGivenFocusMode);

  focusModeGivenMessageWithEntity = self->_focusModeGivenMessageWithEntity;
  NSStringFromSelector(sel_focusModeGivenMessageWithEntity);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v118, (uint64_t)v117, focusModeGivenMessageWithEntity);

  focusModeGivenCallWithEntity = self->_focusModeGivenCallWithEntity;
  NSStringFromSelector(sel_focusModeGivenCallWithEntity);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v121, (uint64_t)v120, focusModeGivenCallWithEntity);

  focusModeGivenFacetimeWithEntity = self->_focusModeGivenFacetimeWithEntity;
  NSStringFromSelector(sel_focusModeGivenFacetimeWithEntity);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v124, (uint64_t)v123, focusModeGivenFacetimeWithEntity);

  messageWithEntityGivenFocusMode = self->_messageWithEntityGivenFocusMode;
  NSStringFromSelector(sel_messageWithEntityGivenFocusMode);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v127, (uint64_t)v126, messageWithEntityGivenFocusMode);

  callWithEntityGivenFocusMode = self->_callWithEntityGivenFocusMode;
  NSStringFromSelector(sel_callWithEntityGivenFocusMode);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v130, (uint64_t)v129, callWithEntityGivenFocusMode);

  facetimeWithEntityGivenFocusMode = self->_facetimeWithEntityGivenFocusMode;
  NSStringFromSelector(sel_facetimeWithEntityGivenFocusMode);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v133, (uint64_t)v132, facetimeWithEntityGivenFocusMode);

  messagePopularityGivenLOI = self->_messagePopularityGivenLOI;
  NSStringFromSelector(sel_messagePopularityGivenLOI);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v136, (uint64_t)v135, messagePopularityGivenLOI);

  callPopularityGivenLOI = self->_callPopularityGivenLOI;
  NSStringFromSelector(sel_callPopularityGivenLOI);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v139, (uint64_t)v138, callPopularityGivenLOI);

  facetimePopularityGivenLOI = self->_facetimePopularityGivenLOI;
  NSStringFromSelector(sel_facetimePopularityGivenLOI);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v142, (uint64_t)v141, facetimePopularityGivenLOI);

  LOIGivenMessageWithEntity = self->_LOIGivenMessageWithEntity;
  NSStringFromSelector(sel_LOIGivenMessageWithEntity);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v145, (uint64_t)v144, LOIGivenMessageWithEntity);

  LOIGivenCallWithEntity = self->_LOIGivenCallWithEntity;
  NSStringFromSelector(sel_LOIGivenCallWithEntity);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v148, (uint64_t)v147, LOIGivenCallWithEntity);

  LOIGivenFacetimeWithEntity = self->_LOIGivenFacetimeWithEntity;
  NSStringFromSelector(sel_LOIGivenFacetimeWithEntity);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v151, (uint64_t)v150, LOIGivenFacetimeWithEntity);

  messageWithEntityGivenLOI = self->_messageWithEntityGivenLOI;
  NSStringFromSelector(sel_messageWithEntityGivenLOI);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v154, (uint64_t)v153, messageWithEntityGivenLOI);

  callWithEntityGivenLOI = self->_callWithEntityGivenLOI;
  NSStringFromSelector(sel_callWithEntityGivenLOI);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v157, (uint64_t)v156, callWithEntityGivenLOI);

  facetimeWithEntityGivenLOI = self->_facetimeWithEntityGivenLOI;
  NSStringFromSelector(sel_facetimeWithEntityGivenLOI);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v160, (uint64_t)v159, facetimeWithEntityGivenLOI);

  messagePopularityGivenSpecificGeoHash = self->_messagePopularityGivenSpecificGeoHash;
  NSStringFromSelector(sel_messagePopularityGivenSpecificGeoHash);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v163, (uint64_t)v162, messagePopularityGivenSpecificGeoHash);

  callPopularityGivenSpecificGeoHash = self->_callPopularityGivenSpecificGeoHash;
  NSStringFromSelector(sel_callPopularityGivenSpecificGeoHash);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v166, (uint64_t)v165, callPopularityGivenSpecificGeoHash);

  facetimePopularityGivenSpecificGeoHash = self->_facetimePopularityGivenSpecificGeoHash;
  NSStringFromSelector(sel_facetimePopularityGivenSpecificGeoHash);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v169, (uint64_t)v168, facetimePopularityGivenSpecificGeoHash);

  specificGeoHashGivenMessageWithEntity = self->_specificGeoHashGivenMessageWithEntity;
  NSStringFromSelector(sel_specificGeoHashGivenMessageWithEntity);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v172, (uint64_t)v171, specificGeoHashGivenMessageWithEntity);

  specificGeoHashGivenCallWithEntity = self->_specificGeoHashGivenCallWithEntity;
  NSStringFromSelector(sel_specificGeoHashGivenCallWithEntity);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v175, (uint64_t)v174, specificGeoHashGivenCallWithEntity);

  specificGeoHashGivenFacetimeWithEntity = self->_specificGeoHashGivenFacetimeWithEntity;
  NSStringFromSelector(sel_specificGeoHashGivenFacetimeWithEntity);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v178, (uint64_t)v177, specificGeoHashGivenFacetimeWithEntity);

  messageWithEntityGivenSpecificGeoHash = self->_messageWithEntityGivenSpecificGeoHash;
  NSStringFromSelector(sel_messageWithEntityGivenSpecificGeoHash);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v181, (uint64_t)v180, messageWithEntityGivenSpecificGeoHash);

  callWithEntityGivenSpecificGeoHash = self->_callWithEntityGivenSpecificGeoHash;
  NSStringFromSelector(sel_callWithEntityGivenSpecificGeoHash);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v184, (uint64_t)v183, callWithEntityGivenSpecificGeoHash);

  facetimeWithEntityGivenSpecificGeoHash = self->_facetimeWithEntityGivenSpecificGeoHash;
  NSStringFromSelector(sel_facetimeWithEntityGivenSpecificGeoHash);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v187, (uint64_t)v186, facetimeWithEntityGivenSpecificGeoHash);

  messagePopularityGivenCoarseGeoHash = self->_messagePopularityGivenCoarseGeoHash;
  NSStringFromSelector(sel_messagePopularityGivenCoarseGeoHash);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v190, (uint64_t)v189, messagePopularityGivenCoarseGeoHash);

  callPopularityGivenCoarseGeoHash = self->_callPopularityGivenCoarseGeoHash;
  NSStringFromSelector(sel_callPopularityGivenCoarseGeoHash);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v193, (uint64_t)v192, callPopularityGivenCoarseGeoHash);

  facetimePopularityGivenCoarseGeoHash = self->_facetimePopularityGivenCoarseGeoHash;
  NSStringFromSelector(sel_facetimePopularityGivenCoarseGeoHash);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v196, (uint64_t)v195, facetimePopularityGivenCoarseGeoHash);

  coarseGeoHashGivenMessageWithEntity = self->_coarseGeoHashGivenMessageWithEntity;
  NSStringFromSelector(sel_coarseGeoHashGivenMessageWithEntity);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v199, (uint64_t)v198, coarseGeoHashGivenMessageWithEntity);

  coarseGeoHashGivenCallWithEntity = self->_coarseGeoHashGivenCallWithEntity;
  NSStringFromSelector(sel_coarseGeoHashGivenCallWithEntity);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v202, (uint64_t)v201, coarseGeoHashGivenCallWithEntity);

  coarseGeoHashGivenFacetimeWithEntity = self->_coarseGeoHashGivenFacetimeWithEntity;
  NSStringFromSelector(sel_coarseGeoHashGivenFacetimeWithEntity);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v205, (uint64_t)v204, coarseGeoHashGivenFacetimeWithEntity);

  messageWithEntityGivenCoarseGeoHash = self->_messageWithEntityGivenCoarseGeoHash;
  NSStringFromSelector(sel_messageWithEntityGivenCoarseGeoHash);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v208, (uint64_t)v207, messageWithEntityGivenCoarseGeoHash);

  callWithEntityGivenCoarseGeoHash = self->_callWithEntityGivenCoarseGeoHash;
  NSStringFromSelector(sel_callWithEntityGivenCoarseGeoHash);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v211, (uint64_t)v210, callWithEntityGivenCoarseGeoHash);

  facetimeWithEntityGivenCoarseGeoHash = self->_facetimeWithEntityGivenCoarseGeoHash;
  NSStringFromSelector(sel_facetimeWithEntityGivenCoarseGeoHash);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v214, (uint64_t)v213, facetimeWithEntityGivenCoarseGeoHash);

  messagePopularityGivenLargeGeoHash = self->_messagePopularityGivenLargeGeoHash;
  NSStringFromSelector(sel_messagePopularityGivenLargeGeoHash);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v217, (uint64_t)v216, messagePopularityGivenLargeGeoHash);

  callPopularityGivenLargeGeoHash = self->_callPopularityGivenLargeGeoHash;
  NSStringFromSelector(sel_callPopularityGivenLargeGeoHash);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v220, (uint64_t)v219, callPopularityGivenLargeGeoHash);

  facetimePopularityGivenLargeGeoHash = self->_facetimePopularityGivenLargeGeoHash;
  NSStringFromSelector(sel_facetimePopularityGivenLargeGeoHash);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v223, (uint64_t)v222, facetimePopularityGivenLargeGeoHash);

  largeGeoHashGivenMessageWithEntity = self->_largeGeoHashGivenMessageWithEntity;
  NSStringFromSelector(sel_largeGeoHashGivenMessageWithEntity);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v226, (uint64_t)v225, largeGeoHashGivenMessageWithEntity);

  largeGeoHashGivenCallWithEntity = self->_largeGeoHashGivenCallWithEntity;
  NSStringFromSelector(sel_largeGeoHashGivenCallWithEntity);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v229, (uint64_t)v228, largeGeoHashGivenCallWithEntity);

  largeGeoHashGivenFacetimeWithEntity = self->_largeGeoHashGivenFacetimeWithEntity;
  NSStringFromSelector(sel_largeGeoHashGivenFacetimeWithEntity);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v232, (uint64_t)v231, largeGeoHashGivenFacetimeWithEntity);

  messageWithEntityGivenLargeGeoHash = self->_messageWithEntityGivenLargeGeoHash;
  NSStringFromSelector(sel_messageWithEntityGivenLargeGeoHash);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v235, (uint64_t)v234, messageWithEntityGivenLargeGeoHash);

  callWithEntityGivenLargeGeoHash = self->_callWithEntityGivenLargeGeoHash;
  NSStringFromSelector(sel_callWithEntityGivenLargeGeoHash);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v238, (uint64_t)v237, callWithEntityGivenLargeGeoHash);

  facetimeWithEntityGivenLargeGeoHash = self->_facetimeWithEntityGivenLargeGeoHash;
  NSStringFromSelector(sel_facetimeWithEntityGivenLargeGeoHash);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v241, (uint64_t)v240, facetimeWithEntityGivenLargeGeoHash);

  messagePopularityGivenMicroLocation = self->_messagePopularityGivenMicroLocation;
  NSStringFromSelector(sel_messagePopularityGivenMicroLocation);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v244, (uint64_t)v243, messagePopularityGivenMicroLocation);

  callPopularityGivenMicroLocation = self->_callPopularityGivenMicroLocation;
  NSStringFromSelector(sel_callPopularityGivenMicroLocation);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v247, (uint64_t)v246, callPopularityGivenMicroLocation);

  facetimePopularityGivenMicroLocation = self->_facetimePopularityGivenMicroLocation;
  NSStringFromSelector(sel_facetimePopularityGivenMicroLocation);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v250, (uint64_t)v249, facetimePopularityGivenMicroLocation);

  microLocationGivenMessageWithEntity = self->_microLocationGivenMessageWithEntity;
  NSStringFromSelector(sel_microLocationGivenMessageWithEntity);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v253, (uint64_t)v252, microLocationGivenMessageWithEntity);

  microLocationGivenCallWithEntity = self->_microLocationGivenCallWithEntity;
  NSStringFromSelector(sel_microLocationGivenCallWithEntity);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v256, (uint64_t)v255, microLocationGivenCallWithEntity);

  microLocationGivenFacetimeWithEntity = self->_microLocationGivenFacetimeWithEntity;
  NSStringFromSelector(sel_microLocationGivenFacetimeWithEntity);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v259, (uint64_t)v258, microLocationGivenFacetimeWithEntity);

  messageWithEntityGivenMicroLocation = self->_messageWithEntityGivenMicroLocation;
  NSStringFromSelector(sel_messageWithEntityGivenMicroLocation);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v262, (uint64_t)v261, messageWithEntityGivenMicroLocation);

  callWithEntityGivenMicroLocation = self->_callWithEntityGivenMicroLocation;
  NSStringFromSelector(sel_callWithEntityGivenMicroLocation);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v265, (uint64_t)v264, callWithEntityGivenMicroLocation);

  facetimeWithEntityGivenMicroLocation = self->_facetimeWithEntityGivenMicroLocation;
  NSStringFromSelector(sel_facetimeWithEntityGivenMicroLocation);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v268, (uint64_t)v267, facetimeWithEntityGivenMicroLocation);

  messagePopularityGivenMotionState = self->_messagePopularityGivenMotionState;
  NSStringFromSelector(sel_messagePopularityGivenMotionState);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v271, (uint64_t)v270, messagePopularityGivenMotionState);

  callPopularityGivenMotionState = self->_callPopularityGivenMotionState;
  NSStringFromSelector(sel_callPopularityGivenMotionState);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v274, (uint64_t)v273, callPopularityGivenMotionState);

  facetimePopularityGivenMotionState = self->_facetimePopularityGivenMotionState;
  NSStringFromSelector(sel_facetimePopularityGivenMotionState);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v277, (uint64_t)v276, facetimePopularityGivenMotionState);

  motionStateGivenMessageWithEntity = self->_motionStateGivenMessageWithEntity;
  NSStringFromSelector(sel_motionStateGivenMessageWithEntity);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v280, (uint64_t)v279, motionStateGivenMessageWithEntity);

  motionStateGivenCallWithEntity = self->_motionStateGivenCallWithEntity;
  NSStringFromSelector(sel_motionStateGivenCallWithEntity);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v283, (uint64_t)v282, motionStateGivenCallWithEntity);

  motionStateGivenFacetimeWithEntity = self->_motionStateGivenFacetimeWithEntity;
  NSStringFromSelector(sel_motionStateGivenFacetimeWithEntity);
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v286, (uint64_t)v285, motionStateGivenFacetimeWithEntity);

  messageWithEntityGivenMotionState = self->_messageWithEntityGivenMotionState;
  NSStringFromSelector(sel_messageWithEntityGivenMotionState);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v289, (uint64_t)v288, messageWithEntityGivenMotionState);

  callWithEntityGivenMotionState = self->_callWithEntityGivenMotionState;
  NSStringFromSelector(sel_callWithEntityGivenMotionState);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v292, (uint64_t)v291, callWithEntityGivenMotionState);

  facetimeWithEntityGivenMotionState = self->_facetimeWithEntityGivenMotionState;
  NSStringFromSelector(sel_facetimeWithEntityGivenMotionState);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v295, (uint64_t)v294, facetimeWithEntityGivenMotionState);

  messagePopularityGivenWiFi = self->_messagePopularityGivenWiFi;
  NSStringFromSelector(sel_messagePopularityGivenWiFi);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v298, (uint64_t)v297, messagePopularityGivenWiFi);

  callPopularityGivenWiFi = self->_callPopularityGivenWiFi;
  NSStringFromSelector(sel_callPopularityGivenWiFi);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v301, (uint64_t)v300, callPopularityGivenWiFi);

  facetimePopularityGivenWiFi = self->_facetimePopularityGivenWiFi;
  NSStringFromSelector(sel_facetimePopularityGivenWiFi);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v304, (uint64_t)v303, facetimePopularityGivenWiFi);

  wiFiGivenMessageWithEntity = self->_wiFiGivenMessageWithEntity;
  NSStringFromSelector(sel_wiFiGivenMessageWithEntity);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v307, (uint64_t)v306, wiFiGivenMessageWithEntity);

  wiFiGivenCallWithEntity = self->_wiFiGivenCallWithEntity;
  NSStringFromSelector(sel_wiFiGivenCallWithEntity);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v310, (uint64_t)v309, wiFiGivenCallWithEntity);

  wiFiGivenFacetimeWithEntity = self->_wiFiGivenFacetimeWithEntity;
  NSStringFromSelector(sel_wiFiGivenFacetimeWithEntity);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v313, (uint64_t)v312, wiFiGivenFacetimeWithEntity);

  messageWithEntityGivenWiFi = self->_messageWithEntityGivenWiFi;
  NSStringFromSelector(sel_messageWithEntityGivenWiFi);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v316, (uint64_t)v315, messageWithEntityGivenWiFi);

  callWithEntityGivenWiFi = self->_callWithEntityGivenWiFi;
  NSStringFromSelector(sel_callWithEntityGivenWiFi);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v319, (uint64_t)v318, callWithEntityGivenWiFi);

  facetimeWithEntityGivenWiFi = self->_facetimeWithEntityGivenWiFi;
  NSStringFromSelector(sel_facetimeWithEntityGivenWiFi);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v322, (uint64_t)v321, facetimeWithEntityGivenWiFi);

  messagePopularityGivenSequence = self->_messagePopularityGivenSequence;
  NSStringFromSelector(sel_messagePopularityGivenSequence);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v325, (uint64_t)v324, messagePopularityGivenSequence);

  callPopularityGivenSequence = self->_callPopularityGivenSequence;
  NSStringFromSelector(sel_callPopularityGivenSequence);
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v328, (uint64_t)v327, callPopularityGivenSequence);

  facetimePopularityGivenSequence = self->_facetimePopularityGivenSequence;
  NSStringFromSelector(sel_facetimePopularityGivenSequence);
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v331, (uint64_t)v330, facetimePopularityGivenSequence);

  sequenceGivenMessageWithEntity = self->_sequenceGivenMessageWithEntity;
  NSStringFromSelector(sel_sequenceGivenMessageWithEntity);
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v334, (uint64_t)v333, sequenceGivenMessageWithEntity);

  sequenceGivenCallWithEntity = self->_sequenceGivenCallWithEntity;
  NSStringFromSelector(sel_sequenceGivenCallWithEntity);
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v337, (uint64_t)v336, sequenceGivenCallWithEntity);

  sequenceGivenFacetimeWithEntity = self->_sequenceGivenFacetimeWithEntity;
  NSStringFromSelector(sel_sequenceGivenFacetimeWithEntity);
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v340, (uint64_t)v339, sequenceGivenFacetimeWithEntity);

  lastExecutionAge = self->_lastExecutionAge;
  NSStringFromSelector(sel_lastExecutionAge);
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInt_forKey_(v5, v343, lastExecutionAge, v342);

  medianTimeIntervalBetweenExecution = self->_medianTimeIntervalBetweenExecution;
  NSStringFromSelector(sel_medianTimeIntervalBetweenExecution);
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInt_forKey_(v5, v346, medianTimeIntervalBetweenExecution, v345);

  dailyDoseL1Error = self->_dailyDoseL1Error;
  NSStringFromSelector(sel_dailyDoseL1Error);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInt_forKey_(v5, v349, dailyDoseL1Error, v348);

  dailyDoseL2Error = self->_dailyDoseL2Error;
  NSStringFromSelector(sel_dailyDoseL2Error);
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v352, (uint64_t)v351, dailyDoseL2Error);

  shortTermTrendingPopularity = self->_shortTermTrendingPopularity;
  NSStringFromSelector(sel_shortTermTrendingPopularity);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v355, (uint64_t)v354, shortTermTrendingPopularity);

  trendingPopularity = self->_trendingPopularity;
  NSStringFromSelector(sel_trendingPopularity);
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v358, (uint64_t)v357, trendingPopularity);

  longTermTrendingPopularity = self->_longTermTrendingPopularity;
  NSStringFromSelector(sel_longTermTrendingPopularity);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v361, (uint64_t)v360, longTermTrendingPopularity);

  locationLastExecutionAge = self->_locationLastExecutionAge;
  NSStringFromSelector(sel_locationLastExecutionAge);
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInt_forKey_(v5, v364, locationLastExecutionAge, v363);

  locationTrendingPopularity = self->_locationTrendingPopularity;
  NSStringFromSelector(sel_locationTrendingPopularity);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v367, (uint64_t)v366, locationTrendingPopularity);

  locationPopularityGivenSpecificGeoHash = self->_locationPopularityGivenSpecificGeoHash;
  NSStringFromSelector(sel_locationPopularityGivenSpecificGeoHash);
  v370 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v369, (uint64_t)v370, locationPopularityGivenSpecificGeoHash);

}

- (GDEntityFeatures)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
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
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  void *v178;
  const char *v179;
  void *v180;
  const char *v181;
  void *v182;
  const char *v183;
  void *v184;
  const char *v185;
  void *v186;
  const char *v187;
  void *v188;
  const char *v189;
  void *v190;
  const char *v191;
  void *v192;
  const char *v193;
  void *v194;
  const char *v195;
  void *v196;
  const char *v197;
  void *v198;
  const char *v199;
  void *v200;
  const char *v201;
  void *v202;
  const char *v203;
  void *v204;
  const char *v205;
  void *v206;
  const char *v207;
  void *v208;
  const char *v209;
  void *v210;
  const char *v211;
  void *v212;
  const char *v213;
  void *v214;
  const char *v215;
  void *v216;
  const char *v217;
  void *v218;
  const char *v219;
  void *v220;
  const char *v221;
  void *v222;
  const char *v223;
  void *v224;
  const char *v225;
  void *v226;
  const char *v227;
  void *v228;
  const char *v229;
  void *v230;
  const char *v231;
  void *v232;
  const char *v233;
  void *v234;
  const char *v235;
  void *v236;
  const char *v237;
  void *v238;
  const char *v239;
  void *v240;
  const char *v241;
  void *v242;
  const char *v243;
  void *v244;
  const char *v245;
  void *v246;
  const char *v247;
  void *v248;
  const char *v249;
  void *v250;
  const char *v251;
  void *v252;
  const char *v253;
  void *v254;
  const char *v255;
  void *v256;
  const char *v257;
  void *v258;
  const char *v259;
  void *v260;
  const char *v261;
  void *v262;
  const char *v263;
  void *v264;
  const char *v265;
  void *v266;
  const char *v267;
  void *v268;
  const char *v269;
  void *v270;
  const char *v271;
  void *v272;
  const char *v273;
  void *v274;
  const char *v275;
  void *v276;
  const char *v277;
  void *v278;
  const char *v279;
  void *v280;
  const char *v281;
  void *v282;
  const char *v283;
  void *v284;
  const char *v285;
  void *v286;
  const char *v287;
  uint64_t v288;
  void *v289;
  const char *v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  void *v297;
  const char *v298;
  void *v299;
  const char *v300;
  void *v301;
  const char *v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  void *v308;
  const char *v309;
  const char *v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  GDEntityFeatures *v314;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  double v365;
  double v366;
  double v367;
  double v368;
  double v369;
  double v370;
  double v371;
  double v372;

  v4 = a3;
  NSStringFromSelector(sel_candidateNameScore);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v6, (uint64_t)v5);
  v372 = v7;

  NSStringFromSelector(sel_candidateCommunicationScore);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v9, (uint64_t)v8);
  v371 = v10;

  NSStringFromSelector(sel_candidateOrganizationScore);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v12, (uint64_t)v11);
  v370 = v13;

  NSStringFromSelector(sel_candidateLocationScore);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v15, (uint64_t)v14);
  v369 = v16;

  NSStringFromSelector(sel_candidateEventLocationScore);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v18, (uint64_t)v17);
  v368 = v19;

  NSStringFromSelector(sel_candidateEventNameScore);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v21, (uint64_t)v20);
  v367 = v22;

  NSStringFromSelector(sel_topicScore);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v24, (uint64_t)v23);
  v366 = v25;

  NSStringFromSelector(sel_messagePopularityGivenTimeOfDay);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v27, (uint64_t)v26);
  v365 = v28;

  NSStringFromSelector(sel_callPopularityGivenTimeOfDay);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v30, (uint64_t)v29);
  v364 = v31;

  NSStringFromSelector(sel_facetimePopularityGivenTimeOfDay);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v33, (uint64_t)v32);
  v363 = v34;

  NSStringFromSelector(sel_timeOfDayGivenMessageWithEntity);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v36, (uint64_t)v35);
  v362 = v37;

  NSStringFromSelector(sel_timeOfDayGivenCallWithEntity);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v39, (uint64_t)v38);
  v361 = v40;

  NSStringFromSelector(sel_timeOfDayGivenFacetimeWithEntity);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v42, (uint64_t)v41);
  v360 = v43;

  NSStringFromSelector(sel_messageWithEntityGivenTimeOfDay);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v45, (uint64_t)v44);
  v359 = v46;

  NSStringFromSelector(sel_callWithEntityGivenTimeOfDay);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v48, (uint64_t)v47);
  v358 = v49;

  NSStringFromSelector(sel_facetimeWithEntityGivenTimeOfDay);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v51, (uint64_t)v50);
  v357 = v52;

  NSStringFromSelector(sel_messagePopularityGivenCoarseTimeOfDay);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v54, (uint64_t)v53);
  v356 = v55;

  NSStringFromSelector(sel_callPopularityGivenCoarseTimeOfDay);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v57, (uint64_t)v56);
  v355 = v58;

  NSStringFromSelector(sel_facetimePopularityGivenCoarseTimeOfDay);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v60, (uint64_t)v59);
  v354 = v61;

  NSStringFromSelector(sel_coarseTimeOfDayGivenMessageWithEntity);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v63, (uint64_t)v62);
  v353 = v64;

  NSStringFromSelector(sel_coarseTimeOfDayGivenCallWithEntity);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v66, (uint64_t)v65);
  v352 = v67;

  NSStringFromSelector(sel_coarseTimeOfDayGivenFacetimeWithEntity);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v69, (uint64_t)v68);
  v351 = v70;

  NSStringFromSelector(sel_messageWithEntityGivenCoarseTimeOfDay);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v72, (uint64_t)v71);
  v350 = v73;

  NSStringFromSelector(sel_callWithEntityGivenCoarseTimeOfDay);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v75, (uint64_t)v74);
  v349 = v76;

  NSStringFromSelector(sel_facetimeWithEntityGivenCoarseTimeOfDay);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v78, (uint64_t)v77);
  v348 = v79;

  NSStringFromSelector(sel_messagePopularityGivenDayOfWeek);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v81, (uint64_t)v80);
  v347 = v82;

  NSStringFromSelector(sel_callPopularityGivenDayOfWeek);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v84, (uint64_t)v83);
  v346 = v85;

  NSStringFromSelector(sel_facetimePopularityGivenDayOfWeek);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v87, (uint64_t)v86);
  v345 = v88;

  NSStringFromSelector(sel_dayOfWeekGivenMessageWithEntity);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v90, (uint64_t)v89);
  v344 = v91;

  NSStringFromSelector(sel_dayOfWeekGivenCallWithEntity);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v93, (uint64_t)v92);
  v343 = v94;

  NSStringFromSelector(sel_dayOfWeekGivenFacetimeWithEntity);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v96, (uint64_t)v95);
  v342 = v97;

  NSStringFromSelector(sel_messageWithEntityGivenDayOfWeek);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v99, (uint64_t)v98);
  v341 = v100;

  NSStringFromSelector(sel_callWithEntityGivenDayOfWeek);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v102, (uint64_t)v101);
  v340 = v103;

  NSStringFromSelector(sel_facetimeWithEntityGivenDayOfWeek);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v105, (uint64_t)v104);
  v339 = v106;

  NSStringFromSelector(sel_messagePopularityGivenFocusMode);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v108, (uint64_t)v107);
  v338 = v109;

  NSStringFromSelector(sel_callPopularityGivenFocusMode);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v111, (uint64_t)v110);
  v337 = v112;

  NSStringFromSelector(sel_facetimePopularityGivenFocusMode);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v114, (uint64_t)v113);
  v336 = v115;

  NSStringFromSelector(sel_focusModeGivenMessageWithEntity);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v117, (uint64_t)v116);
  v335 = v118;

  NSStringFromSelector(sel_focusModeGivenCallWithEntity);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v120, (uint64_t)v119);
  v334 = v121;

  NSStringFromSelector(sel_focusModeGivenFacetimeWithEntity);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v123, (uint64_t)v122);
  v333 = v124;

  NSStringFromSelector(sel_messageWithEntityGivenFocusMode);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v126, (uint64_t)v125);
  v332 = v127;

  NSStringFromSelector(sel_callWithEntityGivenFocusMode);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v129, (uint64_t)v128);
  v331 = v130;

  NSStringFromSelector(sel_facetimeWithEntityGivenFocusMode);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v132, (uint64_t)v131);
  v330 = v133;

  NSStringFromSelector(sel_messagePopularityGivenLOI);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v135, (uint64_t)v134);
  v329 = v136;

  NSStringFromSelector(sel_callPopularityGivenLOI);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v138, (uint64_t)v137);
  v328 = v139;

  NSStringFromSelector(sel_facetimePopularityGivenLOI);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v141, (uint64_t)v140);
  v327 = v142;

  NSStringFromSelector(sel_LOIGivenMessageWithEntity);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v144, (uint64_t)v143);
  v326 = v145;

  NSStringFromSelector(sel_LOIGivenCallWithEntity);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v147, (uint64_t)v146);
  v325 = v148;

  NSStringFromSelector(sel_LOIGivenFacetimeWithEntity);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v150, (uint64_t)v149);
  v324 = v151;

  NSStringFromSelector(sel_messageWithEntityGivenLOI);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v153, (uint64_t)v152);
  v323 = v154;

  NSStringFromSelector(sel_callWithEntityGivenLOI);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v156, (uint64_t)v155);
  v322 = v157;

  NSStringFromSelector(sel_facetimeWithEntityGivenLOI);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v159, (uint64_t)v158);
  v321 = v160;

  NSStringFromSelector(sel_messagePopularityGivenSpecificGeoHash);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v162, (uint64_t)v161);
  v320 = v163;

  NSStringFromSelector(sel_callPopularityGivenSpecificGeoHash);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v165, (uint64_t)v164);
  v319 = v166;

  NSStringFromSelector(sel_facetimePopularityGivenSpecificGeoHash);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v168, (uint64_t)v167);
  v318 = v169;

  NSStringFromSelector(sel_specificGeoHashGivenMessageWithEntity);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v171, (uint64_t)v170);
  v317 = v172;

  NSStringFromSelector(sel_specificGeoHashGivenCallWithEntity);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v174, (uint64_t)v173);
  v316 = v175;

  NSStringFromSelector(sel_specificGeoHashGivenFacetimeWithEntity);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v177, (uint64_t)v176);

  NSStringFromSelector(sel_messageWithEntityGivenSpecificGeoHash);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v179, (uint64_t)v178);

  NSStringFromSelector(sel_callWithEntityGivenSpecificGeoHash);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v181, (uint64_t)v180);

  NSStringFromSelector(sel_facetimeWithEntityGivenSpecificGeoHash);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v183, (uint64_t)v182);

  NSStringFromSelector(sel_messagePopularityGivenCoarseGeoHash);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v185, (uint64_t)v184);

  NSStringFromSelector(sel_callPopularityGivenCoarseGeoHash);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v187, (uint64_t)v186);

  NSStringFromSelector(sel_facetimePopularityGivenCoarseGeoHash);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v189, (uint64_t)v188);

  NSStringFromSelector(sel_coarseGeoHashGivenMessageWithEntity);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v191, (uint64_t)v190);

  NSStringFromSelector(sel_coarseGeoHashGivenCallWithEntity);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v193, (uint64_t)v192);

  NSStringFromSelector(sel_coarseGeoHashGivenFacetimeWithEntity);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v195, (uint64_t)v194);

  NSStringFromSelector(sel_messageWithEntityGivenCoarseGeoHash);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v197, (uint64_t)v196);

  NSStringFromSelector(sel_callWithEntityGivenCoarseGeoHash);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v199, (uint64_t)v198);

  NSStringFromSelector(sel_facetimeWithEntityGivenCoarseGeoHash);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v201, (uint64_t)v200);

  NSStringFromSelector(sel_messagePopularityGivenLargeGeoHash);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v203, (uint64_t)v202);

  NSStringFromSelector(sel_callPopularityGivenLargeGeoHash);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v205, (uint64_t)v204);

  NSStringFromSelector(sel_facetimePopularityGivenLargeGeoHash);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v207, (uint64_t)v206);

  NSStringFromSelector(sel_largeGeoHashGivenMessageWithEntity);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v209, (uint64_t)v208);

  NSStringFromSelector(sel_largeGeoHashGivenCallWithEntity);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v211, (uint64_t)v210);

  NSStringFromSelector(sel_largeGeoHashGivenFacetimeWithEntity);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v213, (uint64_t)v212);

  NSStringFromSelector(sel_messageWithEntityGivenLargeGeoHash);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v215, (uint64_t)v214);

  NSStringFromSelector(sel_callWithEntityGivenLargeGeoHash);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v217, (uint64_t)v216);

  NSStringFromSelector(sel_facetimeWithEntityGivenLargeGeoHash);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v219, (uint64_t)v218);

  NSStringFromSelector(sel_messagePopularityGivenMicroLocation);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v221, (uint64_t)v220);

  NSStringFromSelector(sel_callPopularityGivenMicroLocation);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v223, (uint64_t)v222);

  NSStringFromSelector(sel_facetimePopularityGivenMicroLocation);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v225, (uint64_t)v224);

  NSStringFromSelector(sel_microLocationGivenMessageWithEntity);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v227, (uint64_t)v226);

  NSStringFromSelector(sel_microLocationGivenCallWithEntity);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v229, (uint64_t)v228);

  NSStringFromSelector(sel_microLocationGivenFacetimeWithEntity);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v231, (uint64_t)v230);

  NSStringFromSelector(sel_messageWithEntityGivenMicroLocation);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v233, (uint64_t)v232);

  NSStringFromSelector(sel_callWithEntityGivenMicroLocation);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v235, (uint64_t)v234);

  NSStringFromSelector(sel_facetimeWithEntityGivenMicroLocation);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v237, (uint64_t)v236);

  NSStringFromSelector(sel_messagePopularityGivenMotionState);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v239, (uint64_t)v238);

  NSStringFromSelector(sel_callPopularityGivenMotionState);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v241, (uint64_t)v240);

  NSStringFromSelector(sel_facetimePopularityGivenMotionState);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v243, (uint64_t)v242);

  NSStringFromSelector(sel_motionStateGivenMessageWithEntity);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v245, (uint64_t)v244);

  NSStringFromSelector(sel_motionStateGivenCallWithEntity);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v247, (uint64_t)v246);

  NSStringFromSelector(sel_motionStateGivenFacetimeWithEntity);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v249, (uint64_t)v248);

  NSStringFromSelector(sel_messageWithEntityGivenMotionState);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v251, (uint64_t)v250);

  NSStringFromSelector(sel_callWithEntityGivenMotionState);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v253, (uint64_t)v252);

  NSStringFromSelector(sel_facetimeWithEntityGivenMotionState);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v255, (uint64_t)v254);

  NSStringFromSelector(sel_messagePopularityGivenWiFi);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v257, (uint64_t)v256);

  NSStringFromSelector(sel_callPopularityGivenWiFi);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v259, (uint64_t)v258);

  NSStringFromSelector(sel_facetimePopularityGivenWiFi);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v261, (uint64_t)v260);

  NSStringFromSelector(sel_wiFiGivenMessageWithEntity);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v263, (uint64_t)v262);

  NSStringFromSelector(sel_wiFiGivenCallWithEntity);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v265, (uint64_t)v264);

  NSStringFromSelector(sel_wiFiGivenFacetimeWithEntity);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v267, (uint64_t)v266);

  NSStringFromSelector(sel_messageWithEntityGivenWiFi);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v269, (uint64_t)v268);

  NSStringFromSelector(sel_callWithEntityGivenWiFi);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v271, (uint64_t)v270);

  NSStringFromSelector(sel_facetimeWithEntityGivenWiFi);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v273, (uint64_t)v272);

  NSStringFromSelector(sel_messagePopularityGivenSequence);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v275, (uint64_t)v274);

  NSStringFromSelector(sel_callPopularityGivenSequence);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v277, (uint64_t)v276);

  NSStringFromSelector(sel_facetimePopularityGivenSequence);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v279, (uint64_t)v278);

  NSStringFromSelector(sel_sequenceGivenMessageWithEntity);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v281, (uint64_t)v280);

  NSStringFromSelector(sel_sequenceGivenCallWithEntity);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v283, (uint64_t)v282);

  NSStringFromSelector(sel_sequenceGivenFacetimeWithEntity);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v285, (uint64_t)v284);

  NSStringFromSelector(sel_lastExecutionAge);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v288 = objc_msgSend_decodeIntForKey_(v4, v287, (uint64_t)v286);

  NSStringFromSelector(sel_medianTimeIntervalBetweenExecution);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v291 = objc_msgSend_decodeIntForKey_(v4, v290, (uint64_t)v289);

  NSStringFromSelector(sel_dailyDoseL1Error);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v294 = objc_msgSend_decodeIntForKey_(v4, v293, (uint64_t)v292);

  NSStringFromSelector(sel_dailyDoseL2Error);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v296, (uint64_t)v295);

  NSStringFromSelector(sel_shortTermTrendingPopularity);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v298, (uint64_t)v297);

  NSStringFromSelector(sel_trendingPopularity);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v300, (uint64_t)v299);

  NSStringFromSelector(sel_longTermTrendingPopularity);
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v302, (uint64_t)v301);

  NSStringFromSelector(sel_locationLastExecutionAge);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v305 = objc_msgSend_decodeIntForKey_(v4, v304, (uint64_t)v303);

  NSStringFromSelector(sel_locationTrendingPopularity);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v307, (uint64_t)v306);

  NSStringFromSelector(sel_locationPopularityGivenSpecificGeoHash);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v309, (uint64_t)v308);

  objc_msgSend_error(v4, v310, v311);
  v312 = (void *)objc_claimAutoreleasedReturnValue();

  if (v312)
  {
    v314 = 0;
  }
  else
  {
    self = (GDEntityFeatures *)objc_retain((id)objc_msgSend_initWithCandidateNameScore_candidateCommunicationScore_candidateOrganizationScore_candidateLocationScore_candidateEventLocationScore_candidateEventNameScore_topicScore_messagePopularityGivenTimeOfDay_callPopularityGivenTimeOfDay_facetimePopularityGivenTimeOfDay_timeOfDayGivenMessageWithEntity_timeOfDayGivenCallWithEntity_timeOfDayGivenFacetimeWithEntity_messageWithEntityGivenTimeOfDay_callWithEntityGivenTimeOfDay_facetimeWithEntityGivenTimeOfDay_messagePopularityGivenCoarseTimeOfDay_callPopularityGivenCoarseTimeOfDay_facetimePopularityGivenCoarseTimeOfDay_coarseTimeOfDayGivenMessageWithEntity_coarseTimeOfDayGivenCallWithEntity_coarseTimeOfDayGivenFacetimeWithEntity_messageWithEntityGivenCoarseTimeOfDay_callWithEntityGivenCoarseTimeOfDay_facetimeWithEntityGivenCoarseTimeOfDay_messagePopularityGivenDayOfWeek_callPopularityGivenDayOfWeek_facetimePopularityGivenDayOfWeek_dayOfWeekGivenMessageWithEntity_dayOfWeekGivenCallWithEntity_dayOfWeekGivenFacetimeWithEntity_messageWithEntityGivenDayOfWeek_callWithEntityGivenDayOfWeek_facetimeWithEntityGivenDayOfWeek_messagePopularityGivenFocusMode_callPopularityGivenFocusMode_facetimePopularityGivenFocusMode_focusModeGivenMessageWithEntity_focusModeGivenCallWithEntity_focusModeGivenFacetimeWithEntity_messageWithEntityGivenFocusMode_callWithEntityGivenFocusMode_facetimeWithEntityGivenFocusMode_messagePopularityGivenLOI_callPopularityGivenLOI_facetimePopularityGivenLOI_LOIGivenMessageWithEntity_LOIGivenCallWithEntity_LOIGivenFacetimeWithEntity_messageWithEntityGivenLOI_callWithEntityGivenLOI_facetimeWithEntityGivenLOI_messagePopularityGivenSpecificGeoHash_callPopularityGivenSpecificGeoHash_facetimePopularityGivenSpecificGeoHash_specificGeoHashGivenMessageWithEntity_specificGeoHashGivenCallWithEntity_specificGeoHashGivenFacetimeWithEntity_messageWithEntityGivenSpecificGeoHash_callWithEntityGivenSpecificGeoHash_facetimeWithEntityGivenSpecificGeoHash_messagePopularityGivenCoarseGeoHash_callPopularityGivenCoarseGeoHash_facetimePopularityGivenCoarseGeoHash_coarseGeoHashGivenMessageWithEntity_coarseGeoHashGivenCallWithEntity_coarseGeoHashGivenFacetimeWithEntity_messageWithEntityGivenCoarseGeoHash_callWithEntityGivenCoarseGeoHash_facetimeWithEntityGivenCoarseGeoHash_messagePopularityGivenLargeGeoHash_callPopularityGivenLargeGeoHash_facetimePopularityGivenLargeGeoHash_largeGeoHashGivenMessageWithEntity_largeGeoHashGivenCallWithEntity_largeGeoHashGivenFacetimeWithEntity_messageWithEntityGivenLargeGeoHash_callWithEntityGivenLargeGeoHash_facetimeWithEntityGivenLargeGeoHash_messagePopularityGivenMicroLocation_callPopularityGivenMicroLocation_facetimePopularityGivenMicroLocation_microLocationGivenMessageWithEntity_microLocationGivenCallWithEntity_microLocationGivenFacetimeWithEntity_messageWithEntityGivenMicroLocation_callWithEntityGivenMicroLocation_facetimeWithEntityGivenMicroLocation_messagePopularityGivenMotionState_callPopularityGivenMotionState_facetimePopularityGivenMotionState_motionStateGivenMessageWithEntity_motionStateGivenCallWithEntity_motionStateGivenFacetimeWithEntity_messageWithEntityGivenMotionState_callWithEntityGivenMotionState_facetimeWithEntityGivenMotionState_messagePopularityGivenWiFi_callPopularityGivenWiFi_facetimePopularityGivenWiFi_wiFiGivenMessageWithEntity_wiFiGivenCallWithEntity_wiFiGivenFacetimeWithEntity_messageWithEntityGivenWiFi_callWithEntityGivenWiFi_facetimeWithEntityGivenWiFi_messagePopularityGivenSequence_callPopularityGivenSequence_facetimePopularityGivenSequence_sequenceGivenMessageWithEntity_sequenceGivenCallWithEntity_sequenceGivenFacetimeWithEntity_lastExecutionAge_medianTimeIntervalBetweenExecution_dailyDoseL1Error_dailyDoseL2Error_shortTermTrendingPopularity_trendingPopularity_longTermTrendingPopularity_locationLastExecutationAge_locationPopularityGivenSpecificGeoHash_locationTrendingPopularity_(self, v313, v288, v291, v294, v305, v372, v371, v370, v369, v368, v367, v366, v365, v364, v363, v362, v361, v360,
                                                 v359,
                                                 v358,
                                                 v357,
                                                 v356,
                                                 v355,
                                                 v354,
                                                 v353,
                                                 v352,
                                                 v351,
                                                 v350,
                                                 v349,
                                                 v348,
                                                 v347,
                                                 v346,
                                                 v345,
                                                 v344,
                                                 v343,
                                                 v342,
                                                 v341,
                                                 v340,
                                                 v339,
                                                 v338,
                                                 v337,
                                                 v336,
                                                 v335,
                                                 v334,
                                                 v333,
                                                 v332,
                                                 v331,
                                                 v330,
                                                 v329,
                                                 v328,
                                                 v327,
                                                 v326,
                                                 v325,
                                                 v324,
                                                 v323,
                                                 v322,
                                                 v321,
                                                 v320,
                                                 v319,
                                                 v318,
                                                 v317,
                                                 v316));
    v314 = self;
  }

  return v314;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)objc_msgSend_initWithCandidateNameScore_candidateCommunicationScore_candidateOrganizationScore_candidateLocationScore_candidateEventLocationScore_candidateEventNameScore_topicScore_messagePopularityGivenTimeOfDay_callPopularityGivenTimeOfDay_facetimePopularityGivenTimeOfDay_timeOfDayGivenMessageWithEntity_timeOfDayGivenCallWithEntity_timeOfDayGivenFacetimeWithEntity_messageWithEntityGivenTimeOfDay_callWithEntityGivenTimeOfDay_facetimeWithEntityGivenTimeOfDay_messagePopularityGivenCoarseTimeOfDay_callPopularityGivenCoarseTimeOfDay_facetimePopularityGivenCoarseTimeOfDay_coarseTimeOfDayGivenMessageWithEntity_coarseTimeOfDayGivenCallWithEntity_coarseTimeOfDayGivenFacetimeWithEntity_messageWithEntityGivenCoarseTimeOfDay_callWithEntityGivenCoarseTimeOfDay_facetimeWithEntityGivenCoarseTimeOfDay_messagePopularityGivenDayOfWeek_callPopularityGivenDayOfWeek_facetimePopularityGivenDayOfWeek_dayOfWeekGivenMessageWithEntity_dayOfWeekGivenCallWithEntity_dayOfWeekGivenFacetimeWithEntity_messageWithEntityGivenDayOfWeek_callWithEntityGivenDayOfWeek_facetimeWithEntityGivenDayOfWeek_messagePopularityGivenFocusMode_callPopularityGivenFocusMode_facetimePopularityGivenFocusMode_focusModeGivenMessageWithEntity_focusModeGivenCallWithEntity_focusModeGivenFacetimeWithEntity_messageWithEntityGivenFocusMode_callWithEntityGivenFocusMode_facetimeWithEntityGivenFocusMode_messagePopularityGivenLOI_callPopularityGivenLOI_facetimePopularityGivenLOI_LOIGivenMessageWithEntity_LOIGivenCallWithEntity_LOIGivenFacetimeWithEntity_messageWithEntityGivenLOI_callWithEntityGivenLOI_facetimeWithEntityGivenLOI_messagePopularityGivenSpecificGeoHash_callPopularityGivenSpecificGeoHash_facetimePopularityGivenSpecificGeoHash_specificGeoHashGivenMessageWithEntity_specificGeoHashGivenCallWithEntity_specificGeoHashGivenFacetimeWithEntity_messageWithEntityGivenSpecificGeoHash_callWithEntityGivenSpecificGeoHash_facetimeWithEntityGivenSpecificGeoHash_messagePopularityGivenCoarseGeoHash_callPopularityGivenCoarseGeoHash_facetimePopularityGivenCoarseGeoHash_coarseGeoHashGivenMessageWithEntity_coarseGeoHashGivenCallWithEntity_coarseGeoHashGivenFacetimeWithEntity_messageWithEntityGivenCoarseGeoHash_callWithEntityGivenCoarseGeoHash_facetimeWithEntityGivenCoarseGeoHash_messagePopularityGivenLargeGeoHash_callPopularityGivenLargeGeoHash_facetimePopularityGivenLargeGeoHash_largeGeoHashGivenMessageWithEntity_largeGeoHashGivenCallWithEntity_largeGeoHashGivenFacetimeWithEntity_messageWithEntityGivenLargeGeoHash_callWithEntityGivenLargeGeoHash_facetimeWithEntityGivenLargeGeoHash_messagePopularityGivenMicroLocation_callPopularityGivenMicroLocation_facetimePopularityGivenMicroLocation_microLocationGivenMessageWithEntity_microLocationGivenCallWithEntity_microLocationGivenFacetimeWithEntity_messageWithEntityGivenMicroLocation_callWithEntityGivenMicroLocation_facetimeWithEntityGivenMicroLocation_messagePopularityGivenMotionState_callPopularityGivenMotionState_facetimePopularityGivenMotionState_motionStateGivenMessageWithEntity_motionStateGivenCallWithEntity_motionStateGivenFacetimeWithEntity_messageWithEntityGivenMotionState_callWithEntityGivenMotionState_facetimeWithEntityGivenMotionState_messagePopularityGivenWiFi_callPopularityGivenWiFi_facetimePopularityGivenWiFi_wiFiGivenMessageWithEntity_wiFiGivenCallWithEntity_wiFiGivenFacetimeWithEntity_messageWithEntityGivenWiFi_callWithEntityGivenWiFi_facetimeWithEntityGivenWiFi_messagePopularityGivenSequence_callPopularityGivenSequence_facetimePopularityGivenSequence_sequenceGivenMessageWithEntity_sequenceGivenCallWithEntity_sequenceGivenFacetimeWithEntity_lastExecutionAge_medianTimeIntervalBetweenExecution_dailyDoseL1Error_dailyDoseL2Error_shortTermTrendingPopularity_trendingPopularity_longTermTrendingPopularity_locationLastExecutationAge_locationPopularityGivenSpecificGeoHash_locationTrendingPopularity_(v7, v8, self->_lastExecutionAge, self->_medianTimeIntervalBetweenExecution, self->_dailyDoseL1Error, self->_locationLastExecutionAge, self->_candidateNameScore, self->_candidateCommunicationScore, self->_candidateOrganizationScore, self->_candidateLocationScore, self->_candidateEventLocationScore, self->_candidateEventNameScore, self->_topicScore, self->_messagePopularityGivenTimeOfDay, *(_QWORD *)&self->_callPopularityGivenTimeOfDay, *(_QWORD *)&self->_facetimePopularityGivenTimeOfDay, *(_QWORD *)&self->_timeOfDayGivenMessageWithEntity, *(_QWORD *)&self->_timeOfDayGivenCallWithEntity, *(_QWORD *)&self->_timeOfDayGivenFacetimeWithEntity,
               *(_QWORD *)&self->_messageWithEntityGivenTimeOfDay,
               *(_QWORD *)&self->_callWithEntityGivenTimeOfDay,
               *(_QWORD *)&self->_facetimeWithEntityGivenTimeOfDay,
               *(_QWORD *)&self->_messagePopularityGivenCoarseTimeOfDay,
               *(_QWORD *)&self->_callPopularityGivenCoarseTimeOfDay,
               *(_QWORD *)&self->_facetimePopularityGivenCoarseTimeOfDay,
               *(_QWORD *)&self->_coarseTimeOfDayGivenMessageWithEntity,
               *(_OWORD *)&self->_coarseTimeOfDayGivenCallWithEntity,
               *(_QWORD *)&self->_messageWithEntityGivenCoarseTimeOfDay,
               *(_QWORD *)&self->_callWithEntityGivenCoarseTimeOfDay,
               *(_OWORD *)&self->_facetimeWithEntityGivenCoarseTimeOfDay,
               *(_OWORD *)&self->_callPopularityGivenDayOfWeek,
               *(_OWORD *)&self->_dayOfWeekGivenMessageWithEntity,
               *(_OWORD *)&self->_dayOfWeekGivenFacetimeWithEntity,
               *(_OWORD *)&self->_callWithEntityGivenDayOfWeek,
               *(_OWORD *)&self->_messagePopularityGivenFocusMode,
               *(_OWORD *)&self->_facetimePopularityGivenFocusMode,
               *(_OWORD *)&self->_focusModeGivenCallWithEntity,
               *(_OWORD *)&self->_messageWithEntityGivenFocusMode,
               *(_OWORD *)&self->_facetimeWithEntityGivenFocusMode,
               *(_OWORD *)&self->_callPopularityGivenLOI,
               *(_OWORD *)&self->_LOIGivenMessageWithEntity,
               *(_OWORD *)&self->_LOIGivenFacetimeWithEntity,
               *(_OWORD *)&self->_callWithEntityGivenLOI,
               *(_OWORD *)&self->_messagePopularityGivenSpecificGeoHash,
               *(_OWORD *)&self->_facetimePopularityGivenSpecificGeoHash,
               *(_QWORD *)&self->_specificGeoHashGivenCallWithEntity);
}

- (id)description
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_candidateNameScore(self, a2, v2);
  v6 = v5;
  objc_msgSend_candidateCommunicationScore(self, v7, v8);
  v10 = v9;
  objc_msgSend_candidateLocationScore(self, v11, v12);
  v14 = v13;
  objc_msgSend_candidateEventNameScore(self, v15, v16);
  v18 = v17;
  objc_msgSend_candidateOrganizationScore(self, v19, v20);
  v22 = v21;
  objc_msgSend_messagePopularityGivenCoarseTimeOfDay(self, v23, v24);
  v26 = v25;
  objc_msgSend_locationTrendingPopularity(self, v27, v28);
  return (id)objc_msgSend_stringWithFormat_(v4, v29, (uint64_t)CFSTR("<GDEntityFeatures: name score: %f, communication score: %f, location score: %f, event name score: %f, misc/organization score: %f, course time of day message score: %f, location trending popularity: %f>"), v6, v10, v14, v18, v22, v26, v30);
}

- (double)candidateNameSimilarity
{
  return self->_candidateNameSimilarity;
}

- (double)candidateNameScore
{
  return self->_candidateNameScore;
}

- (double)candidateCommunicationScore
{
  return self->_candidateCommunicationScore;
}

- (double)candidateOrganizationScore
{
  return self->_candidateOrganizationScore;
}

- (double)candidateLocationScore
{
  return self->_candidateLocationScore;
}

- (double)candidateEventLocationScore
{
  return self->_candidateEventLocationScore;
}

- (double)candidateEventNameScore
{
  return self->_candidateEventNameScore;
}

- (double)topicScore
{
  return self->_topicScore;
}

- (double)messagePopularityGivenTimeOfDay
{
  return self->_messagePopularityGivenTimeOfDay;
}

- (double)callPopularityGivenTimeOfDay
{
  return self->_callPopularityGivenTimeOfDay;
}

- (double)facetimePopularityGivenTimeOfDay
{
  return self->_facetimePopularityGivenTimeOfDay;
}

- (double)timeOfDayGivenMessageWithEntity
{
  return self->_timeOfDayGivenMessageWithEntity;
}

- (double)timeOfDayGivenCallWithEntity
{
  return self->_timeOfDayGivenCallWithEntity;
}

- (double)timeOfDayGivenFacetimeWithEntity
{
  return self->_timeOfDayGivenFacetimeWithEntity;
}

- (double)messageWithEntityGivenTimeOfDay
{
  return self->_messageWithEntityGivenTimeOfDay;
}

- (double)callWithEntityGivenTimeOfDay
{
  return self->_callWithEntityGivenTimeOfDay;
}

- (double)facetimeWithEntityGivenTimeOfDay
{
  return self->_facetimeWithEntityGivenTimeOfDay;
}

- (double)messagePopularityGivenCoarseTimeOfDay
{
  return self->_messagePopularityGivenCoarseTimeOfDay;
}

- (double)callPopularityGivenCoarseTimeOfDay
{
  return self->_callPopularityGivenCoarseTimeOfDay;
}

- (double)facetimePopularityGivenCoarseTimeOfDay
{
  return self->_facetimePopularityGivenCoarseTimeOfDay;
}

- (double)coarseTimeOfDayGivenMessageWithEntity
{
  return self->_coarseTimeOfDayGivenMessageWithEntity;
}

- (double)coarseTimeOfDayGivenCallWithEntity
{
  return self->_coarseTimeOfDayGivenCallWithEntity;
}

- (double)coarseTimeOfDayGivenFacetimeWithEntity
{
  return self->_coarseTimeOfDayGivenFacetimeWithEntity;
}

- (double)messageWithEntityGivenCoarseTimeOfDay
{
  return self->_messageWithEntityGivenCoarseTimeOfDay;
}

- (double)callWithEntityGivenCoarseTimeOfDay
{
  return self->_callWithEntityGivenCoarseTimeOfDay;
}

- (double)facetimeWithEntityGivenCoarseTimeOfDay
{
  return self->_facetimeWithEntityGivenCoarseTimeOfDay;
}

- (double)messagePopularityGivenDayOfWeek
{
  return self->_messagePopularityGivenDayOfWeek;
}

- (double)callPopularityGivenDayOfWeek
{
  return self->_callPopularityGivenDayOfWeek;
}

- (double)facetimePopularityGivenDayOfWeek
{
  return self->_facetimePopularityGivenDayOfWeek;
}

- (double)dayOfWeekGivenMessageWithEntity
{
  return self->_dayOfWeekGivenMessageWithEntity;
}

- (double)dayOfWeekGivenCallWithEntity
{
  return self->_dayOfWeekGivenCallWithEntity;
}

- (double)dayOfWeekGivenFacetimeWithEntity
{
  return self->_dayOfWeekGivenFacetimeWithEntity;
}

- (double)messageWithEntityGivenDayOfWeek
{
  return self->_messageWithEntityGivenDayOfWeek;
}

- (double)callWithEntityGivenDayOfWeek
{
  return self->_callWithEntityGivenDayOfWeek;
}

- (double)facetimeWithEntityGivenDayOfWeek
{
  return self->_facetimeWithEntityGivenDayOfWeek;
}

- (double)messagePopularityGivenFocusMode
{
  return self->_messagePopularityGivenFocusMode;
}

- (double)callPopularityGivenFocusMode
{
  return self->_callPopularityGivenFocusMode;
}

- (double)facetimePopularityGivenFocusMode
{
  return self->_facetimePopularityGivenFocusMode;
}

- (double)focusModeGivenMessageWithEntity
{
  return self->_focusModeGivenMessageWithEntity;
}

- (double)focusModeGivenCallWithEntity
{
  return self->_focusModeGivenCallWithEntity;
}

- (double)focusModeGivenFacetimeWithEntity
{
  return self->_focusModeGivenFacetimeWithEntity;
}

- (double)messageWithEntityGivenFocusMode
{
  return self->_messageWithEntityGivenFocusMode;
}

- (double)callWithEntityGivenFocusMode
{
  return self->_callWithEntityGivenFocusMode;
}

- (double)facetimeWithEntityGivenFocusMode
{
  return self->_facetimeWithEntityGivenFocusMode;
}

- (double)messagePopularityGivenLOI
{
  return self->_messagePopularityGivenLOI;
}

- (double)callPopularityGivenLOI
{
  return self->_callPopularityGivenLOI;
}

- (double)facetimePopularityGivenLOI
{
  return self->_facetimePopularityGivenLOI;
}

- (double)LOIGivenMessageWithEntity
{
  return self->_LOIGivenMessageWithEntity;
}

- (double)LOIGivenCallWithEntity
{
  return self->_LOIGivenCallWithEntity;
}

- (double)LOIGivenFacetimeWithEntity
{
  return self->_LOIGivenFacetimeWithEntity;
}

- (double)messageWithEntityGivenLOI
{
  return self->_messageWithEntityGivenLOI;
}

- (double)callWithEntityGivenLOI
{
  return self->_callWithEntityGivenLOI;
}

- (double)facetimeWithEntityGivenLOI
{
  return self->_facetimeWithEntityGivenLOI;
}

- (double)messagePopularityGivenSpecificGeoHash
{
  return self->_messagePopularityGivenSpecificGeoHash;
}

- (double)callPopularityGivenSpecificGeoHash
{
  return self->_callPopularityGivenSpecificGeoHash;
}

- (double)facetimePopularityGivenSpecificGeoHash
{
  return self->_facetimePopularityGivenSpecificGeoHash;
}

- (double)specificGeoHashGivenMessageWithEntity
{
  return self->_specificGeoHashGivenMessageWithEntity;
}

- (double)specificGeoHashGivenCallWithEntity
{
  return self->_specificGeoHashGivenCallWithEntity;
}

- (double)specificGeoHashGivenFacetimeWithEntity
{
  return self->_specificGeoHashGivenFacetimeWithEntity;
}

- (double)messageWithEntityGivenSpecificGeoHash
{
  return self->_messageWithEntityGivenSpecificGeoHash;
}

- (double)callWithEntityGivenSpecificGeoHash
{
  return self->_callWithEntityGivenSpecificGeoHash;
}

- (double)facetimeWithEntityGivenSpecificGeoHash
{
  return self->_facetimeWithEntityGivenSpecificGeoHash;
}

- (double)messagePopularityGivenCoarseGeoHash
{
  return self->_messagePopularityGivenCoarseGeoHash;
}

- (double)callPopularityGivenCoarseGeoHash
{
  return self->_callPopularityGivenCoarseGeoHash;
}

- (double)facetimePopularityGivenCoarseGeoHash
{
  return self->_facetimePopularityGivenCoarseGeoHash;
}

- (double)coarseGeoHashGivenMessageWithEntity
{
  return self->_coarseGeoHashGivenMessageWithEntity;
}

- (double)coarseGeoHashGivenCallWithEntity
{
  return self->_coarseGeoHashGivenCallWithEntity;
}

- (double)coarseGeoHashGivenFacetimeWithEntity
{
  return self->_coarseGeoHashGivenFacetimeWithEntity;
}

- (double)messageWithEntityGivenCoarseGeoHash
{
  return self->_messageWithEntityGivenCoarseGeoHash;
}

- (double)callWithEntityGivenCoarseGeoHash
{
  return self->_callWithEntityGivenCoarseGeoHash;
}

- (double)facetimeWithEntityGivenCoarseGeoHash
{
  return self->_facetimeWithEntityGivenCoarseGeoHash;
}

- (double)messagePopularityGivenLargeGeoHash
{
  return self->_messagePopularityGivenLargeGeoHash;
}

- (double)callPopularityGivenLargeGeoHash
{
  return self->_callPopularityGivenLargeGeoHash;
}

- (double)facetimePopularityGivenLargeGeoHash
{
  return self->_facetimePopularityGivenLargeGeoHash;
}

- (double)largeGeoHashGivenMessageWithEntity
{
  return self->_largeGeoHashGivenMessageWithEntity;
}

- (double)largeGeoHashGivenCallWithEntity
{
  return self->_largeGeoHashGivenCallWithEntity;
}

- (double)largeGeoHashGivenFacetimeWithEntity
{
  return self->_largeGeoHashGivenFacetimeWithEntity;
}

- (double)messageWithEntityGivenLargeGeoHash
{
  return self->_messageWithEntityGivenLargeGeoHash;
}

- (double)callWithEntityGivenLargeGeoHash
{
  return self->_callWithEntityGivenLargeGeoHash;
}

- (double)facetimeWithEntityGivenLargeGeoHash
{
  return self->_facetimeWithEntityGivenLargeGeoHash;
}

- (double)messagePopularityGivenMicroLocation
{
  return self->_messagePopularityGivenMicroLocation;
}

- (double)callPopularityGivenMicroLocation
{
  return self->_callPopularityGivenMicroLocation;
}

- (double)facetimePopularityGivenMicroLocation
{
  return self->_facetimePopularityGivenMicroLocation;
}

- (double)microLocationGivenMessageWithEntity
{
  return self->_microLocationGivenMessageWithEntity;
}

- (double)microLocationGivenCallWithEntity
{
  return self->_microLocationGivenCallWithEntity;
}

- (double)microLocationGivenFacetimeWithEntity
{
  return self->_microLocationGivenFacetimeWithEntity;
}

- (double)messageWithEntityGivenMicroLocation
{
  return self->_messageWithEntityGivenMicroLocation;
}

- (double)callWithEntityGivenMicroLocation
{
  return self->_callWithEntityGivenMicroLocation;
}

- (double)facetimeWithEntityGivenMicroLocation
{
  return self->_facetimeWithEntityGivenMicroLocation;
}

- (double)messagePopularityGivenMotionState
{
  return self->_messagePopularityGivenMotionState;
}

- (double)callPopularityGivenMotionState
{
  return self->_callPopularityGivenMotionState;
}

- (double)facetimePopularityGivenMotionState
{
  return self->_facetimePopularityGivenMotionState;
}

- (double)motionStateGivenMessageWithEntity
{
  return self->_motionStateGivenMessageWithEntity;
}

- (double)motionStateGivenCallWithEntity
{
  return self->_motionStateGivenCallWithEntity;
}

- (double)motionStateGivenFacetimeWithEntity
{
  return self->_motionStateGivenFacetimeWithEntity;
}

- (double)messageWithEntityGivenMotionState
{
  return self->_messageWithEntityGivenMotionState;
}

- (double)callWithEntityGivenMotionState
{
  return self->_callWithEntityGivenMotionState;
}

- (double)facetimeWithEntityGivenMotionState
{
  return self->_facetimeWithEntityGivenMotionState;
}

- (double)messagePopularityGivenWiFi
{
  return self->_messagePopularityGivenWiFi;
}

- (double)callPopularityGivenWiFi
{
  return self->_callPopularityGivenWiFi;
}

- (double)facetimePopularityGivenWiFi
{
  return self->_facetimePopularityGivenWiFi;
}

- (double)wiFiGivenMessageWithEntity
{
  return self->_wiFiGivenMessageWithEntity;
}

- (double)wiFiGivenCallWithEntity
{
  return self->_wiFiGivenCallWithEntity;
}

- (double)wiFiGivenFacetimeWithEntity
{
  return self->_wiFiGivenFacetimeWithEntity;
}

- (double)messageWithEntityGivenWiFi
{
  return self->_messageWithEntityGivenWiFi;
}

- (double)callWithEntityGivenWiFi
{
  return self->_callWithEntityGivenWiFi;
}

- (double)facetimeWithEntityGivenWiFi
{
  return self->_facetimeWithEntityGivenWiFi;
}

- (double)messagePopularityGivenSequence
{
  return self->_messagePopularityGivenSequence;
}

- (double)callPopularityGivenSequence
{
  return self->_callPopularityGivenSequence;
}

- (double)facetimePopularityGivenSequence
{
  return self->_facetimePopularityGivenSequence;
}

- (double)sequenceGivenMessageWithEntity
{
  return self->_sequenceGivenMessageWithEntity;
}

- (double)sequenceGivenCallWithEntity
{
  return self->_sequenceGivenCallWithEntity;
}

- (double)sequenceGivenFacetimeWithEntity
{
  return self->_sequenceGivenFacetimeWithEntity;
}

- (int)lastExecutionAge
{
  return self->_lastExecutionAge;
}

- (int)medianTimeIntervalBetweenExecution
{
  return self->_medianTimeIntervalBetweenExecution;
}

- (int)dailyDoseL1Error
{
  return self->_dailyDoseL1Error;
}

- (double)dailyDoseL2Error
{
  return self->_dailyDoseL2Error;
}

- (double)shortTermTrendingPopularity
{
  return self->_shortTermTrendingPopularity;
}

- (double)trendingPopularity
{
  return self->_trendingPopularity;
}

- (double)longTermTrendingPopularity
{
  return self->_longTermTrendingPopularity;
}

- (int)locationLastExecutionAge
{
  return self->_locationLastExecutionAge;
}

- (double)locationTrendingPopularity
{
  return self->_locationTrendingPopularity;
}

- (double)locationPopularityGivenSpecificGeoHash
{
  return self->_locationPopularityGivenSpecificGeoHash;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
