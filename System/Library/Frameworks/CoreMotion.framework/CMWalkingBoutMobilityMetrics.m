@implementation CMWalkingBoutMobilityMetrics

- (CMWalkingBoutMobilityMetrics)initWithRecordId:(unint64_t)a3 startTime:(id)a4 endTime:(id)a5 stepCount:(int)a6 workoutType:(int)a7 numGaitMetrics:(int)a8 deviceSide:(int64_t)a9 walkingSpeed:(double)a10 doubleSupportPercentage:(double)a11 stepLength:(double)a12 asymmetryPercentage:(double)a13 userHeight:(double)a14 userWeight:(double)a15 isHeightSet:(BOOL)a16 isWeightSet:(BOOL)a17 boundaryType:(int64_t)a18 cycleTimeMean:(double)a19 terminationReason:(int64_t)a20 invalidGradePercentage:(double)a21 segmentsRejectedByIsSwingStanceCycle:(unsigned int)a22 segmentsRejectedByIsNotRunning:(unsigned int)a23 segmentsRejectedByIsFeasibleWalkingSpeed:(unsigned int)a24 segmentsRejectedByIsPendular:(unsigned int)a25 segmentsRejectedByIsSufficientVerticalTwist:(unsigned int)a26 segmentsRejectedByIsCadenceConcordant:(unsigned int)a27 walkingSpeedRejectionStatus:(unsigned int)a28 doubleSupportPercentageRejectionStatus:(unsigned int)a29 stepLengthRejectionStatus:(unsigned int)a30 asymmetryPercentageRejectionStatus:(unsigned int)a31 stepLengthEntropy:(double)a32 stepLengthPoincareSD1:(double)a33 stepLengthPoincareSD2:(double)a34 cycleTimeEntropy:(double)a35 cycleTimePoincareSD1:(double)a36 cycleTimePoincareSD2:(double)a37 stepIndexOfHarmonicityAP:(double)a38 stepIndexOfHarmonicityML:(double)a39 stepIndexOfHarmonicityVT:(double)a40 swingIndexOfHarmonicityAP:(double)a41 swingIndexOfHarmonicityML:(double)a42 swingIndexOfHarmonicityVT:(double)a43
{
  CMWalkingBoutMobilityMetrics *v57;
  CMWalkingBoutMobilityMetrics *v58;
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)CMWalkingBoutMobilityMetrics;
  v57 = -[CMWalkingBoutMobilityMetrics init](&v60, sel_init);
  v58 = v57;
  if (v57)
  {
    v57->fRecordId = a3;
    v57->fStartDate = (NSDate *)a4;
    v58->fEndDate = (NSDate *)a5;
    v58->fStepCount = a6;
    v58->fWorkoutType = a7;
    v58->fNumGaitMetrics = a8;
    v58->fDeviceSide = a9;
    v58->fWalkingSpeed = a10;
    v58->fDoubleSupportPercentage = a11;
    v58->fStepLength = a12;
    v58->fAsymmetryPercentage = a13;
    v58->fUserHeight = a14;
    v58->fIsHeightSet = a16;
    v58->fUserWeight = a15;
    v58->fIsWeightSet = a17;
    v58->fBoundaryType = a18;
    v58->fCycleTimeMean = a19;
    v58->fTerminationReason = a20;
    v58->fInvalidGradePercentage = a21;
    v58->fSegmentsRejectedByIsSwingStanceCycle = a22;
    v58->fSegmentsRejectedByIsNotRunning = a23;
    v58->fSegmentsRejectedByIsFeasibleWalkingSpeed = a24;
    v58->fSegmentsRejectedByIsPendular = a25;
    v58->fSegmentsRejectedByIsSufficientVerticalTwist = a26;
    v58->fSegmentsRejectedByIsCadenceConcordant = a27;
    v58->fWalkingSpeedRejectionStatus = a28;
    v58->fDoubleSupportPercentageRejectionStatus = a29;
    v58->fStepLengthRejectionStatus = a30;
    v58->fAsymmetryPercentageRejectionStatus = a31;
    v58->fStepLengthEntropy = a32;
    v58->fStepLengthPoincareSD1 = a33;
    v58->fStepLengthPoincareSD2 = a34;
    v58->fCycleTimeEntropy = a35;
    v58->fCycleTimePoincareSD1 = a36;
    v58->fCycleTimePoincareSD2 = a37;
    v58->fStepIndexOfHarmonicityAP = a38;
    v58->fStepIndexOfHarmonicityML = a39;
    v58->fStepIndexOfHarmonicityVT = a40;
    v58->fSwingIndexOfHarmonicityAP = a41;
    v58->fSwingIndexOfHarmonicityML = a42;
    v58->fSwingIndexOfHarmonicityVT = a43;
  }
  return v58;
}

- (CMWalkingBoutMobilityMetrics)initWithSample:(BoutMetrics *)a3
{
  CMWalkingBoutMobilityMetrics *v4;
  CMWalkingBoutMobilityMetrics *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double var37;
  float32x2_t v17;
  float64x2_t v18;
  float32x2_t v19;
  float64x2_t v20;
  int64_t var5;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CMWalkingBoutMobilityMetrics;
  v4 = -[CMWalkingBoutMobilityMetrics init](&v23, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = a3->var0;
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, v9, v10, a3->var1);
    v11 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v11, v12, v13, v14, v15, a3->var2);
    v5->fWalkingSpeed = a3->var17;
    v5->fDoubleSupportPercentage = a3->var18;
    v5->fStepLength = a3->var19;
    var37 = a3->var37;
    v17 = *(float32x2_t *)&a3->var21;
    v5->fAsymmetryPercentage = a3->var20;
    v5->fUserHeight = var37;
    v5->fUserWeight = a3->var39;
    v5->fCycleTimeMean = a3->var10;
    v5->fInvalidGradePercentage = a3->var7;
    v5->fStepLengthEntropy = a3->var11;
    v5->fStepLengthPoincareSD1 = a3->var12;
    v5->fStepLengthPoincareSD2 = a3->var13;
    v5->fCycleTimeEntropy = a3->var14;
    v5->fCycleTimePoincareSD1 = a3->var15;
    v5->fCycleTimePoincareSD2 = a3->var16;
    v18 = vcvtq_f64_f32(v17);
    v19 = *(float32x2_t *)&a3->var25;
    v20 = vcvtq_f64_f32(*(float32x2_t *)&a3->var23);
    *(float64x2_t *)&v5->fStepIndexOfHarmonicityAP = v18;
    *(float64x2_t *)&v5->fStepIndexOfHarmonicityVT = v20;
    v5->fStepCount = a3->var3;
    var5 = a3->var5;
    v5->fWorkoutType = a3->var4;
    v5->fNumGaitMetrics = a3->var6;
    v5->fDeviceSide = a3->var8;
    v5->fIsHeightSet = a3->var38;
    v5->fIsWeightSet = a3->var40;
    v5->fBoundaryType = a3->var9;
    v5->fTerminationReason = var5;
    v5->fSegmentsRejectedByIsSwingStanceCycle = a3->var27;
    v5->fSegmentsRejectedByIsNotRunning = a3->var28;
    v5->fSegmentsRejectedByIsFeasibleWalkingSpeed = a3->var29;
    v5->fSegmentsRejectedByIsPendular = a3->var30;
    v5->fSegmentsRejectedByIsSufficientVerticalTwist = a3->var31;
    v5->fSegmentsRejectedByIsCadenceConcordant = a3->var32;
    v5->fWalkingSpeedRejectionStatus = a3->var33;
    v5->fDoubleSupportPercentageRejectionStatus = a3->var34;
    v5->fStepLengthRejectionStatus = a3->var35;
    v5->fAsymmetryPercentageRejectionStatus = a3->var36;
    *(float64x2_t *)&v5->fSwingIndexOfHarmonicityML = vcvtq_f64_f32(v19);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMWalkingBoutMobilityMetrics;
  -[CMWalkingBoutMobilityMetrics dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWalkingBoutMobilityMetrics)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMWalkingBoutMobilityMetrics *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  double v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  double v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  double v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  double v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  double v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  double v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  double v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  double v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  double v157;
  objc_super v159;

  v159.receiver = self;
  v159.super_class = (Class)CMWalkingBoutMobilityMetrics;
  v7 = -[CMWalkingBoutMobilityMetrics init](&v159, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStartDate"), v10);
    v7->fStartDate = (NSDate *)objc_msgSend_copy(v11, v12, v13, v14, v15);
    v16 = objc_opt_class();
    v19 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyEndDate"), v18);
    v7->fEndDate = (NSDate *)objc_msgSend_copy(v19, v20, v21, v22, v23);
    v7->fStepCount = objc_msgSend_decodeIntegerForKey_(a3, v24, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepCount"), v25, v26);
    v7->fWorkoutType = objc_msgSend_decodeIntegerForKey_(a3, v27, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyWorkoutType"), v28, v29);
    v7->fNumGaitMetrics = objc_msgSend_decodeIntegerForKey_(a3, v30, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyNumGaitMetrics"), v31, v32);
    v7->fDeviceSide = objc_msgSend_decodeIntegerForKey_(a3, v33, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyDeviceSide"), v34, v35);
    objc_msgSend_decodeDoubleForKey_(a3, v36, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyWalkingSpeed"), v37, v38);
    v7->fWalkingSpeed = v39;
    objc_msgSend_decodeDoubleForKey_(a3, v40, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyDoubleSupportPercentage"), v41, v42);
    v7->fDoubleSupportPercentage = v43;
    objc_msgSend_decodeDoubleForKey_(a3, v44, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepLength"), v45, v46);
    v7->fStepLength = v47;
    objc_msgSend_decodeDoubleForKey_(a3, v48, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyAsymmetryPercentage"), v49, v50);
    v7->fAsymmetryPercentage = v51;
    objc_msgSend_decodeDoubleForKey_(a3, v52, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyUserHeight"), v53, v54);
    v7->fUserHeight = v55;
    v7->fIsHeightSet = objc_msgSend_decodeIntegerForKey_(a3, v56, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyIsHeightSet"), v57, v58) != 0;
    objc_msgSend_decodeDoubleForKey_(a3, v59, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyUserWeight"), v60, v61);
    v7->fUserWeight = v62;
    v7->fIsWeightSet = objc_msgSend_decodeIntegerForKey_(a3, v63, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyIsWeightSet"), v64, v65) != 0;
    v7->fBoundaryType = objc_msgSend_decodeIntegerForKey_(a3, v66, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyBoundaryType"), v67, v68);
    objc_msgSend_decodeDoubleForKey_(a3, v69, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyCycleTimeMean"), v70, v71);
    v7->fCycleTimeMean = v72;
    v7->fTerminationReason = objc_msgSend_decodeIntegerForKey_(a3, v73, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyTerminationReason"), v74, v75);
    objc_msgSend_decodeDoubleForKey_(a3, v76, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyInvalidGradePercentage"), v77, v78);
    v7->fInvalidGradePercentage = v79;
    v7->fSegmentsRejectedByIsSwingStanceCycle = objc_msgSend_decodeInt32ForKey_(a3, v80, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySegmentsRejectedByIsSwingStanceCycle"), v81, v82);
    v7->fSegmentsRejectedByIsNotRunning = objc_msgSend_decodeInt32ForKey_(a3, v83, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySegmentsRejectedByIsNotRunning"), v84, v85);
    v7->fSegmentsRejectedByIsFeasibleWalkingSpeed = objc_msgSend_decodeInt32ForKey_(a3, v86, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySegmentsRejectedByIsFeasibleWalkingSpeed"), v87, v88);
    v7->fSegmentsRejectedByIsPendular = objc_msgSend_decodeInt32ForKey_(a3, v89, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySegmentsRejectedByIsPendular"), v90, v91);
    v7->fSegmentsRejectedByIsSufficientVerticalTwist = objc_msgSend_decodeInt32ForKey_(a3, v92, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySegmentsRejectedByIsSufficientVerticalTwist"), v93, v94);
    v7->fSegmentsRejectedByIsCadenceConcordant = objc_msgSend_decodeInt32ForKey_(a3, v95, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySegmentsRejectedByIsCadenceConcordant"), v96, v97);
    v7->fWalkingSpeedRejectionStatus = objc_msgSend_decodeInt32ForKey_(a3, v98, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyWalkingSpeedRejectionStatus"), v99, v100);
    v7->fDoubleSupportPercentageRejectionStatus = objc_msgSend_decodeInt32ForKey_(a3, v101, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyDoubleSupportPercentageRejectionStatus"), v102, v103);
    v7->fStepLengthRejectionStatus = objc_msgSend_decodeInt32ForKey_(a3, v104, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepLengthRejectionStatus"), v105, v106);
    v7->fAsymmetryPercentageRejectionStatus = objc_msgSend_decodeInt32ForKey_(a3, v107, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyAsymmetryPercentageRejectionStatus"), v108, v109);
    objc_msgSend_decodeDoubleForKey_(a3, v110, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepLengthEntropy"), v111, v112);
    v7->fStepLengthEntropy = v113;
    objc_msgSend_decodeDoubleForKey_(a3, v114, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepLengthPoincareSD1"), v115, v116);
    v7->fStepLengthPoincareSD1 = v117;
    objc_msgSend_decodeDoubleForKey_(a3, v118, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepLengthPoincareSD2"), v119, v120);
    v7->fStepLengthPoincareSD2 = v121;
    objc_msgSend_decodeDoubleForKey_(a3, v122, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyCycleTimeEntropy"), v123, v124);
    v7->fCycleTimeEntropy = v125;
    objc_msgSend_decodeDoubleForKey_(a3, v126, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyCycleTimePoincareSD1"), v127, v128);
    v7->fCycleTimePoincareSD1 = v129;
    objc_msgSend_decodeDoubleForKey_(a3, v130, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyCycleTimePoincareSD2"), v131, v132);
    v7->fCycleTimePoincareSD2 = v133;
    objc_msgSend_decodeDoubleForKey_(a3, v134, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepIndexOfHarmonicityAP"), v135, v136);
    v7->fStepIndexOfHarmonicityAP = v137;
    objc_msgSend_decodeDoubleForKey_(a3, v138, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepIndexOfHarmonicityML"), v139, v140);
    v7->fStepIndexOfHarmonicityML = v141;
    objc_msgSend_decodeDoubleForKey_(a3, v142, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepIndexOfHarmonicityVT"), v143, v144);
    v7->fStepIndexOfHarmonicityVT = v145;
    objc_msgSend_decodeDoubleForKey_(a3, v146, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySwingIndexOfHarmonicityAP"), v147, v148);
    v7->fSwingIndexOfHarmonicityAP = v149;
    objc_msgSend_decodeDoubleForKey_(a3, v150, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySwingIndexOfHarmonicityML"), v151, v152);
    v7->fSwingIndexOfHarmonicityML = v153;
    objc_msgSend_decodeDoubleForKey_(a3, v154, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySwingIndexOfHarmonicityVT"), v155, v156);
    v7->fSwingIndexOfHarmonicityVT = v157;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t fRecordId;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t fTerminationReason;
  int fNumGaitMetrics;
  double fInvalidGradePercentage;
  int64_t fDeviceSide;
  int64_t fBoundaryType;
  double fCycleTimeEntropy;
  double fCycleTimePoincareSD1;
  float fUserHeight;
  BOOL fIsHeightSet;
  BOOL fIsWeightSet;
  uint64_t v25;
  float32x2_t v26;
  double fStepLengthEntropy;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  float32x4_t v38;
  __int128 v39;
  __int128 v40;
  double fAsymmetryPercentage;
  double fStepLength;
  double fDoubleSupportPercentage;
  double fWalkingSpeed;
  double fCycleTimePoincareSD2;
  double fStepLengthPoincareSD2;
  double fStepLengthPoincareSD1;
  double fCycleTimeMean;
  uint64_t v49;
  int v50;
  float v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  double v58;
  char v59;
  int v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  float32x4_t v72;
  float32x2_t v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  float v77;
  BOOL v78;
  int v79;
  BOOL v80;

  fRecordId = self->fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, a2, (uint64_t)a3, v3, v4);
  v49 = v8;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fEndDate, v9, v10, v11, v12);
  v14 = v13;
  fTerminationReason = self->fTerminationReason;
  fNumGaitMetrics = self->fNumGaitMetrics;
  fInvalidGradePercentage = self->fInvalidGradePercentage;
  fDeviceSide = self->fDeviceSide;
  fBoundaryType = self->fBoundaryType;
  fStepLengthPoincareSD1 = self->fStepLengthPoincareSD1;
  fCycleTimeMean = self->fCycleTimeMean;
  fCycleTimeEntropy = self->fCycleTimeEntropy;
  fCycleTimePoincareSD1 = self->fCycleTimePoincareSD1;
  fCycleTimePoincareSD2 = self->fCycleTimePoincareSD2;
  fStepLengthPoincareSD2 = self->fStepLengthPoincareSD2;
  fDoubleSupportPercentage = self->fDoubleSupportPercentage;
  fWalkingSpeed = self->fWalkingSpeed;
  fAsymmetryPercentage = self->fAsymmetryPercentage;
  fStepLength = self->fStepLength;
  fUserHeight = self->fUserHeight;
  fIsHeightSet = self->fIsHeightSet;
  *(float *)&v13 = self->fUserWeight;
  v50 = v13;
  v51 = fUserHeight;
  fIsWeightSet = self->fIsWeightSet;
  v25 = *(_QWORD *)&self->fStepCount;
  v39 = *(_OWORD *)&self->fSegmentsRejectedByIsSufficientVerticalTwist;
  v40 = *(_OWORD *)&self->fSegmentsRejectedByIsSwingStanceCycle;
  v38 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->fStepIndexOfHarmonicityAP), *(float64x2_t *)&self->fStepIndexOfHarmonicityVT);
  v26 = vcvt_f32_f64(*(float64x2_t *)&self->fSwingIndexOfHarmonicityML);
  v28 = *(_QWORD *)&self->fStepLengthRejectionStatus;
  fStepLengthEntropy = self->fStepLengthEntropy;
  v29 = (void *)objc_opt_class();
  v33 = (void *)objc_msgSend_allocWithZone_(v29, v30, (uint64_t)a3, v31, v32);
  v52 = fRecordId;
  v53 = v49;
  v54 = v14;
  v55 = v25;
  v56 = fTerminationReason;
  v57 = fNumGaitMetrics;
  v58 = fInvalidGradePercentage;
  v59 = fDeviceSide;
  v60 = fBoundaryType;
  v61 = fCycleTimeMean;
  v62 = fStepLengthEntropy;
  v63 = fStepLengthPoincareSD1;
  v64 = fStepLengthPoincareSD2;
  v65 = fCycleTimeEntropy;
  v66 = fCycleTimePoincareSD1;
  v67 = fCycleTimePoincareSD2;
  v68 = fWalkingSpeed;
  v69 = fDoubleSupportPercentage;
  v70 = fStepLength;
  v71 = fAsymmetryPercentage;
  v72 = v38;
  v74 = v40;
  v75 = v39;
  v73 = v26;
  v76 = v28;
  v77 = v51;
  v78 = fIsHeightSet;
  v79 = v50;
  v80 = fIsWeightSet;
  return (id)objc_msgSend_initWithSample_(v33, v34, (uint64_t)&v52, v35, v36);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStartDate"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fEndDate, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyEndDate"), v9);
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->fStepCount, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepCount"), v11);
  objc_msgSend_encodeInteger_forKey_(a3, v12, self->fWorkoutType, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyWorkoutType"), v13);
  objc_msgSend_encodeInteger_forKey_(a3, v14, self->fNumGaitMetrics, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyNumGaitMetrics"), v15);
  objc_msgSend_encodeInteger_forKey_(a3, v16, self->fDeviceSide, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyDeviceSide"), v17);
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyWalkingSpeed"), v19, v20, self->fWalkingSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyDoubleSupportPercentage"), v22, v23, self->fDoubleSupportPercentage);
  objc_msgSend_encodeDouble_forKey_(a3, v24, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepLength"), v25, v26, self->fStepLength);
  objc_msgSend_encodeDouble_forKey_(a3, v27, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyAsymmetryPercentage"), v28, v29, self->fAsymmetryPercentage);
  objc_msgSend_encodeDouble_forKey_(a3, v30, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyUserHeight"), v31, v32, self->fUserHeight);
  objc_msgSend_encodeInteger_forKey_(a3, v33, self->fIsHeightSet, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyIsHeightSet"), v34);
  objc_msgSend_encodeDouble_forKey_(a3, v35, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyUserWeight"), v36, v37, self->fUserWeight);
  objc_msgSend_encodeInteger_forKey_(a3, v38, self->fIsWeightSet, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyIsWeightSet"), v39);
  objc_msgSend_encodeInteger_forKey_(a3, v40, self->fBoundaryType, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyBoundaryType"), v41);
  objc_msgSend_encodeDouble_forKey_(a3, v42, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyCycleTimeMean"), v43, v44, self->fCycleTimeMean);
  objc_msgSend_encodeInteger_forKey_(a3, v45, self->fTerminationReason, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyTerminationReason"), v46);
  objc_msgSend_encodeDouble_forKey_(a3, v47, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyInvalidGradePercentage"), v48, v49, self->fInvalidGradePercentage);
  objc_msgSend_encodeInt32_forKey_(a3, v50, self->fSegmentsRejectedByIsSwingStanceCycle, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySegmentsRejectedByIsSwingStanceCycle"), v51);
  objc_msgSend_encodeInt32_forKey_(a3, v52, self->fSegmentsRejectedByIsNotRunning, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySegmentsRejectedByIsNotRunning"), v53);
  objc_msgSend_encodeInt32_forKey_(a3, v54, self->fSegmentsRejectedByIsFeasibleWalkingSpeed, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySegmentsRejectedByIsFeasibleWalkingSpeed"), v55);
  objc_msgSend_encodeInt32_forKey_(a3, v56, self->fSegmentsRejectedByIsPendular, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySegmentsRejectedByIsPendular"), v57);
  objc_msgSend_encodeInt32_forKey_(a3, v58, self->fSegmentsRejectedByIsSufficientVerticalTwist, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySegmentsRejectedByIsSufficientVerticalTwist"), v59);
  objc_msgSend_encodeInt32_forKey_(a3, v60, self->fSegmentsRejectedByIsCadenceConcordant, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySegmentsRejectedByIsCadenceConcordant"), v61);
  objc_msgSend_encodeInt32_forKey_(a3, v62, self->fWalkingSpeedRejectionStatus, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyWalkingSpeedRejectionStatus"), v63);
  objc_msgSend_encodeInt32_forKey_(a3, v64, self->fDoubleSupportPercentageRejectionStatus, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyDoubleSupportPercentageRejectionStatus"), v65);
  objc_msgSend_encodeInt32_forKey_(a3, v66, self->fStepLengthRejectionStatus, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepLengthRejectionStatus"), v67);
  objc_msgSend_encodeInt32_forKey_(a3, v68, self->fAsymmetryPercentageRejectionStatus, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyAsymmetryPercentageRejectionStatus"), v69);
  objc_msgSend_encodeDouble_forKey_(a3, v70, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepLengthEntropy"), v71, v72, self->fStepLengthEntropy);
  objc_msgSend_encodeDouble_forKey_(a3, v73, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepLengthPoincareSD1"), v74, v75, self->fStepLengthPoincareSD1);
  objc_msgSend_encodeDouble_forKey_(a3, v76, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepLengthPoincareSD2"), v77, v78, self->fStepLengthPoincareSD2);
  objc_msgSend_encodeDouble_forKey_(a3, v79, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyCycleTimeEntropy"), v80, v81, self->fCycleTimeEntropy);
  objc_msgSend_encodeDouble_forKey_(a3, v82, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyCycleTimePoincareSD1"), v83, v84, self->fCycleTimePoincareSD1);
  objc_msgSend_encodeDouble_forKey_(a3, v85, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyCycleTimePoincareSD2"), v86, v87, self->fCycleTimePoincareSD2);
  objc_msgSend_encodeDouble_forKey_(a3, v88, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepIndexOfHarmonicityAP"), v89, v90, self->fStepIndexOfHarmonicityAP);
  objc_msgSend_encodeDouble_forKey_(a3, v91, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepIndexOfHarmonicityML"), v92, v93, self->fStepIndexOfHarmonicityML);
  objc_msgSend_encodeDouble_forKey_(a3, v94, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeyStepIndexOfHarmonicityVT"), v95, v96, self->fStepIndexOfHarmonicityVT);
  objc_msgSend_encodeDouble_forKey_(a3, v97, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySwingIndexOfHarmonicityAP"), v98, v99, self->fSwingIndexOfHarmonicityAP);
  objc_msgSend_encodeDouble_forKey_(a3, v100, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySwingIndexOfHarmonicityML"), v101, v102, self->fSwingIndexOfHarmonicityML);
  objc_msgSend_encodeDouble_forKey_(a3, v103, (uint64_t)CFSTR("kCMWalkingBoutMobilityMetricsCodingKeySwingIndexOfHarmonicityVT"), v104, v105, self->fSwingIndexOfHarmonicityVT);
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  void *started;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int isEqualToDate;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  double v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  double v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  double v124;
  double v125;
  double v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  double v135;
  int isHeightSet;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  double v145;
  double v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  double v155;
  int isWeightSet;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  double v174;
  double v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  double v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  double v194;
  double v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  double v204;
  int IsSwingStanceCycle;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  int IsNotRunning;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  int IsFeasibleWalkingSpeed;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  int IsPendular;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  int IsSufficientVerticalTwist;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  int IsCadenceConcordant;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  int v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  int v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  int v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  int v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  double v295;
  double v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  double v305;
  double v306;
  double v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  double v316;
  double v317;
  double v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  double v327;
  double v328;
  double v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  double v338;
  double v339;
  double v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  double v349;
  double v350;
  double v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  double v360;
  double v361;
  double v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  double v371;
  double v372;
  double v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  double v382;
  double v383;
  double v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  double v393;
  double v394;
  double v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  double v404;
  double v405;
  double v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  double v415;
  double v416;
  double v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  double v422;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_47;
  v9 = objc_msgSend_recordId(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_recordId(a3, v10, v11, v12, v13))
    goto LABEL_47;
  if (!objc_msgSend_startDate(self, v14, v15, v16, v17) && !objc_msgSend_startDate(a3, v18, v19, v20, v21)
    || (started = (void *)objc_msgSend_startDate(self, v18, v19, v20, v21),
        v27 = objc_msgSend_startDate(a3, v23, v24, v25, v26),
        (isEqualToDate = objc_msgSend_isEqualToDate_(started, v28, v27, v29, v30)) != 0))
  {
    if (!objc_msgSend_endDate(self, v18, v19, v20, v21) && !objc_msgSend_endDate(a3, v32, v33, v34, v35)
      || (v36 = (void *)objc_msgSend_endDate(self, v32, v33, v34, v35),
          v41 = objc_msgSend_endDate(a3, v37, v38, v39, v40),
          (isEqualToDate = objc_msgSend_isEqualToDate_(v36, v42, v41, v43, v44)) != 0))
    {
      v45 = objc_msgSend_stepCount(self, v32, v33, v34, v35);
      if (v45 == objc_msgSend_stepCount(a3, v46, v47, v48, v49))
      {
        v54 = objc_msgSend_workoutType(self, v50, v51, v52, v53);
        if (v54 == objc_msgSend_workoutType(a3, v55, v56, v57, v58))
        {
          v63 = objc_msgSend_numGaitMetrics(self, v59, v60, v61, v62);
          if (v63 == objc_msgSend_numGaitMetrics(a3, v64, v65, v66, v67))
          {
            v72 = objc_msgSend_deviceSide(self, v68, v69, v70, v71);
            if (v72 == objc_msgSend_deviceSide(a3, v73, v74, v75, v76))
            {
              objc_msgSend_walkingSpeed(self, v77, v78, v79, v80);
              v82 = v81;
              objc_msgSend_walkingSpeed(a3, v83, v84, v85, v86);
              if (v82 == v91)
              {
                objc_msgSend_doubleSupportPercentage(self, v87, v88, v89, v90);
                v93 = v92;
                objc_msgSend_doubleSupportPercentage(a3, v94, v95, v96, v97);
                if (v93 == v102)
                {
                  objc_msgSend_stepLength(self, v98, v99, v100, v101);
                  v104 = v103;
                  objc_msgSend_stepLength(a3, v105, v106, v107, v108);
                  if (v104 == v113)
                  {
                    objc_msgSend_asymmetryPercentage(self, v109, v110, v111, v112);
                    v115 = v114;
                    objc_msgSend_asymmetryPercentage(a3, v116, v117, v118, v119);
                    if (v115 == v124)
                    {
                      objc_msgSend_userHeight(self, v120, v121, v122, v123);
                      v126 = v125;
                      objc_msgSend_userHeight(a3, v127, v128, v129, v130);
                      if (v126 == v135)
                      {
                        isHeightSet = objc_msgSend_isHeightSet(self, v131, v132, v133, v134);
                        if (isHeightSet == objc_msgSend_isHeightSet(a3, v137, v138, v139, v140))
                        {
                          objc_msgSend_userWeight(self, v141, v142, v143, v144);
                          v146 = v145;
                          objc_msgSend_userWeight(a3, v147, v148, v149, v150);
                          if (v146 == v155)
                          {
                            isWeightSet = objc_msgSend_isWeightSet(self, v151, v152, v153, v154);
                            if (isWeightSet == objc_msgSend_isWeightSet(a3, v157, v158, v159, v160))
                            {
                              v165 = objc_msgSend_boundaryType(self, v161, v162, v163, v164);
                              if (v165 == objc_msgSend_boundaryType(a3, v166, v167, v168, v169))
                              {
                                objc_msgSend_cycleTimeMean(self, v170, v171, v172, v173);
                                v175 = v174;
                                objc_msgSend_cycleTimeMean(a3, v176, v177, v178, v179);
                                if (v175 == v184)
                                {
                                  v185 = objc_msgSend_terminationReason(self, v180, v181, v182, v183);
                                  if (v185 == objc_msgSend_terminationReason(a3, v186, v187, v188, v189))
                                  {
                                    objc_msgSend_invalidGradePercentage(self, v190, v191, v192, v193);
                                    v195 = v194;
                                    objc_msgSend_invalidGradePercentage(a3, v196, v197, v198, v199);
                                    if (v195 == v204)
                                    {
                                      IsSwingStanceCycle = objc_msgSend_segmentsRejectedByIsSwingStanceCycle(self, v200, v201, v202, v203);
                                      if (IsSwingStanceCycle == objc_msgSend_segmentsRejectedByIsSwingStanceCycle(a3, v206, v207, v208, v209))
                                      {
                                        IsNotRunning = objc_msgSend_segmentsRejectedByIsNotRunning(self, v210, v211, v212, v213);
                                        if (IsNotRunning == objc_msgSend_segmentsRejectedByIsNotRunning(a3, v215, v216, v217, v218))
                                        {
                                          IsFeasibleWalkingSpeed = objc_msgSend_segmentsRejectedByIsFeasibleWalkingSpeed(self, v219, v220, v221, v222);
                                          if (IsFeasibleWalkingSpeed == objc_msgSend_segmentsRejectedByIsFeasibleWalkingSpeed(a3, v224, v225, v226, v227))
                                          {
                                            IsPendular = objc_msgSend_segmentsRejectedByIsPendular(self, v228, v229, v230, v231);
                                            if (IsPendular == objc_msgSend_segmentsRejectedByIsPendular(a3, v233, v234, v235, v236))
                                            {
                                              IsSufficientVerticalTwist = objc_msgSend_segmentsRejectedByIsSufficientVerticalTwist(self, v237, v238, v239, v240);
                                              if (IsSufficientVerticalTwist == objc_msgSend_segmentsRejectedByIsSufficientVerticalTwist(a3, v242, v243, v244, v245))
                                              {
                                                IsCadenceConcordant = objc_msgSend_segmentsRejectedByIsCadenceConcordant(self, v246, v247, v248, v249);
                                                if (IsCadenceConcordant == objc_msgSend_segmentsRejectedByIsCadenceConcordant(a3, v251, v252, v253, v254))
                                                {
                                                  v259 = objc_msgSend_walkingSpeedRejectionStatus(self, v255, v256, v257, v258);
                                                  if (v259 == objc_msgSend_walkingSpeedRejectionStatus(a3, v260, v261, v262, v263))
                                                  {
                                                    v268 = objc_msgSend_doubleSupportPercentageRejectionStatus(self, v264, v265, v266, v267);
                                                    if (v268 == objc_msgSend_doubleSupportPercentageRejectionStatus(a3, v269, v270, v271, v272))
                                                    {
                                                      v277 = objc_msgSend_stepLengthRejectionStatus(self, v273, v274, v275, v276);
                                                      if (v277 == objc_msgSend_stepLengthRejectionStatus(a3, v278, v279, v280, v281))
                                                      {
                                                        v286 = objc_msgSend_asymmetryPercentageRejectionStatus(self, v282, v283, v284, v285);
                                                        if (v286 == objc_msgSend_asymmetryPercentageRejectionStatus(a3, v287, v288, v289, v290))
                                                        {
                                                          objc_msgSend_stepLengthEntropy(self, v291, v292, v293, v294);
                                                          v296 = v295;
                                                          objc_msgSend_stepLengthEntropy(a3, v297, v298, v299, v300);
                                                          if (v296 == v305)
                                                          {
                                                            objc_msgSend_stepLengthPoincareSD1(self, v301, v302, v303, v304);
                                                            v307 = v306;
                                                            objc_msgSend_stepLengthPoincareSD1(a3, v308, v309, v310, v311);
                                                            if (v307 == v316)
                                                            {
                                                              objc_msgSend_stepLengthPoincareSD2(self, v312, v313, v314, v315);
                                                              v318 = v317;
                                                              objc_msgSend_stepLengthPoincareSD2(a3, v319, v320, v321, v322);
                                                              if (v318 == v327)
                                                              {
                                                                objc_msgSend_cycleTimeEntropy(self, v323, v324, v325, v326);
                                                                v329 = v328;
                                                                objc_msgSend_cycleTimeEntropy(a3, v330, v331, v332, v333);
                                                                if (v329 == v338)
                                                                {
                                                                  objc_msgSend_cycleTimePoincareSD1(self, v334, v335, v336, v337);
                                                                  v340 = v339;
                                                                  objc_msgSend_cycleTimePoincareSD1(a3, v341, v342, v343, v344);
                                                                  if (v340 == v349)
                                                                  {
                                                                    objc_msgSend_cycleTimePoincareSD2(self, v345, v346, v347, v348);
                                                                    v351 = v350;
                                                                    objc_msgSend_cycleTimePoincareSD2(a3, v352, v353, v354, v355);
                                                                    if (v351 == v360)
                                                                    {
                                                                      objc_msgSend_stepIndexOfHarmonicityAP(self, v356, v357, v358, v359);
                                                                      v362 = v361;
                                                                      objc_msgSend_stepIndexOfHarmonicityAP(a3, v363, v364, v365, v366);
                                                                      if (v362 == v371)
                                                                      {
                                                                        objc_msgSend_stepIndexOfHarmonicityML(self, v367, v368, v369, v370);
                                                                        v373 = v372;
                                                                        objc_msgSend_stepIndexOfHarmonicityML(a3, v374, v375, v376, v377);
                                                                        if (v373 == v382)
                                                                        {
                                                                          objc_msgSend_stepIndexOfHarmonicityVT(self, v378, v379, v380, v381);
                                                                          v384 = v383;
                                                                          objc_msgSend_stepIndexOfHarmonicityVT(a3, v385, v386, v387, v388);
                                                                          if (v384 == v393)
                                                                          {
                                                                            objc_msgSend_swingIndexOfHarmonicityAP(self, v389, v390, v391, v392);
                                                                            v395 = v394;
                                                                            objc_msgSend_swingIndexOfHarmonicityAP(a3, v396, v397, v398, v399);
                                                                            if (v395 == v404)
                                                                            {
                                                                              objc_msgSend_swingIndexOfHarmonicityML(self, v400, v401, v402, v403);
                                                                              v406 = v405;
                                                                              objc_msgSend_swingIndexOfHarmonicityML(a3, v407, v408, v409, v410);
                                                                              if (v406 == v415)
                                                                              {
                                                                                objc_msgSend_swingIndexOfHarmonicityVT(self, v411, v412, v413, v414);
                                                                                v417 = v416;
                                                                                objc_msgSend_swingIndexOfHarmonicityVT(a3, v418, v419, v420, v421);
                                                                                LOBYTE(isEqualToDate) = v417 == v422;
                                                                                return isEqualToDate;
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_47:
      LOBYTE(isEqualToDate) = 0;
    }
  }
  return isEqualToDate;
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (int)stepCount
{
  return self->fStepCount;
}

- (int)workoutType
{
  return self->fWorkoutType;
}

- (int)numGaitMetrics
{
  return self->fNumGaitMetrics;
}

- (int64_t)deviceSide
{
  return self->fDeviceSide;
}

- (double)walkingSpeed
{
  return self->fWalkingSpeed;
}

- (double)doubleSupportPercentage
{
  return self->fDoubleSupportPercentage;
}

- (double)stepLength
{
  return self->fStepLength;
}

- (double)asymmetryPercentage
{
  return self->fAsymmetryPercentage;
}

- (double)userHeight
{
  return self->fUserHeight;
}

- (BOOL)isHeightSet
{
  return self->fIsHeightSet;
}

- (double)userWeight
{
  return self->fUserWeight;
}

- (BOOL)isWeightSet
{
  return self->fIsWeightSet;
}

- (int64_t)boundaryType
{
  return self->fBoundaryType;
}

- (double)cycleTimeMean
{
  return self->fCycleTimeMean;
}

- (int64_t)terminationReason
{
  return self->fTerminationReason;
}

- (double)invalidGradePercentage
{
  return self->fInvalidGradePercentage;
}

- (unsigned)segmentsRejectedByIsSwingStanceCycle
{
  return self->fSegmentsRejectedByIsSwingStanceCycle;
}

- (unsigned)segmentsRejectedByIsNotRunning
{
  return self->fSegmentsRejectedByIsNotRunning;
}

- (unsigned)segmentsRejectedByIsFeasibleWalkingSpeed
{
  return self->fSegmentsRejectedByIsFeasibleWalkingSpeed;
}

- (unsigned)segmentsRejectedByIsPendular
{
  return self->fSegmentsRejectedByIsPendular;
}

- (unsigned)segmentsRejectedByIsSufficientVerticalTwist
{
  return self->fSegmentsRejectedByIsSufficientVerticalTwist;
}

- (unsigned)segmentsRejectedByIsCadenceConcordant
{
  return self->fSegmentsRejectedByIsCadenceConcordant;
}

- (unsigned)walkingSpeedRejectionStatus
{
  return self->fWalkingSpeedRejectionStatus;
}

- (unsigned)stepLengthRejectionStatus
{
  return self->fStepLengthRejectionStatus;
}

- (unsigned)doubleSupportPercentageRejectionStatus
{
  return self->fDoubleSupportPercentageRejectionStatus;
}

- (unsigned)asymmetryPercentageRejectionStatus
{
  return self->fAsymmetryPercentageRejectionStatus;
}

- (double)stepLengthEntropy
{
  return self->fStepLengthEntropy;
}

- (double)stepLengthPoincareSD1
{
  return self->fStepLengthPoincareSD1;
}

- (double)stepLengthPoincareSD2
{
  return self->fStepLengthPoincareSD2;
}

- (double)cycleTimeEntropy
{
  return self->fCycleTimeEntropy;
}

- (double)cycleTimePoincareSD1
{
  return self->fCycleTimePoincareSD1;
}

- (double)cycleTimePoincareSD2
{
  return self->fCycleTimePoincareSD2;
}

- (double)stepIndexOfHarmonicityAP
{
  return self->fStepIndexOfHarmonicityAP;
}

- (double)stepIndexOfHarmonicityML
{
  return self->fStepIndexOfHarmonicityML;
}

- (double)stepIndexOfHarmonicityVT
{
  return self->fStepIndexOfHarmonicityVT;
}

- (double)swingIndexOfHarmonicityAP
{
  return self->fSwingIndexOfHarmonicityAP;
}

- (double)swingIndexOfHarmonicityML
{
  return self->fSwingIndexOfHarmonicityML;
}

- (double)swingIndexOfHarmonicityVT
{
  return self->fSwingIndexOfHarmonicityVT;
}

- (NSString)description
{
  objc_class *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t IsNotRunning;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t IsFeasibleWalkingSpeed;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t IsPendular;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t IsSufficientVerticalTwist;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t IsCadenceConcordant;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t IsSwingStanceCycle;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  unsigned int isWeightSet;
  uint64_t v218;
  unsigned int isHeightSet;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t started;
  uint64_t v231;
  NSString *v232;
  void *v233;

  v233 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  v232 = NSStringFromClass(v3);
  v231 = objc_msgSend_recordId(self, v4, v5, v6, v7);
  started = objc_msgSend_startDate(self, v8, v9, v10, v11);
  v229 = objc_msgSend_endDate(self, v12, v13, v14, v15);
  v228 = objc_msgSend_stepCount(self, v16, v17, v18, v19);
  v227 = (int)objc_msgSend_workoutType(self, v20, v21, v22, v23);
  v226 = objc_msgSend_numGaitMetrics(self, v24, v25, v26, v27);
  v225 = objc_msgSend_deviceSide(self, v28, v29, v30, v31);
  objc_msgSend_walkingSpeed(self, v32, v33, v34, v35);
  v224 = v36;
  objc_msgSend_doubleSupportPercentage(self, v37, v38, v39, v40);
  v223 = v41;
  objc_msgSend_stepLength(self, v42, v43, v44, v45);
  v222 = v46;
  objc_msgSend_asymmetryPercentage(self, v47, v48, v49, v50);
  v221 = v51;
  objc_msgSend_userHeight(self, v52, v53, v54, v55);
  v220 = v56;
  isHeightSet = objc_msgSend_isHeightSet(self, v57, v58, v59, v60);
  objc_msgSend_userWeight(self, v61, v62, v63, v64);
  v218 = v65;
  isWeightSet = objc_msgSend_isWeightSet(self, v66, v67, v68, v69);
  v216 = objc_msgSend_boundaryType(self, v70, v71, v72, v73);
  objc_msgSend_cycleTimeMean(self, v74, v75, v76, v77);
  v215 = v78;
  v214 = objc_msgSend_terminationReason(self, v79, v80, v81, v82);
  objc_msgSend_invalidGradePercentage(self, v83, v84, v85, v86);
  v213 = v87;
  IsSwingStanceCycle = objc_msgSend_segmentsRejectedByIsSwingStanceCycle(self, v88, v89, v90, v91);
  IsNotRunning = objc_msgSend_segmentsRejectedByIsNotRunning(self, v92, v93, v94, v95);
  IsFeasibleWalkingSpeed = objc_msgSend_segmentsRejectedByIsFeasibleWalkingSpeed(self, v97, v98, v99, v100);
  IsPendular = objc_msgSend_segmentsRejectedByIsPendular(self, v102, v103, v104, v105);
  IsSufficientVerticalTwist = objc_msgSend_segmentsRejectedByIsSufficientVerticalTwist(self, v107, v108, v109, v110);
  IsCadenceConcordant = objc_msgSend_segmentsRejectedByIsCadenceConcordant(self, v112, v113, v114, v115);
  v121 = objc_msgSend_walkingSpeedRejectionStatus(self, v117, v118, v119, v120);
  v126 = objc_msgSend_stepLengthRejectionStatus(self, v122, v123, v124, v125);
  v131 = objc_msgSend_doubleSupportPercentageRejectionStatus(self, v127, v128, v129, v130);
  v136 = objc_msgSend_asymmetryPercentageRejectionStatus(self, v132, v133, v134, v135);
  objc_msgSend_stepLengthEntropy(self, v137, v138, v139, v140);
  v211 = v141;
  objc_msgSend_stepLengthPoincareSD1(self, v142, v143, v144, v145);
  v210 = v146;
  objc_msgSend_stepLengthPoincareSD2(self, v147, v148, v149, v150);
  v209 = v151;
  objc_msgSend_cycleTimeEntropy(self, v152, v153, v154, v155);
  v157 = v156;
  objc_msgSend_cycleTimePoincareSD1(self, v158, v159, v160, v161);
  v163 = v162;
  objc_msgSend_cycleTimePoincareSD2(self, v164, v165, v166, v167);
  v169 = v168;
  objc_msgSend_stepIndexOfHarmonicityAP(self, v170, v171, v172, v173);
  v175 = v174;
  objc_msgSend_stepIndexOfHarmonicityML(self, v176, v177, v178, v179);
  v181 = v180;
  objc_msgSend_stepIndexOfHarmonicityVT(self, v182, v183, v184, v185);
  v187 = v186;
  objc_msgSend_swingIndexOfHarmonicityAP(self, v188, v189, v190, v191);
  v193 = v192;
  objc_msgSend_swingIndexOfHarmonicityML(self, v194, v195, v196, v197);
  v199 = v198;
  objc_msgSend_swingIndexOfHarmonicityVT(self, v200, v201, v202, v203);
  return (NSString *)objc_msgSend_stringWithFormat_(v233, v204, (uint64_t)CFSTR("%@, <recordId, %lu, startDate, %@, endDate, %@, stepCount, %.3d, workoutType, %lu, numGaitMetrics, %d, deviceSide, %lu, walkingSpeed, %f, doubleSupportPercentage, %f, stepLength, %f, asymmetryPercentage, %f, userHeight, %f, isHeightSet, %d, userWeight, %f, isWeightSet, %d, boundaryType, %lu, cycleTimeMean, %f, terminationReason, %lu, invalidGradePercentage, %f, segmentsRejectedByIsSwingStanceCycle, %d, segmentsRejectedByIsNotRunning, %d, segmentsRejectedByIsFeasibleWalkingSpeed, %d, segmentsRejectedByIsPendular, %d, segmentsRejectedByIsSufficientVerticalTwist, %d, segmentsRejectedByIsCadenceConcordant, %d, walkingSpeedRejectionStatus, %d, stepLengthRejectionStatus, %d, doubleSupportPercentageRejectionStatus, %d, asymmetryPercentageRejectionStatus, %d, stepLengthEntropy, %f, stepLengthPoincareSD1, %f, stepLengthPoincareSD2, %f, cycleTimeEntropy, %f, cycleTimePoincareSD1, %f, cycleTimePoincareSD2, %f, stepIndexOfHarmonicityAP, %f, stepIndexOfHarmonicityML, %f, stepIndexOfHarmonicityVT, %f, swingIndexOfHarmonicityAP, %f, swingIndexOfHarmonicityML, %f, swingIndexOfHarmonicityVT, %f>"), v205, v206, v232, v231, started, v229, v228, v227, v226, v225, v224, v223, v222, v221, v220, isHeightSet,
                       v218,
                       isWeightSet,
                       v216,
                       v215,
                       v214,
                       v213,
                       IsSwingStanceCycle,
                       IsNotRunning,
                       IsFeasibleWalkingSpeed,
                       IsPendular,
                       IsSufficientVerticalTwist,
                       IsCadenceConcordant,
                       v121,
                       v126,
                       v131,
                       v136,
                       v211,
                       v210,
                       v209,
                       v157,
                       v163,
                       v169,
                       v175,
                       v181,
                       v187,
                       v193,
                       v199,
                       v207);
}

+ (BoutMetrics)inputFromPreparedStatement:(SEL)a3
{
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  BoutMetrics *result;

  retstr->var0 = sqlite3_column_int(a4, 0);
  retstr->var1 = sqlite3_column_double(a4, 1);
  retstr->var2 = sqlite3_column_double(a4, 2);
  retstr->var3 = sqlite3_column_int(a4, 3);
  retstr->var4 = sqlite3_column_int(a4, 4);
  retstr->var5 = sqlite3_column_int(a4, 5);
  retstr->var6 = sqlite3_column_int(a4, 6);
  retstr->var7 = sqlite3_column_double(a4, 7);
  retstr->var8 = sqlite3_column_int(a4, 8);
  retstr->var9 = sqlite3_column_int(a4, 27);
  retstr->var10 = sqlite3_column_double(a4, 28);
  retstr->var11 = sqlite3_column_double(a4, 29);
  retstr->var12 = sqlite3_column_double(a4, 30);
  retstr->var13 = sqlite3_column_double(a4, 31);
  retstr->var14 = sqlite3_column_double(a4, 32);
  retstr->var15 = sqlite3_column_double(a4, 33);
  retstr->var16 = sqlite3_column_double(a4, 34);
  retstr->var17 = sqlite3_column_double(a4, 9);
  retstr->var18 = sqlite3_column_double(a4, 10);
  retstr->var19 = sqlite3_column_double(a4, 11);
  retstr->var20 = sqlite3_column_double(a4, 12);
  v6 = sqlite3_column_double(a4, 35);
  retstr->var21 = v6;
  v7 = sqlite3_column_double(a4, 36);
  retstr->var22 = v7;
  v8 = sqlite3_column_double(a4, 37);
  retstr->var23 = v8;
  v9 = sqlite3_column_double(a4, 38);
  retstr->var24 = v9;
  v10 = sqlite3_column_double(a4, 39);
  retstr->var25 = v10;
  v11 = sqlite3_column_double(a4, 40);
  retstr->var26 = v11;
  retstr->var27 = sqlite3_column_int(a4, 13);
  retstr->var28 = sqlite3_column_int(a4, 14);
  retstr->var29 = sqlite3_column_int(a4, 15);
  retstr->var30 = sqlite3_column_int(a4, 16);
  retstr->var31 = sqlite3_column_int(a4, 17);
  retstr->var32 = sqlite3_column_int(a4, 18);
  retstr->var33 = sqlite3_column_int(a4, 19);
  retstr->var34 = sqlite3_column_int(a4, 20);
  retstr->var35 = sqlite3_column_int(a4, 21);
  retstr->var36 = sqlite3_column_int(a4, 22);
  v12 = sqlite3_column_double(a4, 23);
  retstr->var37 = v12;
  retstr->var38 = sqlite3_column_int(a4, 24) != 0;
  v13 = sqlite3_column_double(a4, 25);
  retstr->var39 = v13;
  result = (BoutMetrics *)sqlite3_column_int(a4, 26);
  retstr->var40 = (_DWORD)result != 0;
  return result;
}

- (id)binarySampleRepresentation
{
  void *v3;
  const char *v4;
  id v5;

  v3 = (void *)MEMORY[0x194001B4C](self, a2);
  v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v4, (uint64_t)self, 1, 0);
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (CMWalkingBoutMobilityMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMWalkingBoutMobilityMetrics *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMWalkingBoutMobilityMetrics;
    v8 = -[CMWalkingBoutMobilityMetrics init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMWalkingBoutMobilityMetrics *)v13;
      }
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

- (id)sr_dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *started;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
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
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
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
  uint64_t isHeightSet;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t isWeightSet;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  _QWORD v131[13];
  _QWORD v132[14];

  v132[13] = *MEMORY[0x1E0C80C00];
  v131[0] = CFSTR("startTime");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  started = (void *)objc_msgSend_startDate(self, a2, v2, v3, v4);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v8, v9, v10, v11);
  v132[0] = objc_msgSend_numberWithDouble_(v6, v12, v13, v14, v15);
  v131[1] = CFSTR("endTime");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v21 = (void *)objc_msgSend_endDate(self, v17, v18, v19, v20);
  objc_msgSend_timeIntervalSinceReferenceDate(v21, v22, v23, v24, v25);
  v132[1] = objc_msgSend_numberWithDouble_(v16, v26, v27, v28, v29);
  v131[2] = CFSTR("stepCount");
  v30 = (void *)MEMORY[0x1E0CB37E8];
  v35 = objc_msgSend_stepCount(self, v31, v32, v33, v34);
  v132[2] = objc_msgSend_numberWithInt_(v30, v36, v35, v37, v38);
  v131[3] = CFSTR("workoutType");
  v39 = (void *)MEMORY[0x1E0CB37E8];
  v44 = objc_msgSend_workoutType(self, v40, v41, v42, v43);
  v132[3] = objc_msgSend_numberWithInt_(v39, v45, v44, v46, v47);
  v131[4] = CFSTR("deviceSide");
  v48 = (void *)MEMORY[0x1E0CB37E8];
  v53 = objc_msgSend_deviceSide(self, v49, v50, v51, v52);
  v132[4] = objc_msgSend_numberWithInteger_(v48, v54, v53, v55, v56);
  v131[5] = CFSTR("walkingSpeed");
  v57 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_walkingSpeed(self, v58, v59, v60, v61);
  v132[5] = objc_msgSend_numberWithDouble_(v57, v62, v63, v64, v65);
  v131[6] = CFSTR("doubleSupportPercentage");
  v66 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_doubleSupportPercentage(self, v67, v68, v69, v70);
  v132[6] = objc_msgSend_numberWithDouble_(v66, v71, v72, v73, v74);
  v131[7] = CFSTR("stepLength");
  v75 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_stepLength(self, v76, v77, v78, v79);
  v132[7] = objc_msgSend_numberWithDouble_(v75, v80, v81, v82, v83);
  v131[8] = CFSTR("asymmetryPercentage");
  v84 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_asymmetryPercentage(self, v85, v86, v87, v88);
  v132[8] = objc_msgSend_numberWithDouble_(v84, v89, v90, v91, v92);
  v131[9] = CFSTR("userHeight");
  v93 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_userHeight(self, v94, v95, v96, v97);
  v132[9] = objc_msgSend_numberWithDouble_(v93, v98, v99, v100, v101);
  v131[10] = CFSTR("isHeightSet");
  v102 = (void *)MEMORY[0x1E0CB37E8];
  isHeightSet = objc_msgSend_isHeightSet(self, v103, v104, v105, v106);
  v132[10] = objc_msgSend_numberWithBool_(v102, v108, isHeightSet, v109, v110);
  v131[11] = CFSTR("userWeight");
  v111 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_userWeight(self, v112, v113, v114, v115);
  v132[11] = objc_msgSend_numberWithDouble_(v111, v116, v117, v118, v119);
  v131[12] = CFSTR("isWeightSet");
  v120 = (void *)MEMORY[0x1E0CB37E8];
  isWeightSet = objc_msgSend_isWeightSet(self, v121, v122, v123, v124);
  v132[12] = objc_msgSend_numberWithBool_(v120, v126, isWeightSet, v127, v128);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v129, (uint64_t)v132, (uint64_t)v131, 13);
}

@end
