@implementation CMStrideCalibrationEntry

- (id)sr_dictionaryRepresentation
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
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
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
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  _QWORD v67[7];
  _QWORD v68[8];

  v68[7] = *MEMORY[0x1E0C80C00];
  v67[0] = CFSTR("startTime");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_startTime(self, a2, v2, v3, v4);
  v68[0] = objc_msgSend_numberWithDouble_(v6, v7, v8, v9, v10);
  v67[1] = CFSTR("endTime");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_endTime(self, v12, v13, v14, v15);
  v68[1] = objc_msgSend_numberWithDouble_(v11, v16, v17, v18, v19);
  v67[2] = CFSTR("distance");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_distance(self, v21, v22, v23, v24);
  v68[2] = objc_msgSend_numberWithDouble_(v20, v25, v26, v27, v28);
  v67[3] = CFSTR("numberOfSteps");
  v29 = (void *)MEMORY[0x1E0CB37E8];
  v34 = objc_msgSend_steps(self, v30, v31, v32, v33);
  v68[3] = objc_msgSend_numberWithInt_(v29, v35, v34, v36, v37);
  v67[4] = CFSTR("speed");
  v38 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_speed(self, v39, v40, v41, v42);
  v68[4] = objc_msgSend_numberWithDouble_(v38, v43, v44, v45, v46);
  v67[5] = CFSTR("percentGrade");
  v47 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_percentGrade(self, v48, v49, v50, v51);
  v68[5] = objc_msgSend_numberWithDouble_(v47, v52, v53, v54, v55);
  v67[6] = CFSTR("gpsSource");
  v56 = (void *)MEMORY[0x1E0CB37E8];
  v61 = objc_msgSend_gpsSource(self, v57, v58, v59, v60);
  v68[6] = objc_msgSend_numberWithInteger_(v56, v62, v61, v63, v64);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v65, (uint64_t)v68, (uint64_t)v67, 7);
}

- (CMStrideCalibrationEntry)initWithCLStrideCalEntry:(CLStrideCalEntry *)a3
{
  CMStrideCalibrationEntry *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMStrideCalibrationEntry;
  result = -[CMStrideCalibrationEntry init](&v11, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->recordId;
    v6 = *(_OWORD *)&a3->pacebin;
    v7 = *(_OWORD *)&a3->kvalueTrack;
    *(_OWORD *)&result->_strideCalStruct.endTime = *(_OWORD *)&a3->endTime;
    *(_OWORD *)&result->_strideCalStruct.kvalueTrack = v7;
    *(_OWORD *)&result->_strideCalStruct.pacebin = v6;
    *(_OWORD *)&result->_strideCalStruct.recordId = v5;
    v8 = *(_OWORD *)&a3->steps;
    v9 = *(_OWORD *)&a3->percentGrade;
    v10 = *(_OWORD *)&a3->timestamp;
    *(_QWORD *)&result->_strideCalStruct.runningFormStrideLengthMetrics = *(_QWORD *)&a3->runningFormStrideLengthMetrics;
    *(_OWORD *)&result->_strideCalStruct.timestamp = v10;
    *(_OWORD *)&result->_strideCalStruct.percentGrade = v9;
    *(_OWORD *)&result->_strideCalStruct.steps = v8;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMStrideCalibrationEntry)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMStrideCalibrationEntry *v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  int v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  double v82;
  objc_super v83;

  v83.receiver = self;
  v83.super_class = (Class)CMStrideCalibrationEntry;
  v7 = -[CMStrideCalibrationEntry init](&v83, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_decodeIntForKey_(a3, v4, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyRecordId"), v5, v6);
    objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyStartTime"), v10, v11);
    v82 = v12;
    v13 = objc_opt_class();
    v16 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyPacebin"), v15);
    v21 = objc_msgSend_unsignedIntValue(v16, v17, v18, v19, v20);
    objc_msgSend_decodeDoubleForKey_(a3, v22, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyKvalue"), v23, v24);
    v26 = v25;
    objc_msgSend_decodeDoubleForKey_(a3, v27, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyKvalueTrack"), v28, v29);
    v31 = v30;
    objc_msgSend_decodeDoubleForKey_(a3, v32, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyScore"), v33, v34);
    v36 = v35;
    objc_msgSend_decodeDoubleForKey_(a3, v37, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyEndTime"), v38, v39);
    v41 = v40;
    objc_msgSend_decodeDoubleForKey_(a3, v42, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyDistance"), v43, v44);
    v46 = v45;
    v50 = objc_msgSend_decodeInt32ForKey_(a3, v47, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeySteps"), v48, v49);
    v54 = objc_msgSend_decodeInt32ForKey_(a3, v51, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeySession"), v52, v53);
    objc_msgSend_decodeDoubleForKey_(a3, v55, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeySpeed"), v56, v57);
    v59 = v58;
    objc_msgSend_decodeDoubleForKey_(a3, v60, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyPercentGrade"), v61, v62);
    v64 = v63;
    v68 = objc_msgSend_decodeIntegerForKey_(a3, v65, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyGpsSource"), v66, v67);
    v75 = 0.0;
    if (objc_msgSend_containsValueForKey_(a3, v69, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyMeanRunningStrideLength"), v70, v71))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v72, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyMeanRunningStrideLength"), v73, v74);
      v75 = v76;
    }
    v77 = objc_msgSend_containsValueForKey_(a3, v72, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyNumberRunningStrideLengthSamples"), v73, v74);
    if (v77)
      v77 = objc_msgSend_decodeIntForKey_(a3, v78, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyNumberRunningStrideLengthSamples"), v79, v80);
    v7->_strideCalStruct.recordId = v8;
    v7->_strideCalStruct.startTime = v82;
    v7->_strideCalStruct.pacebin = v21;
    v7->_strideCalStruct.kvalue = v26;
    v7->_strideCalStruct.kvalueTrack = v31;
    v7->_strideCalStruct.score = v36;
    v7->_strideCalStruct.endTime = v41;
    v7->_strideCalStruct.distance = v46;
    v7->_strideCalStruct.steps = v50;
    v7->_strideCalStruct.session = v54;
    v7->_strideCalStruct.speed = v59;
    v7->_strideCalStruct.percentGrade = v64;
    v7->_strideCalStruct.gpsSource = v68;
    v7->_strideCalStruct.runningFormStrideLength = v75;
    v7->_strideCalStruct.runningFormStrideLengthMetrics = v77;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
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
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;

  objc_msgSend_encodeInt_forKey_(a3, a2, self->_strideCalStruct.recordId, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyRecordId"), v3);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyStartTime"), v7, v8, self->_strideCalStruct.startTime);
  v12 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v9, self->_strideCalStruct.pacebin, v10, v11);
  objc_msgSend_encodeObject_forKey_(a3, v13, v12, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyPacebin"), v14);
  objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyKvalue"), v16, v17, self->_strideCalStruct.kvalue);
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyKvalueTrack"), v19, v20, self->_strideCalStruct.kvalueTrack);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyScore"), v22, v23, self->_strideCalStruct.score);
  objc_msgSend_encodeDouble_forKey_(a3, v24, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyEndTime"), v25, v26, self->_strideCalStruct.endTime);
  objc_msgSend_encodeDouble_forKey_(a3, v27, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyDistance"), v28, v29, self->_strideCalStruct.distance);
  objc_msgSend_encodeInt32_forKey_(a3, v30, self->_strideCalStruct.steps, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeySteps"), v31);
  objc_msgSend_encodeInt32_forKey_(a3, v32, self->_strideCalStruct.session, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeySession"), v33);
  objc_msgSend_encodeDouble_forKey_(a3, v34, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeySpeed"), v35, v36, self->_strideCalStruct.speed);
  objc_msgSend_encodeDouble_forKey_(a3, v37, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyPercentGrade"), v38, v39, self->_strideCalStruct.percentGrade);
  objc_msgSend_encodeInteger_forKey_(a3, v40, self->_strideCalStruct.gpsSource, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyGpsSource"), v41);
  objc_msgSend_encodeDouble_forKey_(a3, v42, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyMeanRunningStrideLength"), v43, v44, self->_strideCalStruct.runningFormStrideLength);
  objc_msgSend_encodeInt_forKey_(a3, v45, self->_strideCalStruct.runningFormStrideLengthMetrics, (uint64_t)CFSTR("kCMStrideCalibrationEntryCodingKeyNumberRunningStrideLengthSamples"), v46);
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
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
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
  double v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  int v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  double v111;
  double v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  double v122;
  double v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  double v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  double v142;
  double v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  double v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v9 = objc_msgSend_recordId(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_recordId(a3, v10, v11, v12, v13))
    return 0;
  objc_msgSend_startTime(self, v14, v15, v16, v17);
  v19 = v18;
  objc_msgSend_startTime(a3, v20, v21, v22, v23);
  if (v19 != v28)
    return 0;
  v29 = objc_msgSend_pacebin(self, v24, v25, v26, v27);
  if (v29 != objc_msgSend_pacebin(a3, v30, v31, v32, v33))
    return 0;
  objc_msgSend_kvalue(self, v34, v35, v36, v37);
  v39 = v38;
  objc_msgSend_kvalue(a3, v40, v41, v42, v43);
  if (v39 != v48)
    return 0;
  objc_msgSend_kvalueTrack(self, v44, v45, v46, v47);
  v50 = v49;
  objc_msgSend_kvalueTrack(a3, v51, v52, v53, v54);
  if (v50 != v59)
    return 0;
  objc_msgSend_score(self, v55, v56, v57, v58);
  v61 = v60;
  objc_msgSend_score(a3, v62, v63, v64, v65);
  if (v61 != v70)
    return 0;
  objc_msgSend_endTime(self, v66, v67, v68, v69);
  v72 = v71;
  objc_msgSend_endTime(a3, v73, v74, v75, v76);
  if (v72 != v81)
    return 0;
  objc_msgSend_distance(self, v77, v78, v79, v80);
  v83 = v82;
  objc_msgSend_distance(a3, v84, v85, v86, v87);
  if (v83 != v92)
    return 0;
  v93 = objc_msgSend_steps(self, v88, v89, v90, v91);
  if (v93 != objc_msgSend_steps(a3, v94, v95, v96, v97))
    return 0;
  v102 = objc_msgSend_session(self, v98, v99, v100, v101);
  if (v102 != objc_msgSend_session(a3, v103, v104, v105, v106))
    return 0;
  objc_msgSend_speed(self, v107, v108, v109, v110);
  v112 = v111;
  objc_msgSend_speed(a3, v113, v114, v115, v116);
  if (v112 != v121)
    return 0;
  objc_msgSend_percentGrade(self, v117, v118, v119, v120);
  v123 = v122;
  objc_msgSend_percentGrade(a3, v124, v125, v126, v127);
  if (v123 != v132)
    return 0;
  v133 = objc_msgSend_gpsSource(self, v128, v129, v130, v131);
  if (v133 != objc_msgSend_gpsSource(a3, v134, v135, v136, v137))
    return 0;
  objc_msgSend_meanRunningStrideLength(self, v138, v139, v140, v141);
  v143 = v142;
  objc_msgSend_meanRunningStrideLength(a3, v144, v145, v146, v147);
  if (v143 != v152)
    return 0;
  v153 = objc_msgSend_numberRunningStrideLengthSamples(self, v148, v149, v150, v151);
  return v153 == objc_msgSend_numberRunningStrideLengthSamples(a3, v154, v155, v156, v157);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  result = (id)objc_msgSend_init(v9, v10, v11, v12, v13);
  v15 = *(_OWORD *)&self->_strideCalStruct.pacebin;
  v16 = *(_OWORD *)&self->_strideCalStruct.kvalueTrack;
  v17 = *(_OWORD *)&self->_strideCalStruct.endTime;
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_strideCalStruct.recordId;
  *(_OWORD *)((char *)result + 56) = v17;
  *(_OWORD *)((char *)result + 40) = v16;
  *(_OWORD *)((char *)result + 24) = v15;
  v18 = *(_OWORD *)&self->_strideCalStruct.percentGrade;
  v19 = *(_OWORD *)&self->_strideCalStruct.timestamp;
  v20 = *(_QWORD *)&self->_strideCalStruct.runningFormStrideLengthMetrics;
  *(_OWORD *)((char *)result + 72) = *(_OWORD *)&self->_strideCalStruct.steps;
  *((_QWORD *)result + 15) = v20;
  *(_OWORD *)((char *)result + 104) = v19;
  *(_OWORD *)((char *)result + 88) = v18;
  return result;
}

- (unint64_t)recordId
{
  return self->_strideCalStruct.recordId;
}

- (double)startTime
{
  return self->_strideCalStruct.startTime;
}

- (unsigned)pacebin
{
  return self->_strideCalStruct.pacebin;
}

- (double)kvalue
{
  return self->_strideCalStruct.kvalue;
}

- (double)kvalueTrack
{
  return self->_strideCalStruct.kvalueTrack;
}

- (double)score
{
  return self->_strideCalStruct.score;
}

- (double)endTime
{
  return self->_strideCalStruct.endTime;
}

- (double)distance
{
  return self->_strideCalStruct.distance;
}

- (int)steps
{
  return self->_strideCalStruct.steps;
}

- (int)session
{
  return self->_strideCalStruct.session;
}

- (double)speed
{
  return self->_strideCalStruct.speed;
}

- (double)percentGrade
{
  return self->_strideCalStruct.percentGrade;
}

- (int64_t)gpsSource
{
  return self->_strideCalStruct.gpsSource;
}

- (double)meanRunningStrideLength
{
  return self->_strideCalStruct.runningFormStrideLength;
}

- (int64_t)numberRunningStrideLengthSamples
{
  return self->_strideCalStruct.runningFormStrideLengthMetrics;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
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
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  v11 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend_startTime(self, v12, v13, v14, v15);
  v20 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v11, v16, v17, v18, v19);
  v21 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend_endTime(self, v22, v23, v24, v25);
  v30 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v21, v26, v27, v28, v29);
  objc_msgSend_kvalue(self, v31, v32, v33, v34);
  v36 = v35;
  objc_msgSend_kvalueTrack(self, v37, v38, v39, v40);
  v42 = v41;
  objc_msgSend_score(self, v43, v44, v45, v46);
  v48 = v47;
  v53 = objc_msgSend_session(self, v49, v50, v51, v52);
  objc_msgSend_distance(self, v54, v55, v56, v57);
  v59 = v58;
  v64 = objc_msgSend_steps(self, v60, v61, v62, v63);
  objc_msgSend_speed(self, v65, v66, v67, v68);
  v70 = v69;
  objc_msgSend_percentGrade(self, v71, v72, v73, v74);
  v76 = v75;
  v81 = objc_msgSend_gpsSource(self, v77, v78, v79, v80);
  objc_msgSend_meanRunningStrideLength(self, v82, v83, v84, v85);
  v87 = v86;
  v92 = objc_msgSend_numberRunningStrideLengthSamples(self, v88, v89, v90, v91);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v93, (uint64_t)CFSTR("%@, <recordId, %lu, startTime, %@, endTime, %@, kvalue, %f, kvalueTrack, %f, score, %f, session, %d, distance, %f, steps, %d, speed, %f, percentGrade, %f, gpsSource, %d, meanRunningStrideLength, %f, numberRunningStrideLengthSamples, %d>"), v94, v95, v5, v10, v20, v30, v36, v42, v48, v53, v59, v64, v70, v76, v81, v87,
                       v92);
}

+ (CLStrideCalEntry)inputFromPreparedStatement:(SEL)a3
{
  CLStrideCalEntry *result;

  *(_QWORD *)&retstr->runningFormStrideLengthMetrics = 0;
  *(_OWORD *)&retstr->percentGrade = 0u;
  *(_OWORD *)&retstr->timestamp = 0u;
  *(_OWORD *)&retstr->endTime = 0u;
  *(_OWORD *)&retstr->steps = 0u;
  *(_OWORD *)&retstr->pacebin = 0u;
  *(_OWORD *)&retstr->kvalueTrack = 0u;
  *(_OWORD *)&retstr->recordId = 0u;
  retstr->recordId = sqlite3_column_int(a4, 0);
  retstr->startTime = sqlite3_column_double(a4, 1);
  retstr->pacebin = sqlite3_column_int(a4, 2);
  retstr->kvalue = sqlite3_column_double(a4, 3);
  retstr->kvalueTrack = sqlite3_column_double(a4, 4);
  retstr->score = sqlite3_column_double(a4, 5);
  retstr->endTime = sqlite3_column_double(a4, 6);
  retstr->distance = sqlite3_column_double(a4, 7);
  retstr->steps = sqlite3_column_int(a4, 8);
  retstr->session = sqlite3_column_int(a4, 9);
  retstr->speed = sqlite3_column_double(a4, 10);
  retstr->percentGrade = sqlite3_column_double(a4, 11);
  retstr->gpsSource = sqlite3_column_int(a4, 12);
  retstr->timestamp = 0.0;
  retstr->runningFormStrideLength = sqlite3_column_double(a4, 13);
  result = (CLStrideCalEntry *)sqlite3_column_int(a4, 14);
  retstr->runningFormStrideLengthMetrics = (int)result;
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

- (CMStrideCalibrationEntry)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMStrideCalibrationEntry *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMStrideCalibrationEntry;
    v8 = -[CMStrideCalibrationEntry init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMStrideCalibrationEntry *)v13;
      }
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

@end
