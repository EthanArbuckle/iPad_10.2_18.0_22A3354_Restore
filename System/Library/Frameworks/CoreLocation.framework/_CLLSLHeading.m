@implementation _CLLSLHeading

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLLSLHeading;
  -[_CLLSLHeading dealloc](&v3, sel_dealloc);
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(double *)(v12 + 8) = self->_timestamp;
  v13 = *(_OWORD *)&self->_anon_50[32];
  v14 = *(_OWORD *)&self->_anon_50[48];
  v15 = *(_OWORD *)&self->_anon_50[80];
  *(_OWORD *)(v12 + 144) = *(_OWORD *)&self->_anon_50[64];
  *(_OWORD *)(v12 + 160) = v15;
  *(_OWORD *)(v12 + 112) = v13;
  *(_OWORD *)(v12 + 128) = v14;
  v16 = *(_OWORD *)&self->_anon_50[16];
  *(_OWORD *)(v12 + 80) = *(_OWORD *)self->_anon_50;
  *(_OWORD *)(v12 + 96) = v16;
  v17 = *(_OWORD *)&self[1]._confidence;
  *(_OWORD *)(v12 + 176) = *(_OWORD *)&self[1].super.isa;
  *(_OWORD *)(v12 + 192) = v17;
  v18 = *(_OWORD *)self[1]._anon_50;
  v20 = *(_OWORD *)&self[1]._location;
  v19 = *(_OWORD *)self[1]._rotationalAccuracyInRadians;
  *(_OWORD *)(v12 + 240) = *(_OWORD *)&self[1]._rotationalAccuracyInRadians[16];
  *(_OWORD *)(v12 + 256) = v18;
  *(_OWORD *)(v12 + 208) = v20;
  *(_OWORD *)(v12 + 224) = v19;
  v21 = *(_OWORD *)&self->_rotationalAccuracyInRadians[16];
  *(_OWORD *)(v12 + 48) = *(_OWORD *)self->_rotationalAccuracyInRadians;
  *(_OWORD *)(v12 + 64) = v21;
  *(double *)(v12 + 16) = self->_confidence;
  *(_QWORD *)(v12 + 24) = self->_globalReferenceFrame;
  *(_QWORD *)(v12 + 32) = objc_msgSend_copyWithZone_(self->_location, v22, (uint64_t)a3, v23);
  *(_QWORD *)(v12 + 40) = objc_msgSend_copyWithZone_(self->_supplemantaryInfo, v24, (uint64_t)a3, v25);
  return (id)v12;
}

- (_CLLSLHeading)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  _CLLSLHeading *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)_CLLSLHeading;
  v6 = -[_CLLSLHeading init](&v42, sel_init);
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("timestamp"), v5);
    v6->_timestamp = v7;
    v8 = objc_opt_class();
    v10 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("rotationFromGlobalToDeviceFrame"));
    if (!v10)
      goto LABEL_9;
    v14 = v10;
    if (objc_msgSend_length(v10, v11, v12, v13) != 96)
      goto LABEL_9;
    objc_msgSend_getBytes_length_(v14, v15, (uint64_t)v6->_anon_50, 96);
    v16 = objc_opt_class();
    v18 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("rotationFromGlobalToCameraFrame"));
    if (!v18)
      goto LABEL_9;
    v22 = v18;
    if (objc_msgSend_length(v18, v19, v20, v21) == 96
      && (objc_msgSend_getBytes_length_(v22, v23, (uint64_t)&v6[1], 96),
          v24 = objc_opt_class(),
          (v26 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v25, v24, (uint64_t)CFSTR("rotationalAccuracyInRadians"))) != 0)&& (v30 = v26, objc_msgSend_length(v26, v27, v28, v29) == 32))
    {
      objc_msgSend_getBytes_length_(v30, v31, (uint64_t)v6->_rotationalAccuracyInRadians, 32);
      objc_msgSend_decodeDoubleForKey_(a3, v32, (uint64_t)CFSTR("confidence"), v33);
      v6->_confidence = v34;
      v6->_globalReferenceFrame = objc_msgSend_decodeIntegerForKey_(a3, v35, (uint64_t)CFSTR("globalReferenceFrame"), v36);
      v37 = objc_opt_class();
      v6->_location = (_CLLSLLocation *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v38, v37, (uint64_t)CFSTR("location"));
      v39 = objc_opt_class();
      v6->_supplemantaryInfo = (_CLLSLHeadingSupplInfo *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v40, v39, (uint64_t)CFSTR("supplemantaryInfo"));
    }
    else
    {
LABEL_9:

      return 0;
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("timestamp"), v3, self->_timestamp);
  v7 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)self->_anon_50, 96);
  objc_msgSend_encodeObject_forKey_(a3, v8, v7, (uint64_t)CFSTR("rotationFromGlobalToDeviceFrame"));
  v10 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v9, (uint64_t)&self[1], 96);
  objc_msgSend_encodeObject_forKey_(a3, v11, v10, (uint64_t)CFSTR("rotationFromGlobalToCameraFrame"));
  v13 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v12, (uint64_t)self->_rotationalAccuracyInRadians, 32);
  objc_msgSend_encodeObject_forKey_(a3, v14, v13, (uint64_t)CFSTR("rotationalAccuracyInRadians"));
  objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("confidence"), v16, self->_confidence);
  objc_msgSend_encodeInteger_forKey_(a3, v17, self->_globalReferenceFrame, (uint64_t)CFSTR("globalReferenceFrame"));
  objc_msgSend_encodeObject_forKey_(a3, v18, (uint64_t)self->_location, (uint64_t)CFSTR("location"));
  objc_msgSend_encodeObject_forKey_(a3, v19, (uint64_t)self->_supplemantaryInfo, (uint64_t)CFSTR("supplemantaryInfo"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithMemberIndent_endIndent_(self, a2, (uint64_t)CFSTR("\t"), (uint64_t)&stru_1E2993188);
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v107;
  unint64_t v108;
  int64x2_t v109;
  int64x2_t v110;
  int64x2_t v111;
  __int128 v112;
  int64x2_t v113;
  int64x2_t v114;
  uint64_t v115;
  int64x2_t v116;
  uint64_t v117;
  int64x2_t v118;
  int64x2_t v119;
  int64x2_t v120;
  int64x2_t v121;
  __int128 v122;
  uint64_t v123;
  uint64_t v124;
  int64x2_t v125;
  int64x2_t v126;
  uint64_t v127;
  int8x16_t v128;
  uint64_t v129;
  uint64_t v130;
  int64x2_t v131;
  int64x2_t v132;
  int64x2_t v133;
  int64x2_t v134;
  uint64_t v135;
  uint64_t v136;
  int64x2_t v137;
  int64x2_t v138;
  uint64_t v139;
  int64x2_t v140;
  int64x2_t v141;
  int64x2_t v142;
  int64x2_t v143;
  uint64_t v144;
  uint64_t v145;
  int64x2_t v146;
  int64x2_t v147;

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_timestamp(self, a2, (uint64_t)a3, (uint64_t)a4);
  v12 = v11;
  if (self)
  {
    objc_msgSend_rotationFromGlobalToDeviceFrame(self, v8, v9, v10);
    v126 = v147;
    objc_msgSend_rotationFromGlobalToDeviceFrame(self, v13, v14, v15);
    v125 = v146;
    objc_msgSend_rotationFromGlobalToDeviceFrame(self, v16, v17, v18);
    v124 = v145;
    objc_msgSend_rotationFromGlobalToDeviceFrame(self, v19, v20, v21);
    *((_QWORD *)&v122 + 1) = v144;
    objc_msgSend_rotationFromGlobalToDeviceFrame(self, v22, v23, v24);
    v121 = v143;
    objc_msgSend_rotationFromGlobalToDeviceFrame(self, v25, v26, v27);
    v120 = v142;
    objc_msgSend_rotationFromGlobalToDeviceFrame(self, v28, v29, v30);
    v118 = v141;
    objc_msgSend_rotationFromGlobalToDeviceFrame(self, v31, v32, v33);
    v119 = v140;
    objc_msgSend_rotationFromGlobalToDeviceFrame(self, v34, v35, v36);
    v117 = v139;
    objc_msgSend_rotationFromGlobalToCameraFrame(self, v37, v38, v39);
    v116 = v138;
    objc_msgSend_rotationFromGlobalToCameraFrame(self, v40, v41, v42);
    v114 = v137;
    objc_msgSend_rotationFromGlobalToCameraFrame(self, v43, v44, v45);
    v115 = v136;
    objc_msgSend_rotationFromGlobalToCameraFrame(self, v46, v47, v48);
    *((_QWORD *)&v112 + 1) = v135;
    objc_msgSend_rotationFromGlobalToCameraFrame(self, v49, v50, v51);
    v113 = v134;
    objc_msgSend_rotationFromGlobalToCameraFrame(self, v52, v53, v54);
    v110 = v133;
    objc_msgSend_rotationFromGlobalToCameraFrame(self, v55, v56, v57);
    v111 = v132;
    objc_msgSend_rotationFromGlobalToCameraFrame(self, v58, v59, v60);
    v109 = v131;
    objc_msgSend_rotationFromGlobalToCameraFrame(self, v61, v62, v63);
    v123 = v130;
    objc_msgSend_rotationalAccuracyInRadians(self, v64, v65, v66);
    v107 = v129;
    objc_msgSend_rotationalAccuracyInRadians(self, v67, v68, v69);
    v108 = vextq_s8(v128, v128, 8uLL).u64[0];
    objc_msgSend_rotationalAccuracyInRadians(self, v70, v71, v72);
    v73 = v127;
  }
  else
  {
    v108 = 0;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0;
    v116 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v125 = 0u;
    v126 = 0u;
    v124 = 0;
    v117 = 0;
    v118 = 0u;
    v109 = 0u;
    v110 = 0u;
    v107 = 0;
    v73 = 0;
    v123 = 0;
  }
  objc_msgSend_confidence(self, v8, v9, v10);
  v75 = v74;
  v79 = objc_msgSend_globalReferenceFrame(self, v76, v77, v78);
  v83 = (void *)objc_msgSend_location(self, v80, v81, v82);
  v86 = objc_msgSend_stringByAppendingString_(a3, v84, (uint64_t)CFSTR("\t"), v85);
  v89 = objc_msgSend_stringByAppendingString_(a4, v87, (uint64_t)CFSTR("\t"), v88);
  v91 = objc_msgSend_descriptionWithMemberIndent_endIndent_(v83, v90, v86, v89);
  v95 = (void *)objc_msgSend_supplemantaryInfo(self, v92, v93, v94);
  v98 = objc_msgSend_stringByAppendingString_(a3, v96, (uint64_t)CFSTR("\t"), v97);
  v101 = objc_msgSend_stringByAppendingString_(a4, v99, (uint64_t)CFSTR("\t"), v100);
  v103 = objc_msgSend_descriptionWithMemberIndent_endIndent_(v95, v102, v98, v101);
  return (id)objc_msgSend_stringWithFormat_(v7, v104, (uint64_t)CFSTR("<_CLLSLHeading: %p> {\n%@.timestamp = %f,\n%@.rotationFromGlobalToDeviceFrame = [%f, %f, %f; %f, %f, %f; %f, %f, %f],\n%@.rotationFromGlobalToCameraFrame = [%f, %f, %f; %f, %f, %f; %f, %f, %f],\n%@.rotationalAccuracyInRadians = [%f, %f, %f],\n%@.confidence = %f,\n%@.globalReferenceFrame = %zu,\n%@.location = %@,\n%@.supplemantryInfo = %@\n%@}"),
               v105,
               self,
               a3,
               v12,
               a3,
               vzip1q_s64(v126, v125),
               v124,
               *((_QWORD *)&v122 + 1),
               vzip2q_s64(v121, v120),
               vzip1q_s64(v118, v119),
               v117,
               a3,
               vzip1q_s64(v116, v114),
               v115,
               *((_QWORD *)&v112 + 1),
               vzip2q_s64(v113, v110),
               vzip1q_s64(v111, v109),
               v123,
               a3,
               v107,
               v108,
               v73,
               a3,
               v75,
               a3,
               v79,
               a3,
               v91,
               a3,
               v103,
               a4);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__n128)rotationFromGlobalToDeviceFrame
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;

  v2 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 48) = v2;
  v3 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 80) = v3;
  result = *(__n128 *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 96);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)setRotationFromGlobalToDeviceFrame:(uint64_t)a3
{
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)a3;
  *(_OWORD *)(a1 + 96) = v3;
  result = *(__n128 *)(a3 + 32);
  v5 = *(_OWORD *)(a3 + 48);
  v6 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(a1 + 160) = v6;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v5;
  return result;
}

- (__n128)rotationFromGlobalToCameraFrame
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;

  v2 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 48) = v2;
  v3 = *(_OWORD *)(a1 + 256);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 240);
  *(_OWORD *)(a2 + 80) = v3;
  result = *(__n128 *)(a1 + 176);
  v5 = *(_OWORD *)(a1 + 192);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)setRotationFromGlobalToCameraFrame:(uint64_t)a3
{
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)a3;
  *(_OWORD *)(a1 + 192) = v3;
  result = *(__n128 *)(a3 + 32);
  v5 = *(_OWORD *)(a3 + 48);
  v6 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(a1 + 256) = v6;
  *(__n128 *)(a1 + 208) = result;
  *(_OWORD *)(a1 + 224) = v5;
  return result;
}

- (__n128)rotationalAccuracyInRadians
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 48);
  v3 = *(_OWORD *)(a1 + 64);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setRotationalAccuracyInRadians:(_CLLSLHeading *)self
{
  _OWORD *v2;
  __int128 v3;

  v3 = v2[1];
  *(_OWORD *)self->_rotationalAccuracyInRadians = *v2;
  *(_OWORD *)&self->_rotationalAccuracyInRadians[16] = v3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (unint64_t)globalReferenceFrame
{
  return self->_globalReferenceFrame;
}

- (void)setGlobalReferenceFrame:(unint64_t)a3
{
  self->_globalReferenceFrame = a3;
}

- (_CLLSLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_CLLSLHeadingSupplInfo)supplemantaryInfo
{
  return self->_supplemantaryInfo;
}

- (void)setSupplemantaryInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
