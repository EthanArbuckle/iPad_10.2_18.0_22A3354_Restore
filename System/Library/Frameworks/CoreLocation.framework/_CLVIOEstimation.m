@implementation _CLVIOEstimation

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLVIOEstimation;
  -[_CLVIOEstimation dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  CGSize cameraImageResolution;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 8) = self->_trackingState;
  *(double *)(v12 + 16) = self->_originTimestamp;
  *(double *)(v12 + 24) = self->_timestamp;
  v13 = *(_OWORD *)&self->_inertialStateInfo.stateLengthInBytes;
  *(_QWORD *)(v12 + 80) = *(_QWORD *)&self->_inertialStateInfo.accelBiasLength;
  *(_OWORD *)(v12 + 64) = v13;
  *(_QWORD *)(v12 + 32) = objc_msgSend_copyWithZone_(self->_inertialState, v14, (uint64_t)a3, v15);
  v16 = *(_QWORD *)&self->_inertialCovarianceInfo.accelBiasDof;
  *(_OWORD *)(v12 + 88) = *(_OWORD *)&self->_inertialCovarianceInfo.covarianceSizeInBytes;
  *(_QWORD *)(v12 + 104) = v16;
  *(_QWORD *)(v12 + 40) = objc_msgSend_copyWithZone_(self->_inertialCovariance, v17, (uint64_t)a3, v18);
  cameraImageResolution = self[1]._cameraImageResolution;
  v21 = *(_OWORD *)&self[1].super.isa;
  v20 = *(_OWORD *)&self[1]._originTimestamp;
  *(_OWORD *)(v12 + 192) = *(_OWORD *)&self[1]._inertialState;
  *(CGSize *)(v12 + 208) = cameraImageResolution;
  *(_OWORD *)(v12 + 160) = v21;
  *(_OWORD *)(v12 + 176) = v20;
  v23 = *(_OWORD *)&self->_anon_70[16];
  v22 = *(_OWORD *)&self->_anon_70[32];
  *(_OWORD *)(v12 + 112) = *(_OWORD *)self->_anon_70;
  *(_OWORD *)(v12 + 128) = v23;
  *(_OWORD *)(v12 + 144) = v22;
  *(CGSize *)(v12 + 48) = self->_cameraImageResolution;
  return (id)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLVIOEstimation)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  _CLVIOEstimation *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSData *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSData *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  NSData *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSData *v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)_CLVIOEstimation;
  v6 = -[_CLVIOEstimation init](&v70, sel_init);
  if (v6)
  {
    v6->_trackingState = objc_msgSend_decodeIntForKey_(a3, v4, (uint64_t)CFSTR("trackingState"), v5);
    objc_msgSend_decodeDoubleForKey_(a3, v7, (uint64_t)CFSTR("originTimestamp"), v8);
    v6->_originTimestamp = v9;
    objc_msgSend_decodeDoubleForKey_(a3, v10, (uint64_t)CFSTR("timestamp"), v11);
    v6->_timestamp = v12;
    v13 = objc_opt_class();
    v15 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("inertialStateInfo"));
    if (!v15)
      goto LABEL_20;
    v19 = v15;
    if (objc_msgSend_length(v15, v16, v17, v18) != 24)
      goto LABEL_20;
    objc_msgSend_getBytes_length_(v19, v20, (uint64_t)&v6->_inertialStateInfo, 24);
    v21 = objc_opt_class();
    v23 = (NSData *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v22, v21, (uint64_t)CFSTR("inertialState"));
    if (v23)
    {
      v27 = v23;
      if (objc_msgSend_length(v23, v24, v25, v26) == v6->_inertialStateInfo.stateLengthInBytes)
        v23 = v27;
      else
        v23 = 0;
    }
    v6->_inertialState = v23;
    v28 = objc_opt_class();
    v30 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v29, v28, (uint64_t)CFSTR("inertialCovarianceInfo"));
    if (!v30)
      goto LABEL_20;
    v34 = v30;
    if (objc_msgSend_length(v30, v31, v32, v33) != 24)
      goto LABEL_20;
    objc_msgSend_getBytes_length_(v34, v35, (uint64_t)&v6->_inertialCovarianceInfo, 24);
    v36 = objc_opt_class();
    v38 = (NSData *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v37, v36, (uint64_t)CFSTR("inertialCovariance"));
    if (v38)
    {
      v42 = v38;
      if (objc_msgSend_length(v38, v39, v40, v41) == v6->_inertialCovarianceInfo.covarianceSizeInBytes)
        v38 = v42;
      else
        v38 = 0;
    }
    v6->_inertialCovariance = v38;
    v43 = objc_opt_class();
    v45 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v44, v43, (uint64_t)CFSTR("cameraPose"));
    if (!v45)
      goto LABEL_20;
    v49 = v45;
    if (objc_msgSend_length(v45, v46, v47, v48) != 64)
      goto LABEL_20;
    objc_msgSend_getBytes_length_(v49, v50, (uint64_t)&v6[1], 64);
    v51 = objc_opt_class();
    v53 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v52, v51, (uint64_t)CFSTR("cameraIntrinsics"));
    if (!v53)
      goto LABEL_20;
    v57 = v53;
    if (objc_msgSend_length(v53, v54, v55, v56) == 48
      && (objc_msgSend_getBytes_length_(v57, v58, (uint64_t)v6->_anon_70, 48),
          v59 = objc_opt_class(),
          (v61 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v60, v59, (uint64_t)CFSTR("cameraImageResolutionKey"))) != 0)
      && (v65 = v61, v66 = (const char *)objc_msgSend_objCType(v61, v62, v63, v64), !strcmp(v66, "{CGSize=dd}")))
    {
      objc_msgSend_getValue_(v65, v67, (uint64_t)&v6->_cameraImageResolution, v68);
    }
    else
    {
LABEL_20:

      return 0;
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;

  objc_msgSend_encodeInt_forKey_(a3, a2, self->_trackingState, (uint64_t)CFSTR("trackingState"));
  objc_msgSend_encodeDouble_forKey_(a3, v5, (uint64_t)CFSTR("originTimestamp"), v6, self->_originTimestamp);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("timestamp"), v8, self->_timestamp);
  v10 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v9, (uint64_t)&self->_inertialStateInfo, 24);
  objc_msgSend_encodeObject_forKey_(a3, v11, v10, (uint64_t)CFSTR("inertialStateInfo"));
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->_inertialState, (uint64_t)CFSTR("inertialState"));
  v14 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v13, (uint64_t)&self->_inertialCovarianceInfo, 24);
  objc_msgSend_encodeObject_forKey_(a3, v15, v14, (uint64_t)CFSTR("inertialCovarianceInfo"));
  objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)self->_inertialCovariance, (uint64_t)CFSTR("inertialCovariance"));
  v18 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v17, (uint64_t)&self[1], 64);
  objc_msgSend_encodeObject_forKey_(a3, v19, v18, (uint64_t)CFSTR("cameraPose"));
  v21 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v20, (uint64_t)self->_anon_70, 48);
  objc_msgSend_encodeObject_forKey_(a3, v22, v21, (uint64_t)CFSTR("cameraIntrinsics"));
  v24 = objc_msgSend_value_withObjCType_(MEMORY[0x1E0CB3B18], v23, (uint64_t)&self->_cameraImageResolution, (uint64_t)"{CGSize=dd}");
  objc_msgSend_encodeObject_forKey_(a3, v25, v24, (uint64_t)CFSTR("cameraImageResolutionKey"));
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithMemberIndent_endIndent_(self, a2, (uint64_t)CFSTR("\t"), (uint64_t)&stru_1E2993188);
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  float v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  float v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  float v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  float v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  float v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  float v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  float v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  float v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  float v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  float v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  float v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  float v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  float v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  float v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  float v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  float v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  float v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  float v118;
  double v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  float v123;
  double v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  float v128;
  double v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  float v133;
  double v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  float v138;
  double v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  float v143;
  double v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  float v148;
  double v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  unsigned __int8 v186;
  uint64_t v187;
  unsigned __int8 v188;
  uint64_t v189;

  v7 = objc_msgSend_stringByAppendingString_(a3, a2, (uint64_t)CFSTR("\t"), (uint64_t)a4);
  v185 = (void *)MEMORY[0x1E0CB3940];
  v184 = objc_msgSend_trackingState(self, v8, v9, v10);
  objc_msgSend_originTimestamp(self, v11, v12, v13);
  v183 = v14;
  objc_msgSend_timestamp(self, v15, v16, v17);
  v182 = v21;
  if (self)
  {
    objc_msgSend_inertialStateInfo(self, v18, v19, v20);
    v181 = v189;
    objc_msgSend_inertialStateInfo(self, v22, v23, v24);
    v180 = v188;
  }
  else
  {
    v180 = 0;
    v181 = 0;
  }
  v25 = objc_msgSend_inertialState(self, v18, v19, v20);
  v32 = objc_msgSend_inertialState(self, v26, v27, v28);
  if (self)
  {
    objc_msgSend_inertialCovarianceInfo(self, v29, v30, v31);
    v33 = v187;
    objc_msgSend_inertialCovarianceInfo(self, v34, v35, v36);
    v37 = v186;
  }
  else
  {
    v37 = 0;
    v33 = 0;
  }
  v38 = objc_msgSend_inertialCovariance(self, v29, v30, v31);
  v42 = objc_msgSend_inertialCovariance(self, v39, v40, v41);
  objc_msgSend_cameraPose(self, v43, v44, v45);
  v179 = v46;
  objc_msgSend_cameraPose(self, v47, v48, v49);
  v178 = v50;
  objc_msgSend_cameraPose(self, v51, v52, v53);
  v177 = v54;
  objc_msgSend_cameraPose(self, v55, v56, v57);
  v176 = v58;
  objc_msgSend_cameraPose(self, v59, v60, v61);
  v175 = v62;
  objc_msgSend_cameraPose(self, v63, v64, v65);
  v174 = v66;
  objc_msgSend_cameraPose(self, v67, v68, v69);
  v173 = v70;
  objc_msgSend_cameraPose(self, v71, v72, v73);
  v172 = v74;
  objc_msgSend_cameraPose(self, v75, v76, v77);
  v171 = v78;
  objc_msgSend_cameraPose(self, v79, v80, v81);
  v170 = v82;
  objc_msgSend_cameraPose(self, v83, v84, v85);
  v169 = v86;
  objc_msgSend_cameraPose(self, v87, v88, v89);
  v168 = v90;
  objc_msgSend_cameraPose(self, v91, v92, v93);
  v167 = v94;
  objc_msgSend_cameraPose(self, v95, v96, v97);
  v166 = v98;
  objc_msgSend_cameraPose(self, v99, v100, v101);
  v165 = v102;
  objc_msgSend_cameraPose(self, v103, v104, v105);
  v164 = v106;
  objc_msgSend_cameraIntrinsics(self, v107, v108, v109);
  v163 = v110;
  objc_msgSend_cameraIntrinsics(self, v111, v112, v113);
  v162 = v114;
  objc_msgSend_cameraIntrinsics(self, v115, v116, v117);
  v119 = v118;
  objc_msgSend_cameraIntrinsics(self, v120, v121, v122);
  v124 = v123;
  objc_msgSend_cameraIntrinsics(self, v125, v126, v127);
  v129 = v128;
  objc_msgSend_cameraIntrinsics(self, v130, v131, v132);
  v134 = v133;
  objc_msgSend_cameraIntrinsics(self, v135, v136, v137);
  v139 = v138;
  objc_msgSend_cameraIntrinsics(self, v140, v141, v142);
  v144 = v143;
  objc_msgSend_cameraIntrinsics(self, v145, v146, v147);
  v149 = v148;
  objc_msgSend_cameraImageResolution(self, v150, v151, v152);
  v154 = v153;
  objc_msgSend_cameraImageResolution(self, v155, v156, v157);
  return (id)objc_msgSend_stringWithFormat_(v185, v158, (uint64_t)CFSTR("<_CLVIOEstimation: %p> {\n%@.trackingState = %d,\n%@.originTimestamp = %f,\n%@.timestamp = %f,\n%@.inertialStateInfo = { .stateLengthInbytes = %lu, .stateLength = %d, ... },\n%@.inertialState = <NSData: %p> %@,\n%@.inertialCovarianceInfo = { .covarianceSizeInbytes = %lu, .covariance = %d, ... },\n%@.inertialCovariance = <NSData: %p> %@,\n%@.cameraPose = [%f, %f, %f, %f;\n%@%f, %f, %f, %f;\n%@%f, %f, %f, %f;\n%@%f, %f, %f, %f],\n%@.cameraIntrinsics = [%f, %f, %f;\n%@%f, %f, %f;\n%@%f, %f, %f],\n%@.cameraImageResolution = [%f, %f]\n%@}"),
               v159,
               self,
               a3,
               v184,
               a3,
               v183,
               a3,
               v182,
               a3,
               v181,
               v180,
               a3,
               v25,
               v32,
               a3,
               v33,
               v37,
               a3,
               v38,
               v42,
               a3,
               *(_QWORD *)&v179,
               *(_QWORD *)&v178,
               *(_QWORD *)&v177,
               *(_QWORD *)&v176,
               v7,
               *(_QWORD *)&v175,
               *(_QWORD *)&v174,
               *(_QWORD *)&v173,
               *(_QWORD *)&v172,
               v7,
               *(_QWORD *)&v171,
               *(_QWORD *)&v170,
               *(_QWORD *)&v169,
               *(_QWORD *)&v168,
               v7,
               *(_QWORD *)&v167,
               *(_QWORD *)&v166,
               *(_QWORD *)&v165,
               *(_QWORD *)&v164,
               a3,
               *(_QWORD *)&v163,
               *(_QWORD *)&v162,
               *(_QWORD *)&v119,
               v7,
               *(_QWORD *)&v124,
               *(_QWORD *)&v129,
               *(_QWORD *)&v134,
               v7,
               *(_QWORD *)&v139,
               *(_QWORD *)&v144,
               *(_QWORD *)&v149,
               a3,
               v154,
               v160,
               a4);
}

- (int)trackingState
{
  return self->_trackingState;
}

- (void)setTrackingState:(int)a3
{
  self->_trackingState = a3;
}

- (double)originTimestamp
{
  return self->_originTimestamp;
}

- (void)setOriginTimestamp:(double)a3
{
  self->_originTimestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- ($32BA332289ABAE23D53D73F2D068366F)inertialStateInfo
{
  *($D63A2728CA9665032051242DAECBF9E9 *)retstr = *($D63A2728CA9665032051242DAECBF9E9 *)((char *)self + 64);
  return self;
}

- (void)setInertialStateInfo:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_inertialStateInfo.accelBiasLength = *(_QWORD *)&a3->var9;
  *(_OWORD *)&self->_inertialStateInfo.stateLengthInBytes = v3;
}

- (NSData)inertialState
{
  return self->_inertialState;
}

- (void)setInertialState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- ($32BA332289ABAE23D53D73F2D068366F)inertialCovarianceInfo
{
  *($3FD82D8236BD1EB6D0991DFE4CE69973 *)retstr = *($3FD82D8236BD1EB6D0991DFE4CE69973 *)((char *)self + 88);
  return self;
}

- (void)setInertialCovarianceInfo:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_inertialCovarianceInfo.accelBiasDof = *(_QWORD *)&a3->var9;
  *(_OWORD *)&self->_inertialCovarianceInfo.covarianceSizeInBytes = v3;
}

- (NSData)inertialCovariance
{
  return self->_inertialCovariance;
}

- (void)setInertialCovariance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (__n128)cameraPose
{
  return a1[10];
}

- (__n128)setCameraPose:(__n128)a3
{
  result[10] = a2;
  result[11] = a3;
  result[12] = a4;
  result[13] = a5;
  return result;
}

- (__n128)cameraIntrinsics
{
  return a1[7];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  return result;
}

- (CGSize)cameraImageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_cameraImageResolution.width;
  height = self->_cameraImageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCameraImageResolution:(CGSize)a3
{
  self->_cameraImageResolution = a3;
}

@end
