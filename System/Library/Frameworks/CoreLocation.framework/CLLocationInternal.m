@implementation CLLocationInternal

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v14;
  __int128 v15;
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

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v9 = *(_OWORD *)&self->fLocation.coordinate.longitude;
  *(_OWORD *)(v8 + 8) = *(_OWORD *)&self->fLocation.suitability;
  *(_OWORD *)(v8 + 24) = v9;
  v10 = *(_OWORD *)&self->fLocation.speed;
  v11 = *(_OWORD *)&self->fLocation.course;
  v12 = *(_OWORD *)&self->fLocation.timestamp;
  *(_OWORD *)(v8 + 40) = *(_OWORD *)&self->fLocation.altitude;
  *(_OWORD *)(v8 + 88) = v12;
  *(_OWORD *)(v8 + 72) = v11;
  *(_OWORD *)(v8 + 56) = v10;
  rawCoordinate = self->fLocation.rawCoordinate;
  v14 = *(_OWORD *)&self->fLocation.rawCourse;
  v15 = *(_OWORD *)&self->fLocation.integrity;
  *(_OWORD *)(v8 + 104) = *(_OWORD *)&self->fLocation.lifespan;
  *(_OWORD *)(v8 + 148) = v15;
  *(_OWORD *)(v8 + 136) = v14;
  *($AB5116BA7E623E054F959CECB034F4E7 *)(v8 + 120) = rawCoordinate;
  *(_QWORD *)(v8 + 168) = objc_msgSend_copy(*(void **)&self->fLocation.ellipsoidalAltitude, v16, v17, v18);
  *(_QWORD *)(v8 + 176) = objc_msgSend_copy(*(void **)&self->fLocation.fromSimulationController, v19, v20, v21);
  *(_QWORD *)(v8 + 184) = self->fMatchInfo;
  *(_QWORD *)(v8 + 192) = objc_msgSend_copy(self->fGroundAltitude, v22, v23, v24);
  *(_QWORD *)(v8 + 200) = objc_msgSend_copy(*(void **)&self->fTrustedTimestamp, v25, v26, v27);
  *(_QWORD *)(v8 + 208) = objc_msgSend_copy(self->fCoarseMetaData, v28, v29, v30);
  *(_QWORD *)(v8 + 216) = self->fFusionInfo;
  *(_QWORD *)(v8 + 224) = self->fTrackRunInfo;
  *(double *)(v8 + 232) = self->fRawHorizontalAccuracy;
  *(double *)(v8 + 240) = self->fRawAltitude;
  *(_DWORD *)(v8 + 248) = LODWORD(self->fRawVerticalAccuracy);
  *(double *)(v8 + 256) = self->fRawCourseAccuracy;
  *(_QWORD *)(v8 + 264) = *(_QWORD *)&self->fPositionContextState;
  *(_QWORD *)(v8 + 272) = objc_msgSend_copy(*(void **)&self->fProbabilityPositionContextStateIndoor, v31, v32, v33);
  return (id)v8;
}

- (CLLocationInternal)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6 fusionInfo:(id)a7 trackRunInfo:(id)a8 rawHorizontalAccuracy:(double)a9 rawAltitude:(double)a10 rawVerticalAccuracy:(double)a11 rawCourseAccuracy:(double)a12 positionContextStateType:(int)a13 probabilityPositionContextStateIndoor:(double)a14 probabilityPositionContextStateOutdoor:(double)a15 gnssOdometerInfo:(id)a16 coarseMetaData:(id)a17
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v38[8];
  _OWORD v39[2];

  var13 = a3->var13;
  v38[6] = *(_OWORD *)&a3->var11;
  v38[7] = var13;
  v39[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v39 + 12) = *(_OWORD *)&a3->var16;
  v30 = *(_OWORD *)&a3->var5;
  v38[2] = *(_OWORD *)&a3->var3;
  v38[3] = v30;
  v31 = *(_OWORD *)&a3->var9;
  v38[4] = *(_OWORD *)&a3->var7;
  v38[5] = v31;
  v32 = *(_OWORD *)&a3->var1.var1;
  v38[0] = *(_OWORD *)&a3->var0;
  v38[1] = v32;
  v33 = objc_msgSend_initWithClientLocation_(self, a2, (uint64_t)v38, (uint64_t)a4);
  if (v33)
  {
    *(_QWORD *)(v33 + 168) = a4;
    *(_QWORD *)(v33 + 176) = a6;
    *(double *)(v33 + 184) = a5;
    *(_QWORD *)(v33 + 200) = a7;
    *(_QWORD *)(v33 + 208) = a8;
    *(double *)(v33 + 216) = a9;
    *(double *)(v33 + 224) = a10;
    *(double *)(v33 + 232) = a11;
    *(double *)(v33 + 240) = a12;
    *(_QWORD *)(v33 + 192) = objc_msgSend_copy(a17, v34, v35, v36);
    *(_DWORD *)(v33 + 248) = a13;
    *(double *)(v33 + 256) = a14;
    *(double *)(v33 + 264) = a15;
    *(_QWORD *)(v33 + 272) = a16;
  }
  return (CLLocationInternal *)v33;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationInternal;
  -[CLLocationInternal dealloc](&v3, sel_dealloc);
}

- (CLLocationInternal)initWithClientLocation:(id *)a3 coarseMetaData:(id)a4
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CLLocationInternal *v9;
  _OWORD v11[8];
  _OWORD v12[2];

  var13 = a3->var13;
  v11[6] = *(_OWORD *)&a3->var11;
  v11[7] = var13;
  v12[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)&a3->var16;
  v6 = *(_OWORD *)&a3->var5;
  v11[2] = *(_OWORD *)&a3->var3;
  v11[3] = v6;
  v7 = *(_OWORD *)&a3->var9;
  v11[4] = *(_OWORD *)&a3->var7;
  v11[5] = v7;
  v8 = *(_OWORD *)&a3->var1.var1;
  v11[0] = *(_OWORD *)&a3->var0;
  v11[1] = v8;
  v9 = (CLLocationInternal *)objc_msgSend_initWithClientLocation_(self, a2, (uint64_t)v11, (uint64_t)a4);
  if (v9)
    v9->fGroundAltitude = (_CLLocationGroundAltitude *)a4;
  return v9;
}

- (CLLocationInternal)initWithClientLocation:(id *)a3
{
  CLLocationInternal *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  $AB5116BA7E623E054F959CECB034F4E7 var13;
  __int128 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLLocationInternal;
  result = -[CLLocationInternal init](&v12, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0;
    *(_OWORD *)&result->fLocation.coordinate.longitude = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->fLocation.suitability = v5;
    v6 = *(_OWORD *)&a3->var3;
    v7 = *(_OWORD *)&a3->var5;
    v8 = *(_OWORD *)&a3->var7;
    *(_OWORD *)&result->fLocation.timestamp = *(_OWORD *)&a3->var9;
    *(_OWORD *)&result->fLocation.course = v8;
    *(_OWORD *)&result->fLocation.speed = v7;
    *(_OWORD *)&result->fLocation.altitude = v6;
    v9 = *(_OWORD *)&a3->var11;
    var13 = ($AB5116BA7E623E054F959CECB034F4E7)a3->var13;
    v11 = *(_OWORD *)&a3->var14;
    *(_OWORD *)&result->fLocation.integrity = *(_OWORD *)&a3->var16;
    *(_OWORD *)&result->fLocation.rawCourse = v11;
    result->fLocation.rawCoordinate = var13;
    *(_OWORD *)&result->fLocation.lifespan = v9;
    result->fLocation.ellipsoidalAltitude = 0.0;
    *(_QWORD *)&result->fLocation.fromSimulationController = 0;
    result->fTrustedTimestamp = 0.0;
    result->fCoarseMetaData = 0;
    result->fMatchInfo = (CLLocationMatchInfo *)0xBFF0000000000000;
    result->fGroundAltitude = 0;
    result->fFusionInfo = *(_CLLocationFusionInfo **)((char *)&a3->var1.var1 + 4);
    result->fTrackRunInfo = *(CLLocationTrackRunInfo **)((char *)&a3->var2 + 4);
    result->fRawHorizontalAccuracy = *(double *)((char *)&a3->var3 + 4);
    result->fRawAltitude = *(double *)((char *)&a3->var7 + 4);
    result->fProbabilityPositionContextStateIndoor = 0.0;
  }
  return result;
}

- (CLLocationInternal)initWithClientLocation:(id *)a3 clientLocationPrivate:(id *)a4
{
  double var0;
  double var1;
  uint64_t v9;
  CLLocationMatchInfo *v10;
  const char *v11;
  id v12;
  double var3;
  id v14;
  _CLLocationGroundAltitude *v15;
  const char *v16;
  uint64_t v17;
  _CLLocationFusionInfo *v18;
  const char *v19;
  id v20;
  CLLocationGnssOdometerInfo *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  CLLocationTrackRunInfo *v26;
  uint64_t v27;
  uint64_t var4;
  id v29;
  const char *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t var5;
  int var6;
  __int128 v36;
  $F24F406B2B787EFB06265DBA3D28CBD5 v37;
  const char *v38;
  id v39;
  double var29;
  double var30;
  double var31;
  double var32;
  uint64_t var44;
  double var45;
  double var46;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  $F24F406B2B787EFB06265DBA3D28CBD5 v48;
  __int128 v49;
  __int128 v50;
  const char *v51;
  int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  $F24F406B2B787EFB06265DBA3D28CBD5 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  $F24F406B2B787EFB06265DBA3D28CBD5 v61;
  _OWORD v62[3];

  var0 = a4->var10.var0;
  var1 = a4->var10.var1;
  v9 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], a2, (uint64_t)&a4->var15, 64);
  v10 = [CLLocationMatchInfo alloc];
  v12 = (id)objc_msgSend_initWithMatchQuality_matchCoordinate_matchCourse_matchFormOfWay_matchRoadClass_matchShifted_matchDataArray_(v10, v11, a4->var9, a4->var12, a4->var13, a4->var14, v9, var0, var1, a4->var11);
  var3 = a4->var3;
  if ((a4->var18 + 1) >= 2)
  {
    v15 = [_CLLocationGroundAltitude alloc];
    v14 = (id)objc_msgSend_initWithEstimate_uncertainty_undulation_undulationModel_(v15, v16, a4->var18, v17, a4->var27, a4->var28, a4->var19);
  }
  else
  {
    v14 = 0;
  }
  if (var3 <= 0.0)
    var3 = -1.0;
  v18 = [_CLLocationFusionInfo alloc];
  v20 = (id)objc_msgSend_initWithCoordinateFused_coordinateFusedWithVL_coordinate_horizontalAccuracy_referenceFrame_altitude_verticalAccuracy_course_courseAccuracy_(v18, v19, a4->var33, a4->var34, a4->var37, a4->var35.var0, a4->var35.var1, a4->var36, a4->var38, a4->var39, a4->var40, a4->var41);
  v21 = [CLLocationGnssOdometerInfo alloc];
  v25 = (id)objc_msgSend_initWithOdometer_deltaDistance_deltaDistanceAccuracy_(v21, v22, v23, v24, a4->var0, a4->var1, a4->var2);
  v26 = [CLLocationTrackRunInfo alloc];
  v27 = a4->var16.var1;
  var4 = a4->var16.var4;
  v29 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v32 = (id)objc_msgSend_initWithUnsignedLongLong_(v29, v30, a4->var16.var2, v31);
  v33 = a4->var16.var3;
  var5 = a4->var16.var5;
  var6 = a4->var16.var6;
  v36 = *(_OWORD *)&a4->var16.var0.var2;
  v37 = a4->var16.var0.var6;
  v56 = *(_OWORD *)&a4->var16.var0.var4;
  v57 = v37;
  v58 = *(_OWORD *)&a4->var16.var0.var7;
  v54 = *(_OWORD *)&a4->var16.var0.var0;
  v55 = v36;
  v53 = var6;
  v39 = (id)objc_msgSend_initWithLapInfo_laneNumber_laneCount_trackId_estimatedLaneNumber_estimatedLaneConfidence_trackProximity_(v26, v38, (uint64_t)&v54, v27, var4, v32, v33, var5, v53);
  var29 = a4->var29;
  var30 = a4->var30;
  var31 = a4->var31;
  var32 = a4->var32;
  var44 = a4->var44;
  var45 = a4->var45;
  var46 = a4->var46;
  var13 = a3->var13;
  v60 = *(_OWORD *)&a3->var11;
  v61 = var13;
  v62[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v62 + 12) = *(_OWORD *)&a3->var16;
  v48 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&a3->var5;
  v56 = *(_OWORD *)&a3->var3;
  v57 = v48;
  v49 = *(_OWORD *)&a3->var9;
  v58 = *(_OWORD *)&a3->var7;
  v59 = v49;
  v50 = *(_OWORD *)&a3->var1.var1;
  v54 = *(_OWORD *)&a3->var0;
  v55 = v50;
  return (CLLocationInternal *)objc_msgSend_initWithClientLocation_matchInfo_trustedTimestamp_groundAltitude_fusionInfo_trackRunInfo_rawHorizontalAccuracy_rawAltitude_rawVerticalAccuracy_rawCourseAccuracy_positionContextStateType_probabilityPositionContextStateIndoor_probabilityPositionContextStateOutdoor_gnssOdometerInfo_(self, v51, (uint64_t)&v54, (uint64_t)v12, v14, v20, v39, var44, var3, var29, var30, var31, var32, var45, var46, v25);
}

- (CLLocationInternal)initWithClientLocation:(id *)a3 clientLocationPrivate:(id *)a4 coarseMetaData:(id)a5
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  const char *v11;
  CLLocationInternal *v12;
  _BYTE v14[560];
  _OWORD v15[8];
  _OWORD v16[2];

  var13 = a3->var13;
  v15[6] = *(_OWORD *)&a3->var11;
  v15[7] = var13;
  v16[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)&a3->var16;
  v8 = *(_OWORD *)&a3->var5;
  v15[2] = *(_OWORD *)&a3->var3;
  v15[3] = v8;
  v9 = *(_OWORD *)&a3->var9;
  v15[4] = *(_OWORD *)&a3->var7;
  v15[5] = v9;
  v10 = *(_OWORD *)&a3->var1.var1;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v10;
  memcpy(v14, a4, sizeof(v14));
  v12 = (CLLocationInternal *)objc_msgSend_initWithClientLocation_clientLocationPrivate_(self, v11, (uint64_t)v15, (uint64_t)v14);
  if (v12)
    v12->fGroundAltitude = (_CLLocationGroundAltitude *)a5;
  return v12;
}

- (CLLocationInternal)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6
{
  double v6;
  double v7;
  double v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v16[8];
  _OWORD v17[2];

  v6 = *(double *)((char *)&a3->var1.var1 + 4);
  v7 = *(double *)((char *)&a3->var2 + 4);
  v8 = *(double *)((char *)&a3->var3 + 4);
  var13 = a3->var13;
  v10 = *(_OWORD *)&a3->var14;
  v11 = *(_OWORD *)&a3->var9;
  v16[6] = *(_OWORD *)&a3->var11;
  v16[7] = var13;
  v17[0] = v10;
  *(_OWORD *)((char *)v17 + 12) = *(_OWORD *)&a3->var16;
  v12 = *(_OWORD *)&a3->var5;
  v13 = *(_OWORD *)&a3->var7;
  v16[2] = *(_OWORD *)&a3->var3;
  v16[3] = v12;
  var13.var0 = *(double *)((char *)&a3->var7 + 4);
  v16[4] = v13;
  v16[5] = v11;
  v14 = *(_OWORD *)&a3->var1.var1;
  v16[0] = *(_OWORD *)&a3->var0;
  v16[1] = v14;
  return (CLLocationInternal *)objc_msgSend_initWithClientLocation_matchInfo_trustedTimestamp_groundAltitude_fusionInfo_trackRunInfo_rawHorizontalAccuracy_rawAltitude_rawVerticalAccuracy_rawCourseAccuracy_positionContextStateType_probabilityPositionContextStateIndoor_probabilityPositionContextStateOutdoor_gnssOdometerInfo_(self, a2, (uint64_t)v16, (uint64_t)a4, a6, 0, 0, 0, a5, v6, v7, v8, var13.var0, 0.0, 0.0, 0);
}

- (CLLocationInternal)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6 fusionInfo:(id)a7 trackRunInfo:(id)a8 rawHorizontalAccuracy:(double)a9 rawAltitude:(double)a10 rawVerticalAccuracy:(double)a11 rawCourseAccuracy:(double)a12 positionContextStateType:(int)a13 probabilityPositionContextStateIndoor:(double)a14 probabilityPositionContextStateOutdoor:(double)a15 gnssOdometerInfo:(id)a16
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v21[8];
  _OWORD v22[2];

  var13 = a3->var13;
  v21[6] = *(_OWORD *)&a3->var11;
  v21[7] = var13;
  v22[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)&a3->var16;
  v17 = *(_OWORD *)&a3->var5;
  v21[2] = *(_OWORD *)&a3->var3;
  v21[3] = v17;
  v18 = *(_OWORD *)&a3->var9;
  v21[4] = *(_OWORD *)&a3->var7;
  v21[5] = v18;
  v19 = *(_OWORD *)&a3->var1.var1;
  v21[0] = *(_OWORD *)&a3->var0;
  v21[1] = v19;
  return (CLLocationInternal *)objc_msgSend_initWithClientLocation_matchInfo_trustedTimestamp_groundAltitude_fusionInfo_trackRunInfo_rawHorizontalAccuracy_rawAltitude_rawVerticalAccuracy_rawCourseAccuracy_positionContextStateType_probabilityPositionContextStateIndoor_probabilityPositionContextStateOutdoor_gnssOdometerInfo_coarseMetaData_(self, a2, (uint64_t)v21, (uint64_t)a4, a6, a7, a8, *(_QWORD *)&a13, a5, a9, a10, a11, a12, a14, a15, a16, 0);
}

@end
