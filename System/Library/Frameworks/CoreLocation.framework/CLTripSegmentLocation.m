@implementation CLTripSegmentLocation

- (CLTripSegmentLocation)initWithTime:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 altitude:(double)a11 altitudeAccuracy:(double)a12 locType:(int)a13 referenceFrame:(int)a14 signalEnvironmentType:(int)a15
{
  uint64_t v16;
  CLTripSegmentLocation *v27;
  const char *v28;
  uint64_t v29;
  objc_super v31;

  v16 = *(_QWORD *)&a14;
  v31.receiver = self;
  v31.super_class = (Class)CLTripSegmentLocation;
  v27 = -[CLTripSegmentLocation init](&v31, sel_init);
  if (v27)
  {
    v27->_timestamp = (NSDate *)a3;
    v27->_latitude = a4;
    v27->_longitude = a5;
    v27->_horizontalAccuracy = a6;
    v27->_course = a7;
    v27->_courseAccuracy = a8;
    v27->_speed = a9;
    v27->_speedAccuracy = a10;
    v27->_altitude = a11;
    v27->_altitudeAccuracy = a12;
    v27->_locType = a13;
    v27->_referenceFrame = v16;
    v27->_signalEnvironmentType = a15;
    objc_msgSend_setRawLatitude_longitude_referenceFrame_(v27, v28, v16, v29, a4, a5);
  }
  return v27;
}

- (CLTripSegmentLocation)initWithTime:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 altitude:(double)a11 altitudeAccuracy:(double)a12 locType:(int)a13 referenceFrame:(int)a14
{
  return (CLTripSegmentLocation *)objc_msgSend_initWithTime_latitude_longitude_horizontalAccuracy_course_courseAccuracy_speed_speedAccuracy_altitude_altitudeAccuracy_locType_referenceFrame_signalEnvironmentType_(self, a2, (uint64_t)a3, *(uint64_t *)&a13, *(_QWORD *)&a14, 0, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (CLTripSegmentLocation)initWithTime:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 altitude:(double)a11 altitudeAccuracy:(double)a12 locType:(int)a13
{
  return (CLTripSegmentLocation *)objc_msgSend_initWithTime_latitude_longitude_horizontalAccuracy_course_courseAccuracy_speed_speedAccuracy_altitude_altitudeAccuracy_locType_referenceFrame_(self, a2, (uint64_t)a3, *(uint64_t *)&a13, 1, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (CLTripSegmentLocation)initWithCLLocation:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  double v65;

  v6 = objc_msgSend_timestamp(a3, a2, (uint64_t)a3, v3);
  objc_msgSend_coordinate(a3, v7, v8, v9);
  v65 = v10;
  objc_msgSend_coordinate(a3, v11, v12, v13);
  v15 = v14;
  objc_msgSend_horizontalAccuracy(a3, v16, v17, v18);
  v20 = v19;
  objc_msgSend_course(a3, v21, v22, v23);
  v25 = v24;
  objc_msgSend_courseAccuracy(a3, v26, v27, v28);
  v30 = v29;
  objc_msgSend_speed(a3, v31, v32, v33);
  v35 = v34;
  objc_msgSend_speedAccuracy(a3, v36, v37, v38);
  v40 = v39;
  objc_msgSend_altitude(a3, v41, v42, v43);
  v45 = v44;
  objc_msgSend_verticalAccuracy(a3, v46, v47, v48);
  v50 = v49;
  v54 = objc_msgSend_type(a3, v51, v52, v53);
  v58 = objc_msgSend_referenceFrame(a3, v55, v56, v57);
  v62 = objc_msgSend_signalEnvironmentType(a3, v59, v60, v61);
  return (CLTripSegmentLocation *)objc_msgSend_initWithTime_latitude_longitude_horizontalAccuracy_course_courseAccuracy_speed_speedAccuracy_altitude_altitudeAccuracy_locType_referenceFrame_signalEnvironmentType_(self, v63, v6, v54, v58, v62, v65, v15, v20, v25, v30, v35, v40, v45, v50);
}

- (CLTripSegmentLocation)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  const char *v12;

  v11 = objc_msgSend_now(MEMORY[0x1E0C99D68], a2, v5, v6);
  return (CLTripSegmentLocation *)objc_msgSend_initWithTime_latitude_longitude_horizontalAccuracy_course_courseAccuracy_speed_speedAccuracy_altitude_altitudeAccuracy_locType_referenceFrame_(self, v12, v11, 0, 0, a3, a4, 1.0, -1.0, -1.0, -1.0, -1.0, a5, 0x3FF0000000000000);
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
  const char *v13;
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
  const char *v35;
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
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_QWORD *)(v12 + 40) = (id)objc_msgSend_timestamp(self, v13, v14, v15);
  objc_msgSend_latitude(self, v16, v17, v18);
  *(_QWORD *)(v12 + 48) = v19;
  objc_msgSend_longitude(self, v20, v21, v22);
  *(_QWORD *)(v12 + 56) = v23;
  objc_msgSend_rawLatitude(self, v24, v25, v26);
  *(_QWORD *)(v12 + 64) = v27;
  objc_msgSend_rawLongitude(self, v28, v29, v30);
  *(_QWORD *)(v12 + 72) = v31;
  *(_DWORD *)(v12 + 12) = objc_msgSend_rawReferenceFrame(self, v32, v33, v34);
  objc_msgSend_horizontalAccuracy(self, v35, v36, v37);
  *(_QWORD *)(v12 + 80) = v38;
  objc_msgSend_course(self, v39, v40, v41);
  *(_QWORD *)(v12 + 88) = v42;
  objc_msgSend_courseAccuracy(self, v43, v44, v45);
  *(_QWORD *)(v12 + 96) = v46;
  objc_msgSend_speed(self, v47, v48, v49);
  *(_QWORD *)(v12 + 104) = v50;
  objc_msgSend_speedAccuracy(self, v51, v52, v53);
  *(_QWORD *)(v12 + 112) = v54;
  objc_msgSend_altitude(self, v55, v56, v57);
  *(_QWORD *)(v12 + 120) = v58;
  objc_msgSend_altitudeAccuracy(self, v59, v60, v61);
  *(_QWORD *)(v12 + 128) = v62;
  *(_DWORD *)(v12 + 24) = objc_msgSend_locType(self, v63, v64, v65);
  *(_DWORD *)(v12 + 8) = objc_msgSend_referenceFrame(self, v66, v67, v68);
  *(_DWORD *)(v12 + 16) = objc_msgSend_mapsRoadClass(self, v69, v70, v71);
  *(_DWORD *)(v12 + 20) = objc_msgSend_mapsFormOfWay(self, v72, v73, v74);
  *(_DWORD *)(v12 + 28) = objc_msgSend_locTypeStart(self, v75, v76, v77);
  *(_DWORD *)(v12 + 32) = objc_msgSend_locTypeStop(self, v78, v79, v80);
  *(_QWORD *)(v12 + 136) = objc_msgSend_reconstructionType(self, v81, v82, v83);
  *(_DWORD *)(v12 + 36) = objc_msgSend_signalEnvironmentType(self, v84, v85, v86);
  return (id)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTripSegmentLocation;
  -[CLTripSegmentLocation dealloc](&v3, sel_dealloc);
}

- (void)updateLatitude:(double)a3 longitude:(double)a4 horizontalAccuracy:(double)a5 referenceFrame:(int)a6
{
  self->_latitude = a3;
  self->_longitude = a4;
  self->_horizontalAccuracy = a5;
  self->_referenceFrame = a6;
}

- (void)setMapsRoadClass:(int)a3
{
  self->_mapsRoadClass = a3;
}

- (void)setMapsFormOfWay:(int)a3
{
  self->_mapsFormOfWay = a3;
}

- (void)setLocationReconstructionType:(unint64_t)a3
{
  self->_reconstructionType |= a3;
}

- (BOOL)isOriginalLocationType
{
  return self->_reconstructionType & 1;
}

- (BOOL)isInertialIntegrated
{
  return (LOBYTE(self->_reconstructionType) >> 1) & 1;
}

- (BOOL)isMapMatched
{
  return (LOBYTE(self->_reconstructionType) >> 3) & 1;
}

- (BOOL)isLinearInterpolated
{
  return (LOBYTE(self->_reconstructionType) >> 2) & 1;
}

- (void)setStartLocationType:(int)a3
{
  self->_locTypeStart = a3;
}

- (void)setStopLocationType:(int)a3
{
  self->_locTypeStop = a3;
}

- (void)setSignalEnvironmentType:(int)a3
{
  self->_signalEnvironmentType = a3;
}

- (void)setStartLocationType:(int)a3 andStopLocationType:(int)a4
{
  uint64_t v4;
  const char *v6;
  uint64_t v7;

  v4 = *(_QWORD *)&a4;
  objc_msgSend_setStartLocationType_(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4);
  objc_msgSend_setStopLocationType_(self, v6, v4, v7);
}

- (void)setRawLatitude:(double)a3 longitude:(double)a4 referenceFrame:(int)a5
{
  self->_rawLatitude = a3;
  self->_rawLongitude = a4;
  self->_rawReferenceFrame = a5;
}

- (void)updateAltitude:(double)a3 andAltitudeAccuracy:(double)a4
{
  self->_altitude = a3;
  self->_altitudeAccuracy = a4;
}

- (void)updateCourse:(double)a3 andCourseAccuracy:(double)a4
{
  self->_course = a3;
  self->_courseAccuracy = a4;
}

- (void)updateSpeed:(double)a3 andSpeedAccuracy:(double)a4
{
  self->_speed = a3;
  self->_speedAccuracy = a4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
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
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
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
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;

  v6 = objc_msgSend_timestamp(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, (uint64_t)CFSTR("timestamp"));
  objc_msgSend_latitude(self, v8, v9, v10);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("latitude"), v12);
  objc_msgSend_longitude(self, v13, v14, v15);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("longitude"), v17);
  objc_msgSend_horizontalAccuracy(self, v18, v19, v20);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("horizontalAccuracy"), v22);
  objc_msgSend_course(self, v23, v24, v25);
  objc_msgSend_encodeDouble_forKey_(a3, v26, (uint64_t)CFSTR("course"), v27);
  objc_msgSend_courseAccuracy(self, v28, v29, v30);
  objc_msgSend_encodeDouble_forKey_(a3, v31, (uint64_t)CFSTR("courseAccuracy"), v32);
  objc_msgSend_speed(self, v33, v34, v35);
  objc_msgSend_encodeDouble_forKey_(a3, v36, (uint64_t)CFSTR("speed"), v37);
  objc_msgSend_speedAccuracy(self, v38, v39, v40);
  objc_msgSend_encodeDouble_forKey_(a3, v41, (uint64_t)CFSTR("speedAccuracy"), v42);
  objc_msgSend_altitude(self, v43, v44, v45);
  objc_msgSend_encodeDouble_forKey_(a3, v46, (uint64_t)CFSTR("altitude"), v47);
  objc_msgSend_altitudeAccuracy(self, v48, v49, v50);
  objc_msgSend_encodeDouble_forKey_(a3, v51, (uint64_t)CFSTR("altitudeAccuracy"), v52);
  v56 = objc_msgSend_mapsRoadClass(self, v53, v54, v55);
  objc_msgSend_encodeInt_forKey_(a3, v57, v56, (uint64_t)CFSTR("mapsRoadClass"));
  v61 = objc_msgSend_mapsFormOfWay(self, v58, v59, v60);
  objc_msgSend_encodeInt_forKey_(a3, v62, v61, (uint64_t)CFSTR("mapsFormOfWay"));
  v66 = objc_msgSend_locType(self, v63, v64, v65);
  objc_msgSend_encodeInt_forKey_(a3, v67, v66, (uint64_t)CFSTR("locType"));
  v71 = objc_msgSend_locTypeStart(self, v68, v69, v70);
  objc_msgSend_encodeInt_forKey_(a3, v72, v71, (uint64_t)CFSTR("locTypeStart"));
  v76 = objc_msgSend_locTypeStop(self, v73, v74, v75);
  objc_msgSend_encodeInt_forKey_(a3, v77, v76, (uint64_t)CFSTR("locTypeStop"));
  v81 = objc_msgSend_reconstructionType(self, v78, v79, v80);
  objc_msgSend_encodeInt_forKey_(a3, v82, v81, (uint64_t)CFSTR("reconstructionType"));
  v86 = objc_msgSend_referenceFrame(self, v83, v84, v85);
  objc_msgSend_encodeInt_forKey_(a3, v87, v86, (uint64_t)CFSTR("referenceFrame"));
  objc_msgSend_rawLatitude(self, v88, v89, v90);
  objc_msgSend_encodeDouble_forKey_(a3, v91, (uint64_t)CFSTR("rawLatitude"), v92);
  objc_msgSend_rawLongitude(self, v93, v94, v95);
  objc_msgSend_encodeDouble_forKey_(a3, v96, (uint64_t)CFSTR("rawLongitude"), v97);
  v101 = objc_msgSend_rawReferenceFrame(self, v98, v99, v100);
  objc_msgSend_encodeInt_forKey_(a3, v102, v101, (uint64_t)CFSTR("rawReferenceFrame"));
  v106 = objc_msgSend_signalEnvironmentType(self, v103, v104, v105);
  objc_msgSend_encodeInt_forKey_(a3, v107, v106, (uint64_t)CFSTR("signalEnvironmentType"));
}

- (CLTripSegmentLocation)initWithCoder:(id)a3
{
  CLTripSegmentLocation *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  CLTripSegmentLocation *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  double v54;
  const char *v55;
  uint64_t v56;
  double v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  int v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  double v95;

  v4 = [CLTripSegmentLocation alloc];
  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("timestamp"));
  objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("latitude"), v9);
  v95 = v10;
  objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("longitude"), v12);
  v14 = v13;
  objc_msgSend_decodeDoubleForKey_(a3, v15, (uint64_t)CFSTR("horizontalAccuracy"), v16);
  v18 = v17;
  objc_msgSend_decodeDoubleForKey_(a3, v19, (uint64_t)CFSTR("course"), v20);
  v22 = v21;
  objc_msgSend_decodeDoubleForKey_(a3, v23, (uint64_t)CFSTR("courseAccuracy"), v24);
  v26 = v25;
  objc_msgSend_decodeDoubleForKey_(a3, v27, (uint64_t)CFSTR("speed"), v28);
  v30 = v29;
  objc_msgSend_decodeDoubleForKey_(a3, v31, (uint64_t)CFSTR("speedAccuracy"), v32);
  v34 = v33;
  objc_msgSend_decodeDoubleForKey_(a3, v35, (uint64_t)CFSTR("altitude"), v36);
  v38 = v37;
  objc_msgSend_decodeDoubleForKey_(a3, v39, (uint64_t)CFSTR("altitudeAccuracy"), v40);
  v42 = v41;
  v45 = objc_msgSend_decodeIntForKey_(a3, v43, (uint64_t)CFSTR("locType"), v44);
  v48 = objc_msgSend_decodeIntForKey_(a3, v46, (uint64_t)CFSTR("referenceFrame"), v47);
  v50 = (CLTripSegmentLocation *)objc_msgSend_initWithTime_latitude_longitude_horizontalAccuracy_course_courseAccuracy_speed_speedAccuracy_altitude_altitudeAccuracy_locType_referenceFrame_(v4, v49, v7, v45, v48, v95, v14, v18, v22, v26, v30, v34, v38, v42);
  objc_msgSend_decodeDoubleForKey_(a3, v51, (uint64_t)CFSTR("rawLatitude"), v52);
  v54 = v53;
  objc_msgSend_decodeDoubleForKey_(a3, v55, (uint64_t)CFSTR("rawLongitude"), v56);
  v58 = v57;
  v61 = objc_msgSend_decodeIntForKey_(a3, v59, (uint64_t)CFSTR("rawReferenceFrame"), v60);
  objc_msgSend_setRawLatitude_longitude_referenceFrame_(v50, v62, v61, v63, v54, v58);
  v66 = objc_msgSend_decodeIntForKey_(a3, v64, (uint64_t)CFSTR("locTypeStart"), v65);
  objc_msgSend_setStartLocationType_(v50, v67, v66, v68);
  v71 = objc_msgSend_decodeIntForKey_(a3, v69, (uint64_t)CFSTR("locTypeStop"), v70);
  objc_msgSend_setStopLocationType_(v50, v72, v71, v73);
  v76 = objc_msgSend_decodeIntForKey_(a3, v74, (uint64_t)CFSTR("reconstructionType"), v75);
  objc_msgSend_setLocationReconstructionType_(v50, v77, v76, v78);
  v81 = objc_msgSend_decodeIntForKey_(a3, v79, (uint64_t)CFSTR("mapsRoadClass"), v80);
  objc_msgSend_setMapsRoadClass_(v50, v82, v81, v83);
  v86 = objc_msgSend_decodeIntForKey_(a3, v84, (uint64_t)CFSTR("mapsFormOfWay"), v85);
  objc_msgSend_setMapsRoadClass_(v50, v87, v86, v88);
  v91 = objc_msgSend_decodeIntForKey_(a3, v89, (uint64_t)CFSTR("signalEnvironmentType"), v90);
  objc_msgSend_setSignalEnvironmentType_(v50, v92, v91, v93);
  return v50;
}

- (double)distanceFromLocation:(id)a3
{
  uint64_t v3;
  double latitude;
  double longitude;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;

  if (!a3)
    return -1.0;
  latitude = self->_latitude;
  longitude = self->_longitude;
  objc_msgSend_latitude(a3, a2, (uint64_t)a3, v3);
  v8 = v7;
  objc_msgSend_longitude(a3, v9, v10, v11);
  return CLClientGetDistanceCoordinates(latitude, longitude, v8, v12);
}

- (double)distanceFromLatitude:(double)a3 longitude:(double)a4
{
  return CLClientGetDistanceCoordinates(self->_latitude, self->_longitude, a3, a4);
}

- (BOOL)isLoiLocationType
{
  return self->_locType == 13;
}

- (BOOL)isGPSLocationType
{
  return (self->_locType < 0xAu) & (0x20Au >> self->_locType);
}

- (BOOL)isWiFiLocationType
{
  int locType;

  locType = self->_locType;
  return locType == 4 || locType == 11;
}

- (BOOL)isCourseValid
{
  BOOL result;
  double course;
  double courseAccuracy;
  double v6;
  BOOL v7;

  result = 0;
  course = self->_course;
  if (fabs(course) != INFINITY)
  {
    courseAccuracy = self->_courseAccuracy;
    v6 = fabs(courseAccuracy);
    v7 = v6 < INFINITY;
    if (v6 > INFINITY)
      v7 = 1;
    if (course < 0.0)
      v7 = 0;
    return courseAccuracy > 0.0 && v7;
  }
  return result;
}

- (BOOL)isSpeedValid
{
  BOOL result;
  double speed;
  double speedAccuracy;
  double v6;
  BOOL v7;

  result = 0;
  speed = self->_speed;
  if (fabs(speed) != INFINITY)
  {
    speedAccuracy = self->_speedAccuracy;
    v6 = fabs(speedAccuracy);
    v7 = v6 < INFINITY;
    if (v6 > INFINITY)
      v7 = 1;
    if (speed < 0.0)
      v7 = 0;
    return speedAccuracy > 0.0 && v7;
  }
  return result;
}

- (BOOL)isGoodGPSFix
{
  uint64_t v2;
  uint64_t v3;
  double horizontalAccuracy;

  horizontalAccuracy = self->_horizontalAccuracy;
  if (horizontalAccuracy > 0.0 && horizontalAccuracy < 60.0)
    return objc_msgSend_isGPSLocationType(self, a2, v2, v3);
  else
    return 0;
}

- (BOOL)isGoodGPSFixWithGoodCourse
{
  uint64_t v2;
  uint64_t v3;
  int isGoodGPSFix;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  isGoodGPSFix = objc_msgSend_isGoodGPSFix(self, a2, v2, v3);
  if (isGoodGPSFix)
  {
    isGoodGPSFix = objc_msgSend_isCourseValid(self, v6, v7, v8);
    if (isGoodGPSFix)
      LOBYTE(isGoodGPSFix) = self->_courseAccuracy < 60.0;
  }
  return isGoodGPSFix;
}

- (BOOL)isRuralSignalEnvironment
{
  return self->_signalEnvironmentType == 1;
}

- (BOOL)isUrbanSignalEnvironment
{
  return self->_signalEnvironmentType == 2;
}

- (BOOL)isDenseUrbanSignalEnvironment
{
  return (self->_signalEnvironmentType - 3) < 2;
}

- (BOOL)isFoliageSignalEnvironment
{
  return self->_signalEnvironmentType == 6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (double)rawLatitude
{
  return self->_rawLatitude;
}

- (void)setRawLatitude:(double)a3
{
  self->_rawLatitude = a3;
}

- (double)rawLongitude
{
  return self->_rawLongitude;
}

- (void)setRawLongitude:(double)a3
{
  self->_rawLongitude = a3;
}

- (int)rawReferenceFrame
{
  return self->_rawReferenceFrame;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (double)course
{
  return self->_course;
}

- (void)setCourse:(double)a3
{
  self->_course = a3;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (void)setCourseAccuracy:(double)a3
{
  self->_courseAccuracy = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (void)setSpeedAccuracy:(double)a3
{
  self->_speedAccuracy = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)altitudeAccuracy
{
  return self->_altitudeAccuracy;
}

- (void)setAltitudeAccuracy:(double)a3
{
  self->_altitudeAccuracy = a3;
}

- (int)mapsRoadClass
{
  return self->_mapsRoadClass;
}

- (int)mapsFormOfWay
{
  return self->_mapsFormOfWay;
}

- (int)locType
{
  return self->_locType;
}

- (void)setLocType:(int)a3
{
  self->_locType = a3;
}

- (int)locTypeStart
{
  return self->_locTypeStart;
}

- (void)setLocTypeStart:(int)a3
{
  self->_locTypeStart = a3;
}

- (int)locTypeStop
{
  return self->_locTypeStop;
}

- (void)setLocTypeStop:(int)a3
{
  self->_locTypeStop = a3;
}

- (unint64_t)reconstructionType
{
  return self->_reconstructionType;
}

- (void)setReconstructionType:(unint64_t)a3
{
  self->_reconstructionType = a3;
}

- (int)signalEnvironmentType
{
  return self->_signalEnvironmentType;
}

@end
