@implementation _CLLocationFusionInfo

- (_CLLocationFusionInfo)init
{
  return (_CLLocationFusionInfo *)objc_msgSend_initWithCoordinateFused_coordinateFusedWithVL_coordinate_horizontalAccuracy_referenceFrame_altitude_verticalAccuracy_course_courseAccuracy_(self, a2, 0, 0, 0, 0.0, 0.0, -1.0, 0.0, -1.0, -1.0, -1.0);
}

- (_CLLocationFusionInfo)initWithCoordinateFused:(BOOL)a3 coordinateFusedWithVL:(BOOL)a4 coordinate:(id)a5 horizontalAccuracy:(double)a6 referenceFrame:(int)a7 altitude:(double)a8 verticalAccuracy:(double)a9 course:(double)a10 courseAccuracy:(double)a11
{
  double var1;
  double var0;
  _CLLocationFusionInfo *result;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  objc_super v26;

  var1 = a5.var1;
  var0 = a5.var0;
  v26.receiver = self;
  v26.super_class = (Class)_CLLocationFusionInfo;
  result = -[_CLLocationFusionInfo init](&v26, sel_init);
  if (result)
  {
    v23 = (((*(_QWORD *)&a6 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF || a6 < 0.0)
       && (unint64_t)(*(_QWORD *)&a6 - 1) >= 0xFFFFFFFFFFFFFLL;
    v24 = !v23 && a3;
    result->_coordinateFused = v24;
    v25 = !v23 && a4;
    result->_coordinateFusedWithVL = v25;
    result->_coordinate.latitude = var0;
    result->_coordinate.longitude = var1;
    result->_referenceFrame = a7;
    result->_horizontalAccuracy = a6;
    result->_altitude = a8;
    result->_verticalAccuracy = a9;
    result->_course = a10;
    result->_courseAccuracy = a11;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLLocationFusionInfo)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  double v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  double v48;
  double v49;
  const char *v50;
  uint64_t v51;
  double v52;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  double v57;
  unsigned int v58;
  unint64_t v59;
  double v60;
  double v61;
  __int16 v62;

  v62 = 0;
  v60 = 0.0;
  v61 = 0.0;
  *(double *)&v59 = -1.0;
  v58 = 0;
  *(double *)&v56 = -1.0;
  v57 = 0.0;
  *(double *)&v54 = -1.0;
  *(double *)&v55 = -1.0;
  if (objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3))
  {
    v8 = objc_msgSend_decodeBoolForKey_(a3, v6, (uint64_t)CFSTR("coordinateFused"), v7);
    HIBYTE(v62) = v8;
    if (objc_msgSend_containsValueForKey_(a3, v9, (uint64_t)CFSTR("coordinateFusedWithVL"), v10))
    {
      v13 = objc_msgSend_decodeBoolForKey_(a3, v11, (uint64_t)CFSTR("coordinateFusedWithVL"), v12);
      LOBYTE(v62) = v13;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("coordinateLatitude"), v12);
    v24 = v32;
    v60 = v32;
    objc_msgSend_decodeDoubleForKey_(a3, v33, (uint64_t)CFSTR("coordinateLongitude"), v34);
    v31 = v35;
    v61 = v35;
    objc_msgSend_decodeDoubleForKey_(a3, v36, (uint64_t)CFSTR("horizontalAccuracy"), v37);
    v25 = v38;
    *(double *)&v59 = v38;
    v26 = objc_msgSend_decodeIntForKey_(a3, v39, (uint64_t)CFSTR("referenceFrame"), v40);
    v58 = v26;
    v27 = 0.0;
    if (objc_msgSend_containsValueForKey_(a3, v41, (uint64_t)CFSTR("altitude"), v42))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v43, (uint64_t)CFSTR("altitude"), v44);
      v27 = v45;
      v57 = v45;
    }
    v28 = -1.0;
    if (objc_msgSend_containsValueForKey_(a3, v43, (uint64_t)CFSTR("verticalAccuracy"), v44))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v46, (uint64_t)CFSTR("verticalAccuracy"), v47);
      v28 = v48;
      *(double *)&v56 = v48;
    }
    objc_msgSend_decodeDoubleForKey_(a3, v46, (uint64_t)CFSTR("course"), v47);
    v30 = v49;
    *(double *)&v55 = v49;
    objc_msgSend_decodeDoubleForKey_(a3, v50, (uint64_t)CFSTR("courseAccuracy"), v51);
    v29 = v52;
    *(double *)&v54 = v52;
  }
  else
  {
    objc_msgSend_decodeValueOfObjCType_at_(a3, v6, (uint64_t)"B", (uint64_t)&v62 + 1);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v14, (uint64_t)"B", (uint64_t)&v62);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v15, (uint64_t)"d", (uint64_t)&v60);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v16, (uint64_t)"d", (uint64_t)&v61);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v17, (uint64_t)"d", (uint64_t)&v59);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v18, (uint64_t)"i", (uint64_t)&v58);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v19, (uint64_t)"d", (uint64_t)&v57);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v20, (uint64_t)"d", (uint64_t)&v56);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v21, (uint64_t)"d", (uint64_t)&v55);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v22, (uint64_t)"d", (uint64_t)&v54);
    v13 = v62;
    v25 = *(double *)&v59;
    v24 = v60;
    v26 = v58;
    v28 = *(double *)&v56;
    v27 = v57;
    v29 = *(double *)&v54;
    v30 = *(double *)&v55;
    v31 = v61;
    v8 = HIBYTE(v62) != 0;
  }
  return (_CLLocationFusionInfo *)objc_msgSend_initWithCoordinateFused_coordinateFusedWithVL_coordinate_horizontalAccuracy_referenceFrame_altitude_verticalAccuracy_course_courseAccuracy_(self, v23, v8, v13 != 0, v26, v24, v31, v25, v27, v28, v30, v29);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;

  if (objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3))
  {
    objc_msgSend_encodeBool_forKey_(a3, v6, self->_coordinateFused, (uint64_t)CFSTR("coordinateFused"));
    objc_msgSend_encodeBool_forKey_(a3, v7, self->_coordinateFusedWithVL, (uint64_t)CFSTR("coordinateFusedWithVL"));
    objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("coordinateLatitude"), v9, self->_coordinate.latitude);
    objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("coordinateLongitude"), v11, self->_coordinate.longitude);
    objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("horizontalAccuracy"), v13, self->_horizontalAccuracy);
    objc_msgSend_encodeInt_forKey_(a3, v14, self->_referenceFrame, (uint64_t)CFSTR("referenceFrame"));
    objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("altitude"), v16, self->_altitude);
    objc_msgSend_encodeDouble_forKey_(a3, v17, (uint64_t)CFSTR("verticalAccuracy"), v18, self->_verticalAccuracy);
    objc_msgSend_encodeDouble_forKey_(a3, v19, (uint64_t)CFSTR("course"), v20, self->_course);
    objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("courseAccuracy"), v22, self->_courseAccuracy);
  }
  else
  {
    objc_msgSend_encodeValueOfObjCType_at_(a3, v6, (uint64_t)"B", (uint64_t)&self->_coordinateFused);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v23, (uint64_t)"B", (uint64_t)&self->_coordinateFusedWithVL);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v24, (uint64_t)"d", (uint64_t)&self->_coordinate);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v25, (uint64_t)"d", (uint64_t)&self->_coordinate.longitude);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v26, (uint64_t)"d", (uint64_t)&self->_horizontalAccuracy);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v27, (uint64_t)"i", (uint64_t)&self->_referenceFrame);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v28, (uint64_t)"d", (uint64_t)&self->_altitude);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v29, (uint64_t)"d", (uint64_t)&self->_verticalAccuracy);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v30, (uint64_t)"d", (uint64_t)&self->_course);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v31, (uint64_t)"d", (uint64_t)&self->_courseAccuracy);
  }
}

- (BOOL)isCoordinateFused
{
  return self->_coordinateFused;
}

- (BOOL)isCoordinateFusedWithVL
{
  return self->_coordinateFusedWithVL;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (double)course
{
  return self->_course;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

@end
