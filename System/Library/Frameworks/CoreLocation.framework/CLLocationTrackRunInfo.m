@implementation CLLocationTrackRunInfo

- (CLLocationTrackRunInfo)init
{
  _OWORD v3[5];

  memset(v3, 0, sizeof(v3));
  return (CLLocationTrackRunInfo *)objc_msgSend_initWithLapInfo_laneNumber_laneCount_trackId_estimatedLaneNumber_estimatedLaneConfidence_trackProximity_(self, a2, (uint64_t)v3, 0, 0, &unk_1E29B5BD8, 0, 0, 0);
}

- (CLLocationTrackRunInfo)initWithLapInfo:(id *)a3 laneNumber:(int64_t)a4 laneCount:(int64_t)a5 trackId:(id)a6 estimatedLaneNumber:(int64_t)a7 estimatedLaneConfidence:(int)a8 trackProximity:(int)a9
{
  CLLocationTrackRunInfo *v15;
  CLLocationTrackRunInfo *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CLLocationTrackRunInfo;
  v15 = -[CLLocationTrackRunInfo init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    *(_OWORD *)&v15->_lapInfo.lapCount = *(_OWORD *)&a3->var0;
    v17 = *(_OWORD *)&a3->var2;
    v18 = *(_OWORD *)&a3->var4;
    v19 = *(_OWORD *)&a3->var7;
    v15->_lapInfo.previousLapPositionAtCompletionInDegrees = ($AB5116BA7E623E054F959CECB034F4E7)a3->var6;
    *(_OWORD *)&v15->_lapInfo.currentTrackRunSessionDurationInSeconds = v19;
    *(_OWORD *)&v15->_lapInfo.currentLapDurationInSeconds = v17;
    *(_OWORD *)&v15->_lapInfo.previousLapDurationInSeconds = v18;
    v15->_laneNumber = a4;
    v15->_laneCount = a5;
    v15->_trackId = (NSNumber *)a6;
    v16->_estimatedLaneNumber = a7;
    v16->_estimatedLaneConfidence = a8;
    v16->_trackProximity = a9;
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  self->_trackId = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLLocationTrackRunInfo;
  -[CLLocationTrackRunInfo dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLLocationTrackRunInfo)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  int v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  int v73;
  _OWORD v74[5];
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v80 = 0u;
  v78 = -1;
  v79 = -1;
  v76 = -1;
  v77 = 0;
  v75 = 0;
  if (objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3))
  {
    LODWORD(v80) = objc_msgSend_decodeIntForKey_(a3, v6, (uint64_t)CFSTR("trackRunLapCount"), v7);
    objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("trackRunCurrentLapStartTime"), v9);
    *((_QWORD *)&v80 + 1) = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("trackRunCurrentLapDurationInSeconds"), v12);
    *(_QWORD *)&v81 = v13;
    objc_msgSend_decodeDoubleForKey_(a3, v14, (uint64_t)CFSTR("trackRunCurrentLapDistanceInMeters"), v15);
    *((_QWORD *)&v81 + 1) = v16;
    objc_msgSend_decodeDoubleForKey_(a3, v17, (uint64_t)CFSTR("trackRunPreviousLapDurationInSeconds"), v18);
    *(_QWORD *)&v82 = v19;
    objc_msgSend_decodeDoubleForKey_(a3, v20, (uint64_t)CFSTR("trackRunPreviousLapDistanceInMeters"), v21);
    *((_QWORD *)&v82 + 1) = v22;
    objc_msgSend_decodeDoubleForKey_(a3, v23, (uint64_t)CFSTR("trackRunPreviousLapPositionAtCompletionInDegreesLatitude"), v24);
    *(_QWORD *)&v83 = v25;
    objc_msgSend_decodeDoubleForKey_(a3, v26, (uint64_t)CFSTR("trackRunPreviousLapPositionAtCompletionInDegreesLongitude"), v27);
    *((_QWORD *)&v83 + 1) = v28;
    objc_msgSend_decodeDoubleForKey_(a3, v29, (uint64_t)CFSTR("trackRunCurrentTrackRunSessionDurationInSeconds"), v30);
    *(_QWORD *)&v84 = v31;
    objc_msgSend_decodeDoubleForKey_(a3, v32, (uint64_t)CFSTR("trackRunCurrentTrackRunSessionDistanceInMeters"), v33);
    *((_QWORD *)&v84 + 1) = v34;
    v37 = objc_msgSend_decodeIntForKey_(a3, v35, (uint64_t)CFSTR("trackRunLaneNumber"), v36);
    v38 = v37;
    v79 = v37;
    v41 = objc_msgSend_decodeIntForKey_(a3, v39, (uint64_t)CFSTR("trackRunLaneCount"), v40);
    v42 = v41;
    v78 = v41;
    v43 = objc_opt_class();
    v45 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v44, v43, (uint64_t)CFSTR("trackRunTrackId"));
    v77 = v45;
    v48 = objc_msgSend_decodeIntForKey_(a3, v46, (uint64_t)CFSTR("trackRunEstimatedLaneNumber"), v47);
    v49 = v48;
    v76 = v48;
    switch(objc_msgSend_decodeIntForKey_(a3, v50, (uint64_t)CFSTR("trackRunEstimatedLaneConfidence"), v51))
    {
      case 0u:
        HIDWORD(v75) = 0;
        goto LABEL_4;
      case 1u:
LABEL_4:
        HIDWORD(v75) = 1;
        goto LABEL_5;
      case 2u:
LABEL_5:
        HIDWORD(v75) = 2;
        goto LABEL_6;
      case 3u:
LABEL_6:
        HIDWORD(v75) = 3;
        break;
      default:
        break;
    }
    HIDWORD(v75) = 0;
    if (objc_msgSend_decodeIntForKey_(a3, v52, (uint64_t)CFSTR("trackRunTrackProximity"), v53) <= 1)
      LODWORD(v75) = 1;
    v55 = 0;
    v56 = 0;
    LODWORD(v75) = 0;
  }
  else
  {
    objc_msgSend_decodeValueOfObjCType_at_(a3, v6, (uint64_t)"i", (uint64_t)&v80);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v57, (uint64_t)"d", (uint64_t)&v80 + 8);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v58, (uint64_t)"d", (uint64_t)&v81);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v59, (uint64_t)"d", (uint64_t)&v81 + 8);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v60, (uint64_t)"d", (uint64_t)&v82);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v61, (uint64_t)"d", (uint64_t)&v82 + 8);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v62, (uint64_t)"d", (uint64_t)&v83);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v63, (uint64_t)"d", (uint64_t)&v83 + 8);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v64, (uint64_t)"d", (uint64_t)&v84);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v65, (uint64_t)"d", (uint64_t)&v84 + 8);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v66, (uint64_t)"i", (uint64_t)&v79);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v67, (uint64_t)"i", (uint64_t)&v78);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v68, (uint64_t)"@", (uint64_t)&v77);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v69, (uint64_t)"i", (uint64_t)&v76);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v70, (uint64_t)"i", (uint64_t)&v75 + 4);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v71, (uint64_t)"i", (uint64_t)&v75);
    v42 = v78;
    v38 = v79;
    v49 = v76;
    v45 = v77;
    v55 = v75;
    v56 = HIDWORD(v75);
  }
  v74[2] = v82;
  v74[3] = v83;
  v74[4] = v84;
  v74[0] = v80;
  v74[1] = v81;
  v73 = v55;
  return (CLLocationTrackRunInfo *)objc_msgSend_initWithLapInfo_laneNumber_laneCount_trackId_estimatedLaneNumber_estimatedLaneConfidence_trackProximity_(self, v54, (uint64_t)v74, v38, v42, v45, v49, v56, v73);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
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
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;

  if (objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3))
  {
    objc_msgSend_encodeInt_forKey_(a3, v6, self->_lapInfo.lapCount, (uint64_t)CFSTR("trackRunLapCount"));
    objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("trackRunCurrentLapStartTime"), v8, self->_lapInfo.currentLapStartTime);
    objc_msgSend_encodeDouble_forKey_(a3, v9, (uint64_t)CFSTR("trackRunCurrentLapDurationInSeconds"), v10, self->_lapInfo.currentLapDurationInSeconds);
    objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("trackRunCurrentLapDistanceInMeters"), v12, self->_lapInfo.currentLapDistanceInMeters);
    objc_msgSend_encodeDouble_forKey_(a3, v13, (uint64_t)CFSTR("trackRunPreviousLapDurationInSeconds"), v14, self->_lapInfo.previousLapDurationInSeconds);
    objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("trackRunPreviousLapDistanceInMeters"), v16, self->_lapInfo.previousLapDistanceInMeters);
    objc_msgSend_encodeDouble_forKey_(a3, v17, (uint64_t)CFSTR("trackRunPreviousLapPositionAtCompletionInDegreesLatitude"), v18, self->_lapInfo.previousLapPositionAtCompletionInDegrees.latitude);
    objc_msgSend_encodeDouble_forKey_(a3, v19, (uint64_t)CFSTR("trackRunPreviousLapPositionAtCompletionInDegreesLongitude"), v20, self->_lapInfo.previousLapPositionAtCompletionInDegrees.longitude);
    objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("trackRunCurrentTrackRunSessionDurationInSeconds"), v22, self->_lapInfo.currentTrackRunSessionDurationInSeconds);
    objc_msgSend_encodeDouble_forKey_(a3, v23, (uint64_t)CFSTR("trackRunCurrentTrackRunSessionDistanceInMeters"), v24, self->_lapInfo.currentTrackRunSessionDistanceInMeters);
    objc_msgSend_encodeInt_forKey_(a3, v25, LODWORD(self->_laneNumber), (uint64_t)CFSTR("trackRunLaneNumber"));
    objc_msgSend_encodeInt_forKey_(a3, v26, LODWORD(self->_laneCount), (uint64_t)CFSTR("trackRunLaneCount"));
    objc_msgSend_encodeObject_forKey_(a3, v27, (uint64_t)self->_trackId, (uint64_t)CFSTR("trackRunTrackId"));
    objc_msgSend_encodeInt_forKey_(a3, v28, LODWORD(self->_estimatedLaneNumber), (uint64_t)CFSTR("trackRunEstimatedLaneNumber"));
    objc_msgSend_encodeInt_forKey_(a3, v29, self->_estimatedLaneConfidence, (uint64_t)CFSTR("trackRunEstimatedLaneConfidence"));
    objc_msgSend_encodeInt_forKey_(a3, v30, self->_trackProximity, (uint64_t)CFSTR("trackRunTrackProximity"));
  }
  else
  {
    objc_msgSend_encodeValueOfObjCType_at_(a3, v6, (uint64_t)"i", (uint64_t)&self->_lapInfo);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v31, (uint64_t)"d", (uint64_t)&self->_lapInfo.currentLapStartTime);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v32, (uint64_t)"d", (uint64_t)&self->_lapInfo.currentLapDurationInSeconds);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v33, (uint64_t)"d", (uint64_t)&self->_lapInfo.currentLapDistanceInMeters);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v34, (uint64_t)"d", (uint64_t)&self->_lapInfo.previousLapDurationInSeconds);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v35, (uint64_t)"d", (uint64_t)&self->_lapInfo.previousLapDistanceInMeters);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v36, (uint64_t)"d", (uint64_t)&self->_lapInfo.previousLapPositionAtCompletionInDegrees);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v37, (uint64_t)"d", (uint64_t)&self->_lapInfo.previousLapPositionAtCompletionInDegrees.longitude);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v38, (uint64_t)"d", (uint64_t)&self->_lapInfo.currentTrackRunSessionDurationInSeconds);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v39, (uint64_t)"d", (uint64_t)&self->_lapInfo.currentTrackRunSessionDistanceInMeters);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v40, (uint64_t)"i", (uint64_t)&self->_laneNumber);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v41, (uint64_t)"i", (uint64_t)&self->_laneCount);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v42, (uint64_t)"@", (uint64_t)&self->_trackId);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v43, (uint64_t)"i", (uint64_t)&self->_estimatedLaneNumber);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v44, (uint64_t)"i", (uint64_t)&self->_estimatedLaneConfidence);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v45, (uint64_t)"i", (uint64_t)&self->_trackProximity);
  }
}

- ($A061F3BD9B9106DED7E4D9CCD1ADF33F)lapInfo
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v3;
  __int128 v4;

  v3 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&self[1].var2;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var0;
  retstr->var6 = v3;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&self[1].var4;
  v4 = *(_OWORD *)&self->var7;
  *($F24F406B2B787EFB06265DBA3D28CBD5 *)&retstr->var0 = self->var6;
  *(_OWORD *)&retstr->var2 = v4;
  return self;
}

- (int64_t)laneNumber
{
  return self->_laneNumber;
}

- (int64_t)laneCount
{
  return self->_laneCount;
}

- (NSNumber)trackId
{
  return self->_trackId;
}

- (int64_t)estimatedLaneNumber
{
  return self->_estimatedLaneNumber;
}

- (int)estimatedLaneConfidence
{
  return self->_estimatedLaneConfidence;
}

- (int)trackProximity
{
  return self->_trackProximity;
}

@end
