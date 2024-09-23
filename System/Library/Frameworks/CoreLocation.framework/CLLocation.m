@implementation CLLocation

- (int)type
{
  return *((_DWORD *)self->_internal + 26);
}

- (CLLocationDistance)altitude
{
  return *(double *)((char *)self->_internal + 36);
}

- (CLLocationSpeed)speed
{
  return *(double *)((char *)self->_internal + 52);
}

- (id)propagateLocationToTime:(double)a3
{
  char *internal;
  CLLocation *v4;
  const char *v5;
  uint64_t v6;
  _OWORD v8[8];
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[2];

  internal = (char *)self->_internal;
  v16 = xmmword_18F7762E8;
  v17 = unk_18F7762F8;
  memset(v18, 0, 28);
  v12 = xmmword_18F7762A8;
  v13 = unk_18F7762B8;
  v14 = xmmword_18F7762C8;
  v15 = unk_18F7762D8;
  v10 = xmmword_18F776288;
  v11 = unk_18F776298;
  sub_18F5CDA60(internal + 8, (uint64_t)&v10, a3);
  v4 = [CLLocation alloc];
  v8[6] = v16;
  v8[7] = v17;
  v9[0] = v18[0];
  *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)((char *)v18 + 12);
  v8[2] = v12;
  v8[3] = v13;
  v8[4] = v14;
  v8[5] = v15;
  v8[0] = v10;
  v8[1] = v11;
  return (id)objc_msgSend_initWithClientLocation_(v4, v5, (uint64_t)v8, v6);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  char *internal;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  const char *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;

  internal = (char *)self->_internal;
  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) != 0)
  {
    objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("kCLLocationCodingKeyCoordinateLatitude"), v8, *(double *)(internal + 12));
    objc_msgSend_encodeDouble_forKey_(a3, v9, (uint64_t)CFSTR("kCLLocationCodingKeyCoordinateLongitude"), v10, *(double *)(internal + 20));
    objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("kCLLocationCodingKeyHorizontalAccuracy"), v12, *(double *)(internal + 28));
    objc_msgSend_encodeDouble_forKey_(a3, v13, (uint64_t)CFSTR("kCLLocationCodingKeyAltitude"), v14, *(double *)(internal + 36));
    objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("kCLLocationCodingKeyVerticalAccuracy"), v16, *(double *)(internal + 44));
    objc_msgSend_encodeDouble_forKey_(a3, v17, (uint64_t)CFSTR("kCLLocationCodingKeySpeed"), v18, *(double *)(internal + 52));
    objc_msgSend_encodeDouble_forKey_(a3, v19, (uint64_t)CFSTR("kCLLocationCodingKeySpeedAccuracy"), v20, *(double *)(internal + 60));
    objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("kCLLocationCodingKeyCourse"), v22, *(double *)(internal + 68));
    objc_msgSend_encodeDouble_forKey_(a3, v23, (uint64_t)CFSTR("kCLLocationCodingKeyCourseAccuracy"), v24, *(double *)(internal + 76));
    objc_msgSend_encodeDouble_forKey_(a3, v25, (uint64_t)CFSTR("kCLLocationCodingKeyTimestamp"), v26, *(double *)(internal + 84));
    objc_msgSend_encodeInt_forKey_(a3, v27, *((unsigned int *)internal + 26), (uint64_t)CFSTR("kCLLocationCodingKeyType"));
    objc_msgSend_encodeDouble_forKey_(a3, v28, (uint64_t)CFSTR("kCLLocationCodingKeyLifespan"), v29, *((double *)internal + 12));
    objc_msgSend_encodeInt_forKey_(a3, v30, *((unsigned int *)internal + 33), (uint64_t)CFSTR("kCLLocationCodingKeyFloor"));
    objc_msgSend_encodeInt_forKey_(a3, v31, *((unsigned int *)internal + 34), (uint64_t)CFSTR("kCLLocationCodingKeyIntegrity"));
    objc_msgSend_encodeInt_forKey_(a3, v32, *((unsigned int *)internal + 35), (uint64_t)CFSTR("reserved"));
    objc_msgSend_encodeObject_forKey_(a3, v33, *((_QWORD *)internal + 21), (uint64_t)CFSTR("kCLLocationCodingKeyMatchInfo"));
    objc_msgSend_encodeObject_forKey_(a3, v34, *((_QWORD *)internal + 22), (uint64_t)CFSTR("kCLLocationCodingKeyGroundAltitude"));
    objc_msgSend_encodeObject_forKey_(a3, v35, *((_QWORD *)internal + 25), (uint64_t)CFSTR("kCLLocationCodingKeyFusionInfo"));
    objc_msgSend_encodeObject_forKey_(a3, v36, *((_QWORD *)internal + 26), (uint64_t)CFSTR("kCLLocationCodingKeyTrackRunInfo"));
    objc_msgSend_encodeObject_forKey_(a3, v37, *((_QWORD *)internal + 24), (uint64_t)CFSTR("kCLLocationCodingKeyCoarseMetaData"));
    objc_msgSend_encodeDouble_forKey_(a3, v38, (uint64_t)CFSTR("kCLLocationCodingKeyRawCoordinateLatitude"), v39, *(double *)(internal + 108));
    objc_msgSend_encodeDouble_forKey_(a3, v40, (uint64_t)CFSTR("kCLLocationCodingKeyRawCoordinateLongitude"), v41, *(double *)(internal + 116));
    objc_msgSend_encodeDouble_forKey_(a3, v42, (uint64_t)CFSTR("kCLLocationCodingKeyRawHorizontalAccuracy"), v43, *((double *)internal + 27));
    objc_msgSend_encodeInt_forKey_(a3, v44, *((unsigned int *)internal + 36), (uint64_t)CFSTR("kCLLocationCodingKeyRawReferenceFrame"));
    objc_msgSend_encodeDouble_forKey_(a3, v45, (uint64_t)CFSTR("kCLLocationCodingKeyRawAltitude"), v46, *((double *)internal + 28));
    objc_msgSend_encodeDouble_forKey_(a3, v47, (uint64_t)CFSTR("kCLLocationCodingKeyRawVerticalAccuracy"), v48, *((double *)internal + 29));
    objc_msgSend_encodeDouble_forKey_(a3, v49, (uint64_t)CFSTR("kCLLocationCodingKeyRawCourse"), v50, *(double *)(internal + 124));
    objc_msgSend_encodeDouble_forKey_(a3, v51, (uint64_t)CFSTR("kCLLocationCodingKeyRawCourseAccuracy"), v52, *((double *)internal + 30));
    objc_msgSend_encodeInt_forKey_(a3, v53, *((unsigned int *)internal + 37), (uint64_t)CFSTR("kCLLocationCodingKeySignalEnvironmentType"));
    objc_msgSend_encodeDouble_forKey_(a3, v54, (uint64_t)CFSTR("kCLLocationCodingKeyEllipsoidalAltitude"), v55, *((double *)internal + 19));
    objc_msgSend_encodeInt_forKey_(a3, v56, *((unsigned int *)internal + 62), (uint64_t)CFSTR("kCLLocationCodingKeyPositionContextState"));
    objc_msgSend_encodeDouble_forKey_(a3, v57, (uint64_t)CFSTR("kCLLocationCodingKeyProbabilityPositionContextStateIndoor"), v58, *((double *)internal + 32));
    objc_msgSend_encodeDouble_forKey_(a3, v59, (uint64_t)CFSTR("kCLLocationCodingKeyProbabilityPositionContextStateOutdoor"), v60, *((double *)internal + 33));
    v64 = objc_msgSend_sourceInformation(self, v61, v62, v63);
    objc_msgSend_encodeObject_forKey_(a3, v65, v64, (uint64_t)CFSTR("kCLLocationCodingKeySimulationParams"));
    objc_msgSend_encodeObject_forKey_(a3, v66, *((_QWORD *)internal + 34), (uint64_t)CFSTR("kCLLocationCodingKeyGnssOdometerInfo"));
  }
  else
  {
    objc_msgSend_encodeValueOfObjCType_at_(a3, v7, (uint64_t)"d", (uint64_t)(internal + 12));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v67, (uint64_t)"d", (uint64_t)(internal + 20));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v68, (uint64_t)"d", (uint64_t)(internal + 28));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v69, (uint64_t)"d", (uint64_t)(internal + 36));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v70, (uint64_t)"d", (uint64_t)(internal + 44));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v71, (uint64_t)"d", (uint64_t)(internal + 52));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v72, (uint64_t)"d", (uint64_t)(internal + 60));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v73, (uint64_t)"d", (uint64_t)(internal + 68));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v74, (uint64_t)"d", (uint64_t)(internal + 76));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v75, (uint64_t)"d", (uint64_t)(internal + 84));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v76, (uint64_t)"i", (uint64_t)(internal + 104));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v77, (uint64_t)"d", (uint64_t)(internal + 96));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v78, (uint64_t)"i", (uint64_t)(internal + 132));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v79, (uint64_t)"I", (uint64_t)(internal + 136));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v80, (uint64_t)"i", (uint64_t)(internal + 140));
    objc_msgSend_encodeObject_(a3, v81, *((_QWORD *)internal + 21), v82);
    objc_msgSend_encodeObject_(a3, v83, *((_QWORD *)internal + 22), v84);
    objc_msgSend_encodeObject_(a3, v85, *((_QWORD *)internal + 25), v86);
    objc_msgSend_encodeObject_(a3, v87, *((_QWORD *)internal + 26), v88);
    objc_msgSend_encodeObject_(a3, v89, *((_QWORD *)internal + 24), v90);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v91, (uint64_t)"d", (uint64_t)(internal + 108));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v92, (uint64_t)"d", (uint64_t)(internal + 116));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v93, (uint64_t)"d", (uint64_t)(internal + 216));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v94, (uint64_t)"i", (uint64_t)(internal + 144));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v95, (uint64_t)"d", (uint64_t)(internal + 224));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v96, (uint64_t)"d", (uint64_t)(internal + 232));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v97, (uint64_t)"d", (uint64_t)(internal + 124));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v98, (uint64_t)"d", (uint64_t)(internal + 240));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v99, (uint64_t)"i", (uint64_t)(internal + 148));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v100, (uint64_t)"d", (uint64_t)(internal + 152));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v101, (uint64_t)"i", (uint64_t)(internal + 248));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v102, (uint64_t)"d", (uint64_t)(internal + 256));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v103, (uint64_t)"d", (uint64_t)(internal + 264));
    v107 = objc_msgSend_sourceInformation(self, v104, v105, v106);
    objc_msgSend_encodeObject_(a3, v108, v107, v109);
    objc_msgSend_encodeObject_(a3, v110, *((_QWORD *)internal + 34), v111);
  }
}

- (CLLocationSourceInformation)sourceInformation
{
  _DWORD *internal;
  CLLocationSourceInformation *v3;
  const char *v4;

  internal = self->_internal;
  v3 = [CLLocationSourceInformation alloc];
  return (CLLocationSourceInformation *)(id)objc_msgSend_initWithSoftwareSimulationState_andExternalAccessoryState_(v3, v4, *((unsigned __int8 *)internal + 160), internal[26] == 3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  _QWORD *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (void *)objc_opt_class();
  v8 = (_QWORD *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v8[1] = objc_msgSend_copy(self->_internal, v9, v10, v11);
  return v8;
}

- (CLLocation)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  double v21;
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
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  int v48;
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
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  double v76;
  double v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  double v82;
  double v83;
  const char *v84;
  uint64_t v85;
  double v86;
  double v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  double v93;
  double v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  const char *v104;
  const char *v105;
  const char *v106;
  const char *v107;
  const char *v108;
  const char *v109;
  const char *v110;
  const char *v111;
  const char *v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  const char *v130;
  const char *v131;
  const char *v132;
  const char *v133;
  const char *v134;
  const char *v135;
  const char *v136;
  const char *v137;
  const char *v138;
  const char *v139;
  const char *v140;
  const char *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  double v151;
  double v152;
  const char *v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  double v157;
  const char *v158;
  uint64_t v159;
  double v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  _OWORD v166[8];
  _OWORD v167[2];
  double v168;
  double v169;
  unsigned int v170;
  unint64_t v171;
  unint64_t v172;
  double v173;
  unint64_t v174;
  _BYTE v175[96];
  _BYTE v176[32];
  _OWORD v177[3];

  *(_OWORD *)v176 = xmmword_18F7762E8;
  *(_OWORD *)&v176[16] = unk_18F7762F8;
  memset(v177, 0, 28);
  *(_OWORD *)&v175[32] = xmmword_18F7762A8;
  *(_OWORD *)&v175[48] = unk_18F7762B8;
  *(_OWORD *)&v175[64] = xmmword_18F7762C8;
  *(_OWORD *)&v175[80] = unk_18F7762D8;
  *(_OWORD *)v175 = xmmword_18F776288;
  *(_OWORD *)&v175[16] = unk_18F776298;
  v173 = 0.0;
  *(double *)&v174 = -1.0;
  *(double *)&v171 = -1.0;
  *(double *)&v172 = -1.0;
  v170 = 0;
  v168 = 0.0;
  v169 = 0.0;
  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    objc_msgSend_decodeValueOfObjCType_at_(a3, v6, (uint64_t)"d", (uint64_t)&v175[4]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v100, (uint64_t)"d", (unint64_t)v175 | 0xC);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v101, (uint64_t)"d", (uint64_t)&v175[20]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v102, (uint64_t)"d", (uint64_t)&v175[28]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v103, (uint64_t)"d", (uint64_t)&v175[36]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v104, (uint64_t)"d", (uint64_t)&v175[44]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v105, (uint64_t)"d", (uint64_t)&v175[52]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v106, (uint64_t)"d", (uint64_t)&v175[60]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v107, (uint64_t)"d", (uint64_t)&v175[68]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v108, (uint64_t)"d", (uint64_t)&v175[76]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v109, (uint64_t)"i", (uint64_t)v176);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v110, (uint64_t)"d", (uint64_t)&v175[88]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v111, (uint64_t)"i", (uint64_t)&v176[28]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v112, (uint64_t)"I", (uint64_t)v177);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v113, (uint64_t)"i", (uint64_t)v177 + 4);
    v53 = objc_msgSend_decodeObject(a3, v114, v115, v116);
    v56 = objc_msgSend_decodeObject(a3, v117, v118, v119);
    v59 = objc_msgSend_decodeObject(a3, v120, v121, v122);
    v62 = objc_msgSend_decodeObject(a3, v123, v124, v125);
    v65 = objc_msgSend_decodeObject(a3, v126, v127, v128);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v129, (uint64_t)"d", (uint64_t)&v176[4]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v130, (uint64_t)"d", (uint64_t)&v176[12]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v131, (uint64_t)"d", (uint64_t)&v174);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v132, (uint64_t)"i", (uint64_t)v177 + 8);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v133, (uint64_t)"d", (uint64_t)&v173);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v134, (uint64_t)"d", (uint64_t)&v172);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v135, (uint64_t)"d", (uint64_t)&v176[20]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v136, (uint64_t)"d", (uint64_t)&v171);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v137, (uint64_t)"i", (uint64_t)v177 + 12);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v138, (uint64_t)"d", (uint64_t)&v177[1]);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v139, (uint64_t)"i", (uint64_t)&v170);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v140, (uint64_t)"d", (uint64_t)&v169);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v141, (uint64_t)"d", (uint64_t)&v168);
    objc_msgSend_decodeObject(a3, v142, v143, v144);
    v148 = objc_msgSend_decodeObject(a3, v145, v146, v147);
    v82 = v173;
    v76 = *(double *)&v174;
    v93 = *(double *)&v171;
    v86 = *(double *)&v172;
    v150 = v170;
    v151 = v168;
    v152 = v169;
    goto LABEL_33;
  }
  objc_msgSend_decodeDoubleForKey_(a3, v6, (uint64_t)CFSTR("kCLLocationCodingKeyCoordinateLatitude"), v7);
  *(_QWORD *)&v175[4] = v8;
  objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("kCLLocationCodingKeyCoordinateLongitude"), v10);
  *(_QWORD *)&v175[12] = v11;
  objc_msgSend_decodeDoubleForKey_(a3, v12, (uint64_t)CFSTR("kCLLocationCodingKeyHorizontalAccuracy"), v13);
  *(_QWORD *)&v175[20] = v14;
  objc_msgSend_decodeDoubleForKey_(a3, v15, (uint64_t)CFSTR("kCLLocationCodingKeyAltitude"), v16);
  *(_QWORD *)&v175[28] = v17;
  objc_msgSend_decodeDoubleForKey_(a3, v18, (uint64_t)CFSTR("kCLLocationCodingKeyVerticalAccuracy"), v19);
  v21 = v20;
  *(double *)&v175[36] = v20;
  objc_msgSend_decodeDoubleForKey_(a3, v22, (uint64_t)CFSTR("kCLLocationCodingKeySpeed"), v23);
  *(_QWORD *)&v175[44] = v24;
  objc_msgSend_decodeDoubleForKey_(a3, v25, (uint64_t)CFSTR("kCLLocationCodingKeySpeedAccuracy"), v26);
  *(_QWORD *)&v175[52] = v27;
  objc_msgSend_decodeDoubleForKey_(a3, v28, (uint64_t)CFSTR("kCLLocationCodingKeyCourse"), v29);
  *(_QWORD *)&v175[60] = v30;
  objc_msgSend_decodeDoubleForKey_(a3, v31, (uint64_t)CFSTR("kCLLocationCodingKeyCourseAccuracy"), v32);
  *(_QWORD *)&v175[68] = v33;
  objc_msgSend_decodeDoubleForKey_(a3, v34, (uint64_t)CFSTR("kCLLocationCodingKeyTimestamp"), v35);
  *(_QWORD *)&v175[76] = v36;
  *(_DWORD *)v176 = objc_msgSend_decodeIntForKey_(a3, v37, (uint64_t)CFSTR("kCLLocationCodingKeyType"), v38);
  objc_msgSend_decodeDoubleForKey_(a3, v39, (uint64_t)CFSTR("kCLLocationCodingKeyLifespan"), v40);
  *(_QWORD *)&v175[88] = v41;
  *(_DWORD *)&v176[28] = objc_msgSend_decodeIntForKey_(a3, v42, (uint64_t)CFSTR("kCLLocationCodingKeyFloor"), v43);
  LODWORD(v177[0]) = objc_msgSend_decodeIntForKey_(a3, v44, (uint64_t)CFSTR("kCLLocationCodingKeyIntegrity"), v45);
  v48 = objc_msgSend_containsValueForKey_(a3, v46, (uint64_t)CFSTR("reserved"), v47);
  if (v48)
    v48 = objc_msgSend_decodeIntForKey_(a3, v49, (uint64_t)CFSTR("reserved"), v50);
  DWORD1(v177[0]) = v48;
  v51 = objc_opt_class();
  v53 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v52, v51, (uint64_t)CFSTR("kCLLocationCodingKeyMatchInfo"));
  v54 = objc_opt_class();
  v56 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v55, v54, (uint64_t)CFSTR("kCLLocationCodingKeyGroundAltitude"));
  v57 = objc_opt_class();
  v59 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v58, v57, (uint64_t)CFSTR("kCLLocationCodingKeyFusionInfo"));
  v60 = objc_opt_class();
  v62 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v61, v60, (uint64_t)CFSTR("kCLLocationCodingKeyTrackRunInfo"));
  v63 = objc_opt_class();
  v65 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v64, v63, (uint64_t)CFSTR("kCLLocationCodingKeyCoarseMetaData"));
  objc_msgSend_decodeDoubleForKey_(a3, v66, (uint64_t)CFSTR("kCLLocationCodingKeyRawCoordinateLatitude"), v67);
  *(_QWORD *)&v176[4] = v68;
  objc_msgSend_decodeDoubleForKey_(a3, v69, (uint64_t)CFSTR("kCLLocationCodingKeyRawCoordinateLongitude"), v70);
  *(_QWORD *)&v176[12] = v71;
  v76 = -1.0;
  if (objc_msgSend_containsValueForKey_(a3, v72, (uint64_t)CFSTR("kCLLocationCodingKeyRawHorizontalAccuracy"), v73))
  {
    objc_msgSend_decodeDoubleForKey_(a3, v74, (uint64_t)CFSTR("kCLLocationCodingKeyRawHorizontalAccuracy"), v75);
    v76 = v77;
    *(double *)&v174 = v77;
  }
  if (objc_msgSend_containsValueForKey_(a3, v74, (uint64_t)CFSTR("kCLLocationCodingKeyRawReferenceFrame"), v75))DWORD2(v177[0]) = objc_msgSend_decodeIntForKey_(a3, v78, (uint64_t)CFSTR("kCLLocationCodingKeyRawReferenceFrame"), v79);
  v82 = 0.0;
  if (objc_msgSend_containsValueForKey_(a3, v78, (uint64_t)CFSTR("kCLLocationCodingKeyRawAltitude"), v79))
  {
    objc_msgSend_decodeDoubleForKey_(a3, v80, (uint64_t)CFSTR("kCLLocationCodingKeyRawAltitude"), v81);
    v82 = v83;
    v173 = v83;
  }
  v86 = -1.0;
  if (objc_msgSend_containsValueForKey_(a3, v80, (uint64_t)CFSTR("kCLLocationCodingKeyRawVerticalAccuracy"), v81))
  {
    objc_msgSend_decodeDoubleForKey_(a3, v84, (uint64_t)CFSTR("kCLLocationCodingKeyRawVerticalAccuracy"), v85);
    v86 = v87;
    *(double *)&v172 = v87;
  }
  if (objc_msgSend_containsValueForKey_(a3, v84, (uint64_t)CFSTR("kCLLocationCodingKeyRawCourse"), v85))
  {
    objc_msgSend_decodeDoubleForKey_(a3, v88, (uint64_t)CFSTR("kCLLocationCodingKeyRawCourse"), v89);
    *(_QWORD *)&v176[20] = v90;
  }
  v93 = -1.0;
  if (objc_msgSend_containsValueForKey_(a3, v88, (uint64_t)CFSTR("kCLLocationCodingKeyRawCourseAccuracy"), v89))
  {
    objc_msgSend_decodeDoubleForKey_(a3, v91, (uint64_t)CFSTR("kCLLocationCodingKeyRawCourseAccuracy"), v92);
    v93 = v94;
    *(double *)&v171 = v94;
  }
  if (objc_msgSend_containsValueForKey_(a3, v91, (uint64_t)CFSTR("kCLLocationCodingKeySignalEnvironmentType"), v92))HIDWORD(v177[0]) = objc_msgSend_decodeIntForKey_(a3, v95, (uint64_t)CFSTR("kCLLocationCodingKeySignalEnvironmentType"), v96);
  if (objc_msgSend_containsValueForKey_(a3, v95, (uint64_t)CFSTR("kCLLocationCodingKeyEllipsoidalAltitude"), v96))
  {
    objc_msgSend_decodeDoubleForKey_(a3, v97, (uint64_t)CFSTR("kCLLocationCodingKeyEllipsoidalAltitude"), v98);
LABEL_22:
    *(_QWORD *)&v177[1] = v99;
    goto LABEL_23;
  }
  v99 = 0;
  if (v21 >= 0.0)
    goto LABEL_22;
LABEL_23:
  if (objc_msgSend_containsValueForKey_(a3, v97, (uint64_t)CFSTR("kCLLocationCodingKeyPositionContextState"), v98))
  {
    v150 = objc_msgSend_decodeIntForKey_(a3, v153, (uint64_t)CFSTR("kCLLocationCodingKeyPositionContextState"), v154);
    v170 = v150;
  }
  else
  {
    v150 = 0;
  }
  v151 = 0.0;
  v152 = 0.0;
  if (objc_msgSend_containsValueForKey_(a3, v153, (uint64_t)CFSTR("kCLLocationCodingKeyProbabilityPositionContextStateIndoor"), v154))
  {
    objc_msgSend_decodeDoubleForKey_(a3, v155, (uint64_t)CFSTR("kCLLocationCodingKeyProbabilityPositionContextStateIndoor"), v156);
    v152 = v157;
    v169 = v157;
  }
  if (objc_msgSend_containsValueForKey_(a3, v155, (uint64_t)CFSTR("kCLLocationCodingKeyProbabilityPositionContextStateOutdoor"), v156))
  {
    objc_msgSend_decodeDoubleForKey_(a3, v158, (uint64_t)CFSTR("kCLLocationCodingKeyProbabilityPositionContextStateOutdoor"), v159);
    v151 = v160;
    v168 = v160;
  }
  if (objc_msgSend_containsValueForKey_(a3, v158, (uint64_t)CFSTR("kCLLocationCodingKeySimulationParams"), v159))
  {
    v161 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(a3, v162, v161, (uint64_t)CFSTR("kCLLocationCodingKeySimulationParams"));
  }
  v163 = objc_opt_class();
  v148 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v164, v163, (uint64_t)CFSTR("kCLLocationCodingKeyGnssOdometerInfo"));
LABEL_33:
  v166[6] = *(_OWORD *)v176;
  v166[7] = *(_OWORD *)&v176[16];
  v167[0] = v177[0];
  *(_OWORD *)((char *)v167 + 12) = *(_OWORD *)((char *)v177 + 12);
  v166[2] = *(_OWORD *)&v175[32];
  v166[3] = *(_OWORD *)&v175[48];
  v166[4] = *(_OWORD *)&v175[64];
  v166[5] = *(_OWORD *)&v175[80];
  v166[0] = *(_OWORD *)v175;
  v166[1] = *(_OWORD *)&v175[16];
  return (CLLocation *)objc_msgSend_initWithClientLocation_matchInfo_trustedTimestamp_groundAltitude_fusionInfo_trackRunInfo_rawHorizontalAccuracy_rawAltitude_rawVerticalAccuracy_rawCourseAccuracy_positionContextStateType_probabilityPositionContextStateIndoor_probabilityPositionContextStateOutdoor_gnssOdometerInfo_coarseMetaData_(self, v149, (uint64_t)v166, v53, v56, v59, v62, v150, -1.0, v76, v82, v86, v93, v152, v151, v148, v65);
}

- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6 fusionInfo:(id)a7 trackRunInfo:(id)a8 rawHorizontalAccuracy:(double)a9 rawAltitude:(double)a10 rawVerticalAccuracy:(double)a11 rawCourseAccuracy:(double)a12 positionContextStateType:(int)a13 probabilityPositionContextStateIndoor:(double)a14 probabilityPositionContextStateOutdoor:(double)a15 gnssOdometerInfo:(id)a16 coarseMetaData:(id)a17
{
  uint64_t v17;
  CLLocation *v30;
  CLLocationInternal *v31;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  const char *v36;
  _OWORD v38[8];
  _OWORD v39[2];
  objc_super v40;

  v17 = *(_QWORD *)&a13;
  v40.receiver = self;
  v40.super_class = (Class)CLLocation;
  v30 = -[CLLocation init](&v40, sel_init);
  if (v30)
  {
    v31 = [CLLocationInternal alloc];
    var13 = a3->var13;
    v38[6] = *(_OWORD *)&a3->var11;
    v38[7] = var13;
    v39[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v39 + 12) = *(_OWORD *)&a3->var16;
    v33 = *(_OWORD *)&a3->var5;
    v38[2] = *(_OWORD *)&a3->var3;
    v38[3] = v33;
    v34 = *(_OWORD *)&a3->var9;
    v38[4] = *(_OWORD *)&a3->var7;
    v38[5] = v34;
    v35 = *(_OWORD *)&a3->var1.var1;
    v38[0] = *(_OWORD *)&a3->var0;
    v38[1] = v35;
    v30->_internal = (id)objc_msgSend_initWithClientLocation_matchInfo_trustedTimestamp_groundAltitude_fusionInfo_trackRunInfo_rawHorizontalAccuracy_rawAltitude_rawVerticalAccuracy_rawCourseAccuracy_positionContextStateType_probabilityPositionContextStateIndoor_probabilityPositionContextStateOutdoor_gnssOdometerInfo_coarseMetaData_(v31, v36, (uint64_t)v38, (uint64_t)a4, a6, a7, a8, v17, a5, a9, a10, a11, a12, a14, a15, a16, a17);
  }
  return v30;
}

- (CLLocationCoordinate2D)coordinate
{
  char *internal;
  double v3;
  double v4;
  CLLocationCoordinate2D result;

  internal = (char *)self->_internal;
  v3 = *(double *)(internal + 12);
  v4 = *(double *)(internal + 20);
  result.longitude = v4;
  result.latitude = v3;
  return result;
}

- (CLLocationAccuracy)horizontalAccuracy
{
  return *(double *)((char *)self->_internal + 28);
}

- (NSData)coarseMetaData
{
  return (NSData *)*((id *)self->_internal + 24);
}

- (CLLocation)initWithLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  v9 = objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v4, v5);
  return (CLLocation *)objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_(self, v10, v9, v11, latitude, longitude, 0.0, 0.0, -1.0);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  char *internal;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  __int128 v18;

  internal = (char *)self->_internal;
  if (qword_1ECD8F8E8 != -1)
    dispatch_once(&qword_1ECD8F8E8, &unk_1E2990C50);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v18 = *(_OWORD *)(internal + 12);
  v7 = *(_QWORD *)(internal + 28);
  v8 = *(_QWORD *)(internal + 52);
  v9 = *(_QWORD *)(internal + 68);
  v10 = (void *)qword_1ECD8F8E0;
  v11 = objc_msgSend_timestamp(self, a2, v2, v3);
  v14 = objc_msgSend_stringFromDate_(v10, v12, v11, v13);
  return (id)objc_msgSend_stringWithFormat_(v6, v15, (uint64_t)CFSTR("<%+.8f,%+.8f> +/- %.2fm (speed %.2f mps / course %.2f) @ %@"), v16, v18, v7, v8, v9, v14);
}

- (NSDate)timestamp
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, *(double *)((char *)self->_internal + 84));
}

- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude horizontalAccuracy:(CLLocationAccuracy)hAccuracy verticalAccuracy:(CLLocationAccuracy)vAccuracy course:(CLLocationDirection)course speed:(CLLocationSpeed)speed timestamp:(NSDate *)timestamp
{
  return (CLLocation *)objc_msgSend__initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_course_courseAccuracy_speed_speedAccuracy_timestamp_floor_type_sourceParams_referenceFrame_(self, a2, (uint64_t)timestamp, 0x7FFFFFFFLL, 0, 0, 0, coordinate.latitude, coordinate.longitude, altitude, hAccuracy, vAccuracy, course, -1.0, speed, 0xBFF0000000000000);
}

- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6 timestamp:(id)a7 referenceFrame:(int)a8
{
  return (CLLocation *)objc_msgSend__initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_course_courseAccuracy_speed_speedAccuracy_timestamp_floor_type_sourceParams_referenceFrame_(self, a2, (uint64_t)a7, 0x7FFFFFFFLL, 0, 0, *(_QWORD *)&a8, a3.latitude, a3.longitude, a4, a5, a6, -1.0, -1.0, -1.0, 0xBFF0000000000000);
}

- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude horizontalAccuracy:(CLLocationAccuracy)hAccuracy verticalAccuracy:(CLLocationAccuracy)vAccuracy timestamp:(NSDate *)timestamp
{
  return (CLLocation *)objc_msgSend__initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_course_courseAccuracy_speed_speedAccuracy_timestamp_floor_type_sourceParams_referenceFrame_(self, a2, (uint64_t)timestamp, 0x7FFFFFFFLL, 0, 0, 0, coordinate.latitude, coordinate.longitude, altitude, hAccuracy, vAccuracy, -1.0, -1.0, -1.0, 0xBFF0000000000000);
}

- (id)_initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 timestamp:(id)a11 floor:(int)a12 type:(int)a13 sourceParams:(id)a14 referenceFrame:(int)a15
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char isSimulatedBySoftware;
  int v35;
  CLLocationDegrees v36;
  CLLocationDegrees v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  int v46;
  unint64_t v47;
  int v48;
  __int128 v49;
  unint64_t v50;
  int v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  __int16 v57;
  char v58;

  longitude = a3.longitude;
  latitude = a3.latitude;
  objc_msgSend_timeIntervalSinceReferenceDate(a11, a2, (uint64_t)a11, *(uint64_t *)&a12);
  v30 = v29;
  if (a14)
    isSimulatedBySoftware = objc_msgSend_isSimulatedBySoftware(a14, v26, v27, v28);
  else
    isSimulatedBySoftware = 0;
  v35 = 0xFFFF;
  v36 = latitude;
  v37 = longitude;
  v38 = a5;
  v39 = a4;
  v40 = a6;
  v41 = a9;
  v42 = a10;
  v43 = a7;
  v44 = a8;
  v45 = v30;
  v46 = 0;
  v47 = 0xBFF0000000000000;
  v48 = a13;
  v49 = *(__int128 *)((char *)&xmmword_18F7762E8 + 4);
  v50 = 0xBFF0000000000000;
  v51 = a12;
  v52 = 0;
  v53 = a15;
  v54 = 0;
  v55 = 0;
  v56 = isSimulatedBySoftware;
  v57 = 0;
  v58 = 0;
  return (id)objc_msgSend_initWithClientLocation_(self, v26, (uint64_t)&v35, v28);
}

- (CLLocation)initWithClientLocation:(id *)a3
{
  CLLocation *v4;
  CLLocationInternal *v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  const char *v10;
  uint64_t v11;
  _OWORD v13[8];
  _OWORD v14[2];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLLocation;
  v4 = -[CLLocation init](&v15, sel_init);
  if (v4)
  {
    v5 = [CLLocationInternal alloc];
    var13 = a3->var13;
    v13[6] = *(_OWORD *)&a3->var11;
    v13[7] = var13;
    v14[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v14 + 12) = *(_OWORD *)&a3->var16;
    v7 = *(_OWORD *)&a3->var5;
    v13[2] = *(_OWORD *)&a3->var3;
    v13[3] = v7;
    v8 = *(_OWORD *)&a3->var9;
    v13[4] = *(_OWORD *)&a3->var7;
    v13[5] = v8;
    v9 = *(_OWORD *)&a3->var1.var1;
    v13[0] = *(_OWORD *)&a3->var0;
    v13[1] = v9;
    v4->_internal = (id)objc_msgSend_initWithClientLocation_(v5, v10, (uint64_t)v13, v11);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocation;
  -[CLLocation dealloc](&v3, sel_dealloc);
}

- ($8F8AF229C96C8FD9B1F71011CD0A7A27)clientLocation
{
  double var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  var0 = self->var1.var0;
  v4 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)(*(_QWORD *)&var0 + 120);
  *(_OWORD *)&retstr->var11 = *(_OWORD *)(*(_QWORD *)&var0 + 104);
  retstr->var13 = v4;
  *(_OWORD *)&retstr->var14 = *(_OWORD *)(*(_QWORD *)&var0 + 136);
  *(_OWORD *)&retstr->var16 = *(_OWORD *)(*(_QWORD *)&var0 + 148);
  v5 = *(_OWORD *)(*(_QWORD *)&var0 + 56);
  *(_OWORD *)&retstr->var3 = *(_OWORD *)(*(_QWORD *)&var0 + 40);
  *(_OWORD *)&retstr->var5 = v5;
  v6 = *(_OWORD *)(*(_QWORD *)&var0 + 88);
  *(_OWORD *)&retstr->var7 = *(_OWORD *)(*(_QWORD *)&var0 + 72);
  *(_OWORD *)&retstr->var9 = v6;
  v7 = *(_OWORD *)(*(_QWORD *)&var0 + 24);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)(*(_QWORD *)&var0 + 8);
  *(_OWORD *)&retstr->var1.var1 = v7;
  return self;
}

- (CLLocation)initWithClientLocation:(id *)a3 coarseMetaData:(id)a4
{
  CLLocation *v6;
  CLLocationInternal *v7;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  const char *v12;
  _OWORD v14[8];
  _OWORD v15[2];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLLocation;
  v6 = -[CLLocation init](&v16, sel_init);
  if (v6)
  {
    v7 = [CLLocationInternal alloc];
    var13 = a3->var13;
    v14[6] = *(_OWORD *)&a3->var11;
    v14[7] = var13;
    v15[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)&a3->var16;
    v9 = *(_OWORD *)&a3->var5;
    v14[2] = *(_OWORD *)&a3->var3;
    v14[3] = v9;
    v10 = *(_OWORD *)&a3->var9;
    v14[4] = *(_OWORD *)&a3->var7;
    v14[5] = v10;
    v11 = *(_OWORD *)&a3->var1.var1;
    v14[0] = *(_OWORD *)&a3->var0;
    v14[1] = v11;
    v6->_internal = (id)objc_msgSend_initWithClientLocation_coarseMetaData_(v7, v12, (uint64_t)v14, (uint64_t)a4);
  }
  return v6;
}

- (int)referenceFrame
{
  return *((_DWORD *)self->_internal + 35);
}

- (CLLocationAccuracy)verticalAccuracy
{
  return *(double *)((char *)self->_internal + 44);
}

- (CLLocationDistance)distanceFromLocation:(const CLLocation *)location
{
  CLLocationDistance result;

  if (!location)
    return -1.0;
  CLClientGetDistanceHighPrecision((char *)self->_internal + 8, (char *)location->_internal + 8);
  return result;
}

- (CLLocationDirection)course
{
  return *(double *)((char *)self->_internal + 68);
}

- (int)signalEnvironmentType
{
  return *((_DWORD *)self->_internal + 37);
}

- (CLLocationSpeedAccuracy)speedAccuracy
{
  return *(double *)((char *)self->_internal + 60);
}

- (unsigned)integrity
{
  return *((_DWORD *)self->_internal + 34);
}

- (CLFloor)floor
{
  int *internal;
  CLFloor *v4;
  const char *v5;
  uint64_t v6;

  internal = (int *)self->_internal;
  if (internal[33] == 0x7FFFFFFF)
    return 0;
  v4 = [CLFloor alloc];
  return (CLFloor *)(id)objc_msgSend_initWithLevel_(v4, v5, internal[33], v6);
}

- (CLLocationDirectionAccuracy)courseAccuracy
{
  return *(double *)((char *)self->_internal + 76);
}

- (CLLocationMatchInfo)matchInfo
{
  return (CLLocationMatchInfo *)*((_QWORD *)self->_internal + 21);
}

- (CLLocationCoordinate2D)rawCoordinate
{
  char *internal;
  double v3;
  double v4;
  CLLocationCoordinate2D result;

  internal = (char *)self->_internal;
  v3 = *(double *)(internal + 108);
  v4 = *(double *)(internal + 116);
  result.longitude = v4;
  result.latitude = v3;
  return result;
}

- (id)_initWithRTLocation:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v36;
  uint64_t v37;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  int v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  unint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  char v57;

  v50 = 0;
  v49 = 0;
  v51 = 0;
  v56 = 0;
  v55 = 0;
  v57 = 0;
  objc_msgSend_latitude(a3, a2, (uint64_t)a3, v3);
  v7 = v6;
  objc_msgSend_longitude(a3, v8, v9, v10);
  v12 = v11;
  objc_msgSend_horizontalUncertainty(a3, v13, v14, v15);
  v17 = v16;
  v21 = (void *)objc_msgSend_date(a3, v18, v19, v20);
  objc_msgSend_timeIntervalSinceReferenceDate(v21, v22, v23, v24);
  v26 = v25;
  v30 = objc_msgSend_referenceFrame(a3, v27, v28, v29);
  v39 = 0xFFFF;
  v40 = v7;
  v41 = v12;
  v42 = v17;
  __asm { FMOV            V0.2D, #-1.0 }
  v43 = xmmword_18F7722C0;
  v44 = _Q0;
  v45 = _Q0;
  v46 = v26;
  v47 = 0;
  v48 = 0xBFF0000000000000;
  v52 = 0xBFF0000000000000;
  v53 = 0x7FFFFFFFLL;
  v54 = v30;
  return (id)objc_msgSend_initWithClientLocation_(self, v36, (uint64_t)&v39, v37);
}

- (CLLocation)init
{
  uint64_t v2;
  uint64_t v3;

  return (CLLocation *)objc_msgSend_initWithLatitude_longitude_(self, a2, v2, v3, 0.0, 0.0);
}

- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude horizontalAccuracy:(CLLocationAccuracy)hAccuracy verticalAccuracy:(CLLocationAccuracy)vAccuracy course:(CLLocationDirection)course courseAccuracy:(CLLocationDirectionAccuracy)courseAccuracy speed:(CLLocationSpeed)speed speedAccuracy:(CLLocationSpeedAccuracy)speedAccuracy timestamp:(NSDate *)timestamp
{
  return (CLLocation *)objc_msgSend__initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_course_courseAccuracy_speed_speedAccuracy_timestamp_floor_type_sourceParams_referenceFrame_(self, a2, (uint64_t)timestamp, 0x7FFFFFFFLL, 0, 0, 0, coordinate.latitude, coordinate.longitude, altitude, hAccuracy, vAccuracy, course, courseAccuracy, speed);
}

- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude horizontalAccuracy:(CLLocationAccuracy)hAccuracy verticalAccuracy:(CLLocationAccuracy)vAccuracy course:(CLLocationDirection)course courseAccuracy:(CLLocationDirectionAccuracy)courseAccuracy speed:(CLLocationSpeed)speed speedAccuracy:(CLLocationSpeedAccuracy)speedAccuracy timestamp:(NSDate *)timestamp sourceInfo:(CLLocationSourceInformation *)sourceInfo
{
  return (CLLocation *)objc_msgSend__initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_course_courseAccuracy_speed_speedAccuracy_timestamp_floor_type_sourceParams_referenceFrame_(self, a2, (uint64_t)timestamp, 0x7FFFFFFFLL, 0, sourceInfo, 0, coordinate.latitude, coordinate.longitude, altitude, hAccuracy, vAccuracy, course, courseAccuracy, speed);
}

- (CLLocation)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 speed:(double)a6 course:(double)a7 horizontalAccuracy:(double)a8 verticalAccuracy:(double)a9 speedAccuracy:(double)a10 courseAccuracy:(double)a11 type:(int)a12 timestamp:(id)a13
{
  return (CLLocation *)objc_msgSend__initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_course_courseAccuracy_speed_speedAccuracy_timestamp_floor_type_sourceParams_referenceFrame_(self, a2, (uint64_t)a13, 0x7FFFFFFFLL, *(_QWORD *)&a12, 0, 0, a3, a4, a5, a8, a9, a7, a11, a6);
}

- (CLLocation)initWithClientLocation:(id *)a3 clientLocationPrivate:(id *)a4
{
  CLLocation *v6;
  CLLocationInternal *v7;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  const char *v12;
  _BYTE v14[560];
  _OWORD v15[8];
  _OWORD v16[2];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLLocation;
  v6 = -[CLLocation init](&v17, sel_init);
  if (v6)
  {
    v7 = [CLLocationInternal alloc];
    var13 = a3->var13;
    v15[6] = *(_OWORD *)&a3->var11;
    v15[7] = var13;
    v16[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)&a3->var16;
    v9 = *(_OWORD *)&a3->var5;
    v15[2] = *(_OWORD *)&a3->var3;
    v15[3] = v9;
    v10 = *(_OWORD *)&a3->var9;
    v15[4] = *(_OWORD *)&a3->var7;
    v15[5] = v10;
    v11 = *(_OWORD *)&a3->var1.var1;
    v15[0] = *(_OWORD *)&a3->var0;
    v15[1] = v11;
    memcpy(v14, a4, sizeof(v14));
    v6->_internal = (id)objc_msgSend_initWithClientLocation_clientLocationPrivate_(v7, v12, (uint64_t)v15, (uint64_t)v14);
  }
  return v6;
}

- (CLLocation)initWithClientLocation:(id *)a3 clientLocationPrivate:(id *)a4 coarseMetaData:(id)a5
{
  CLLocation *v8;
  CLLocationInternal *v9;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const char *v14;
  _BYTE v16[560];
  _OWORD v17[8];
  _OWORD v18[2];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLLocation;
  v8 = -[CLLocation init](&v19, sel_init);
  if (v8)
  {
    v9 = [CLLocationInternal alloc];
    var13 = a3->var13;
    v17[6] = *(_OWORD *)&a3->var11;
    v17[7] = var13;
    v18[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v18 + 12) = *(_OWORD *)&a3->var16;
    v11 = *(_OWORD *)&a3->var5;
    v17[2] = *(_OWORD *)&a3->var3;
    v17[3] = v11;
    v12 = *(_OWORD *)&a3->var9;
    v17[4] = *(_OWORD *)&a3->var7;
    v17[5] = v12;
    v13 = *(_OWORD *)&a3->var1.var1;
    v17[0] = *(_OWORD *)&a3->var0;
    v17[1] = v13;
    memcpy(v16, a4, sizeof(v16));
    v8->_internal = (id)objc_msgSend_initWithClientLocation_clientLocationPrivate_coarseMetaData_(v9, v14, (uint64_t)v17, (uint64_t)v16, a5);
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)shortDescription
{
  char *internal;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  __int128 v14;
  char v15[8];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  internal = (char *)self->_internal;
  sub_18F5F5374(v15, 8, *(double *)(internal + 68));
  v6 = (void *)MEMORY[0x1E0CB3940];
  v14 = *(_OWORD *)(internal + 12);
  v7 = *(_QWORD *)(internal + 28);
  v8 = *(double *)(internal + 52);
  if (v8 >= 0.0)
    v9 = v8 * 2.23693629;
  else
    v9 = -1.0;
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v3, v4, v5);
  return (id)objc_msgSend_stringWithFormat_(v6, v11, (uint64_t)CFSTR("<%+.5f,%+.5f> ±%.2fm %.0fmph %s %.0fs"), v12, v14, v7, *(_QWORD *)&v9, v15, v10 - *(double *)(internal + 84));
}

- (id)jsonObject
{
  uint64_t v2;
  double *internal;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
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
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  _QWORD v59[21];
  _QWORD v60[22];

  v60[21] = *MEMORY[0x1E0C80C00];
  internal = (double *)self->_internal;
  v59[0] = CFSTR("suitability");
  v60[0] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, *((unsigned int *)internal + 2), v2);
  v59[1] = CFSTR("latitude");
  v60[1] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v4, v5, v6, *(double *)((char *)internal + 12));
  v59[2] = CFSTR("longitude");
  v60[2] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v7, v8, v9, *(double *)((char *)internal + 20));
  v59[3] = CFSTR("horizontalAccuracy");
  v60[3] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v10, v11, v12, *(double *)((char *)internal + 28));
  v59[4] = CFSTR("altitude");
  v60[4] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v13, v14, v15, *(double *)((char *)internal + 36));
  v59[5] = CFSTR("verticalAccuracy");
  v60[5] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v16, v17, v18, *(double *)((char *)internal + 44));
  v59[6] = CFSTR("speed");
  v60[6] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v19, v20, v21, *(double *)((char *)internal + 52));
  v59[7] = CFSTR("course");
  v60[7] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v22, v23, v24, *(double *)((char *)internal + 68));
  v59[8] = CFSTR("courseAccuracy");
  v60[8] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v25, v26, v27, *(double *)((char *)internal + 76));
  v59[9] = CFSTR("timestamp");
  v60[9] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v28, v29, v30, *(double *)((char *)internal + 84));
  v59[10] = CFSTR("confidence");
  v60[10] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v31, *((unsigned int *)internal + 23), v32);
  v59[11] = CFSTR("lifespan");
  v60[11] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v33, v34, v35, internal[12]);
  v59[12] = CFSTR("type");
  v60[12] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v36, *((unsigned int *)internal + 26), v37);
  v59[13] = CFSTR("rawLatitude");
  v60[13] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v38, v39, v40, *(double *)((char *)internal + 108));
  v59[14] = CFSTR("rawLongitude");
  v60[14] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v41, v42, v43, *(double *)((char *)internal + 116));
  v59[15] = CFSTR("referenceFrame");
  v60[15] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v44, *((unsigned int *)internal + 35), v45);
  v59[16] = CFSTR("rawReferenceFrame");
  v60[16] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v46, *((unsigned int *)internal + 36), v47);
  v59[17] = CFSTR("signalEnvironment");
  v60[17] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v48, *((unsigned int *)internal + 37), v49);
  v59[18] = CFSTR("ellipsoidalAltitude");
  v60[18] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v50, v51, v52, internal[19]);
  v59[19] = CFSTR("isSoftwareSimulated");
  v60[19] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v53, *((unsigned __int8 *)internal + 160), v54);
  v59[20] = CFSTR("isFromExternalAccessory");
  v60[20] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v55, *((_DWORD *)internal + 26) == 3, v56);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v57, (uint64_t)v60, (uint64_t)v59, 21);
}

- (void)setReferenceFrame:(int)a3
{
  *((_DWORD *)self->_internal + 35) = a3;
}

- (double)rawAltitude
{
  return *((double *)self->_internal + 28);
}

- (CLLocationDistance)ellipsoidalAltitude
{
  return *((double *)self->_internal + 19);
}

- (double)rawHorizontalAccuracy
{
  return *((double *)self->_internal + 27);
}

- (double)rawVerticalAccuracy
{
  return *((double *)self->_internal + 29);
}

- (double)rawCourse
{
  return *(double *)((char *)self->_internal + 124);
}

- (double)rawCourseAccuracy
{
  return *((double *)self->_internal + 30);
}

- (double)magneticDeclination
{
  uint64_t v2;
  uint64_t v3;
  char *internal;
  float v5;
  float v6;
  float v7;
  float v8;
  int v9;
  double result;
  _QWORD v11[2];
  uint64_t v12;
  int v13;

  internal = (char *)self->_internal;
  strcpy((char *)&xmmword_1EE172AE0, "/System/Library/Frameworks/CoreLocation.framework/Support/WMM.dat");
  v5 = *(double *)(internal + 12);
  v6 = *(double *)(internal + 20);
  v7 = *(double *)(internal + 36);
  v8 = sub_18F61C26C((uint64_t)self, a2, v2, v3);
  v11[0] = 0;
  v11[1] = 0;
  v13 = 0;
  v12 = 0;
  v9 = sub_18F611E20((uint64_t)v11, v5, v6, v7, v8);
  result = *((float *)&v12 + 1);
  if (v9)
    return 0.0;
  return result;
}

- (double)trustedTimestamp
{
  return *((double *)self->_internal + 23);
}

- (int)positionContextState
{
  return *((_DWORD *)self->_internal + 62);
}

- (double)probabilityPositionContextStateIndoor
{
  return *((double *)self->_internal + 32);
}

- (double)probabilityPositionContextStateOutdoor
{
  return *((double *)self->_internal + 33);
}

- (BOOL)isAltitudeWgs84Available
{
  uint64_t v2;
  uint64_t v3;
  char *internal;
  void *v5;

  internal = (char *)self->_internal;
  v5 = (void *)*((_QWORD *)internal + 22);
  return *(double *)(internal + 44) >= 0.0
      && v5 != 0
      && objc_msgSend_undulationModel(v5, a2, v2, v3) != -1;
}

- (double)altitudeWgs84
{
  uint64_t v2;
  uint64_t v3;
  char *internal;
  void *v5;
  int isAltitudeWgs84Available;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;

  internal = (char *)self->_internal;
  v5 = (void *)*((_QWORD *)internal + 22);
  isAltitudeWgs84Available = objc_msgSend_isAltitudeWgs84Available(self, a2, v2, v3);
  v10 = *(double *)(internal + 36);
  if (isAltitudeWgs84Available)
  {
    objc_msgSend_undulation(v5, v7, v8, v9);
    return v10 + v11;
  }
  return v10;
}

- (BOOL)isCoordinateFused
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_isCoordinateFused(*((void **)self->_internal + 25), a2, v2, v3);
}

- (BOOL)isCoordinateFusedWithVL
{
  return ((uint64_t (*)(_QWORD, char *))MEMORY[0x1E0DE7D20])(*((_QWORD *)self->_internal + 25), sel_isCoordinateFusedWithVL);
}

- (id)snapToResolution:(double)a3
{
  char *internal;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  unsigned __int128 v7;
  double v8;
  CLLocation *v9;
  const char *v10;
  uint64_t v11;
  _OWORD v13[8];
  _OWORD v14[2];
  __int128 v15;
  unsigned __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];

  internal = (char *)self->_internal;
  v4 = *(_OWORD *)(internal + 120);
  v21 = *(_OWORD *)(internal + 104);
  v22 = v4;
  v23[0] = *(_OWORD *)(internal + 136);
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)(internal + 148);
  v5 = *(_OWORD *)(internal + 56);
  v17 = *(_OWORD *)(internal + 40);
  v18 = v5;
  v6 = *(_OWORD *)(internal + 88);
  v19 = *(_OWORD *)(internal + 72);
  v20 = v6;
  v7 = *(_OWORD *)(internal + 24);
  v15 = *(_OWORD *)(internal + 8);
  v16 = v7;
  v8 = a3 * 1.41421356;
  if (COERCE_DOUBLE(v7 >> 32) < a3 * 1.41421356)
  {
    sub_18F5F40C4((double *)((char *)&v15 + 4), (double *)((unint64_t)&v15 | 0xC), a3);
    *(double *)((char *)&v16 + 4) = v8;
  }
  v9 = [CLLocation alloc];
  v13[6] = v21;
  v13[7] = v22;
  v14[0] = v23[0];
  *(_OWORD *)((char *)v14 + 12) = *(_OWORD *)((char *)v23 + 12);
  v13[2] = v17;
  v13[3] = v18;
  v13[4] = v19;
  v13[5] = v20;
  v13[0] = v15;
  v13[1] = v16;
  return (id)objc_msgSend_initWithClientLocation_(v9, v10, (uint64_t)v13, v11);
}

- (NSString)iso6709Notation
{
  return (NSString *)(id)CLClientCreateIso6709Notation((uint64_t)self->_internal + 8);
}

- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6
{
  CLLocation *v10;
  CLLocationInternal *v11;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  const char *v16;
  _OWORD v18[8];
  _OWORD v19[2];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CLLocation;
  v10 = -[CLLocation init](&v20, sel_init);
  if (v10)
  {
    v11 = [CLLocationInternal alloc];
    var13 = a3->var13;
    v18[6] = *(_OWORD *)&a3->var11;
    v18[7] = var13;
    v19[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v19 + 12) = *(_OWORD *)&a3->var16;
    v13 = *(_OWORD *)&a3->var5;
    v18[2] = *(_OWORD *)&a3->var3;
    v18[3] = v13;
    v14 = *(_OWORD *)&a3->var9;
    v18[4] = *(_OWORD *)&a3->var7;
    v18[5] = v14;
    v15 = *(_OWORD *)&a3->var1.var1;
    v18[0] = *(_OWORD *)&a3->var0;
    v18[1] = v15;
    v10->_internal = (id)objc_msgSend_initWithClientLocation_matchInfo_trustedTimestamp_groundAltitude_(v11, v16, (uint64_t)v18, (uint64_t)a4, a6, a5);
  }
  return v10;
}

- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6 fusionInfo:(id)a7 trackRunInfo:(id)a8 rawHorizontalAccuracy:(double)a9 rawCourseAccuracy:(double)a10 coarseMetaData:(id)a11
{
  CLLocation *v20;
  CLLocationInternal *v21;
  double v22;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  double v28;
  __int128 v29;
  const char *v30;
  _OWORD v32[8];
  _OWORD v33[2];
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CLLocation;
  v20 = -[CLLocation init](&v34, sel_init);
  if (v20)
  {
    v21 = [CLLocationInternal alloc];
    v22 = *(double *)((char *)&a3->var2 + 4);
    var13 = a3->var13;
    v24 = *(_OWORD *)&a3->var14;
    v25 = *(_OWORD *)&a3->var9;
    v32[6] = *(_OWORD *)&a3->var11;
    v32[7] = var13;
    v33[0] = v24;
    *(_OWORD *)((char *)v33 + 12) = *(_OWORD *)&a3->var16;
    v26 = *(_OWORD *)&a3->var5;
    v27 = *(_OWORD *)&a3->var7;
    v32[2] = *(_OWORD *)&a3->var3;
    v32[3] = v26;
    v28 = *(double *)((char *)&a3->var3 + 4);
    v32[4] = v27;
    v32[5] = v25;
    v29 = *(_OWORD *)&a3->var1.var1;
    v32[0] = *(_OWORD *)&a3->var0;
    v32[1] = v29;
    v20->_internal = (id)objc_msgSend_initWithClientLocation_matchInfo_trustedTimestamp_groundAltitude_fusionInfo_trackRunInfo_rawHorizontalAccuracy_rawAltitude_rawVerticalAccuracy_rawCourseAccuracy_positionContextStateType_probabilityPositionContextStateIndoor_probabilityPositionContextStateOutdoor_gnssOdometerInfo_coarseMetaData_(v21, v30, (uint64_t)v32, (uint64_t)a4, a6, a7, a8, 0, a5, a9, v22, v28, a10, 0.0, 0.0, 0, a11);
  }
  return v20;
}

- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[8];
  _OWORD v10[2];

  var13 = a3->var13;
  v9[6] = *(_OWORD *)&a3->var11;
  v9[7] = var13;
  v10[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)&a3->var16;
  v5 = *(_OWORD *)&a3->var5;
  v9[2] = *(_OWORD *)&a3->var3;
  v9[3] = v5;
  v6 = *(_OWORD *)&a3->var9;
  v9[4] = *(_OWORD *)&a3->var7;
  v9[5] = v6;
  v7 = *(_OWORD *)&a3->var1.var1;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v7;
  return (CLLocation *)objc_msgSend_initWithClientLocation_matchInfo_trustedTimestamp_(self, a2, (uint64_t)v9, (uint64_t)a4, -1.0);
}

- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[8];
  _OWORD v11[2];

  var13 = a3->var13;
  v10[6] = *(_OWORD *)&a3->var11;
  v10[7] = var13;
  v11[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v11 + 12) = *(_OWORD *)&a3->var16;
  v6 = *(_OWORD *)&a3->var5;
  v10[2] = *(_OWORD *)&a3->var3;
  v10[3] = v6;
  v7 = *(_OWORD *)&a3->var9;
  v10[4] = *(_OWORD *)&a3->var7;
  v10[5] = v7;
  v8 = *(_OWORD *)&a3->var1.var1;
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = v8;
  return (CLLocation *)objc_msgSend_initWithClientLocation_matchInfo_trustedTimestamp_groundAltitude_(self, a2, (uint64_t)v10, (uint64_t)a4, 0, a5);
}

- (void)unmatch
{
  uint64_t v2;
  uint64_t v3;
  char *internal;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v46;
  double v49;
  BOOL v50;

  internal = (char *)self->_internal;
  if (objc_msgSend_isCoordinateFused(*((void **)internal + 25), a2, v2, v3))
  {
    objc_msgSend_coordinate(*((void **)internal + 25), v5, v6, v7);
    *(_QWORD *)(internal + 12) = v8;
    *(_QWORD *)(internal + 20) = v9;
    objc_msgSend_horizontalAccuracy(*((void **)internal + 25), v10, v11, v12);
    *(_QWORD *)(internal + 28) = v13;
    *((_DWORD *)internal + 35) = objc_msgSend_referenceFrame(*((void **)internal + 25), v14, v15, v16);
    objc_msgSend_verticalAccuracy(*((void **)internal + 25), v17, v18, v19);
    if (fabs(v23) != INFINITY)
    {
      objc_msgSend_verticalAccuracy(*((void **)internal + 25), v20, v21, v22);
      if (v24 > 0.0)
      {
        objc_msgSend_altitude(*((void **)internal + 25), v20, v21, v22);
        *(_QWORD *)(internal + 36) = v25;
        objc_msgSend_verticalAccuracy(*((void **)internal + 25), v26, v27, v28);
        *(_QWORD *)(internal + 44) = v29;
      }
    }
    objc_msgSend_courseAccuracy(*((void **)internal + 25), v20, v21, v22);
    if (fabs(v33) != INFINITY)
    {
      objc_msgSend_courseAccuracy(*((void **)internal + 25), v30, v31, v32);
      if (v37 > 0.0)
      {
        objc_msgSend_course(*((void **)internal + 25), v34, v35, v36);
        *(_QWORD *)(internal + 68) = v38;
        objc_msgSend_courseAccuracy(*((void **)internal + 25), v39, v40, v41);
LABEL_32:
        *(_QWORD *)(internal + 76) = v42;
      }
    }
  }
  else
  {
    *(_OWORD *)(internal + 12) = *(_OWORD *)(internal + 108);
    *((_DWORD *)internal + 35) = *((_DWORD *)internal + 36);
    v43 = *((_QWORD *)internal + 27);
    if (v43 >= 0 && ((v43 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
      || (unint64_t)(v43 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      *(_QWORD *)(internal + 28) = *((_QWORD *)internal + 27);
    }
    v46 = *((_QWORD *)internal + 29);
    if (v46 >= 0 && ((v46 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
      || (unint64_t)(v46 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      *(_QWORD *)(internal + 36) = *((_QWORD *)internal + 28);
      *(_QWORD *)(internal + 44) = v46;
    }
    v49 = *(double *)(internal + 124);
    if (v49 >= 0.0)
    {
      *(double *)(internal + 68) = v49;
      v42 = *((_QWORD *)internal + 30);
      v50 = v42 < 0 || ((v42 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
      if (!v50 || (unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFELL)
        goto LABEL_32;
    }
  }
}

- (_CLLocationGroundAltitude)_groundAltitude
{
  uint64_t v2;
  uint64_t v3;
  id internal;
  _CLLocationGroundAltitude *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;

  internal = self->_internal;
  v5 = (_CLLocationGroundAltitude *)*((_QWORD *)internal + 22);
  if (!v5)
    return 0;
  objc_msgSend_uncertainty(*((void **)internal + 22), a2, v2, v3);
  objc_msgSend_uncertainty(v5, v6, v7, v8);
  if (v9 <= 0.0)
    return 0;
  return v5;
}

- (_CLLocationFusionInfo)_fusionInfo
{
  return (_CLLocationFusionInfo *)*((_QWORD *)self->_internal + 25);
}

- (CLLocationGnssOdometerInfo)gnssOdometerInfo
{
  return (CLLocationGnssOdometerInfo *)*((_QWORD *)self->_internal + 34);
}

- (CLLocationTrackRunInfo)trackRunInfo
{
  return (CLLocationTrackRunInfo *)*((_QWORD *)self->_internal + 26);
}

@end
