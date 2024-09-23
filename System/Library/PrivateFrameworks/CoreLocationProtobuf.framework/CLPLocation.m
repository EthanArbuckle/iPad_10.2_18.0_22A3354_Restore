@implementation CLPLocation

- (double)timestamp
{
  return self->_timestamp;
}

- (unint64_t)hash
{
  double latitude;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double longitude;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  float horizontalAccuracy;
  float v20;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  $68CE81C649BB310E20AD4460D39D0015 has;
  unint64_t v28;
  float altitude;
  float v30;
  float v31;
  float v32;
  unint64_t v33;
  float verticalAccuracy;
  float v35;
  float v36;
  float v37;
  unint64_t v38;
  float speed;
  float v40;
  float v41;
  float v42;
  float course;
  float v44;
  float v45;
  float v46;
  float v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  double timestamp;
  double v52;
  long double v53;
  double v54;
  double v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  $68CE81C649BB310E20AD4460D39D0015 v59;
  $68CE81C649BB310E20AD4460D39D0015 v60;
  unint64_t v61;
  float courseAccuracy;
  float v63;
  float v64;
  float v65;
  unint64_t v66;
  float speedAccuracy;
  float v68;
  float v69;
  float v70;
  float horzUncSemiMaj;
  float v72;
  float v73;
  float v74;
  unint64_t v75;
  unint64_t v76;
  float horzUncSemiMin;
  float v78;
  float v79;
  float v80;
  unint64_t v81;
  unint64_t v82;
  float horzUncSemiMajAz;
  float v84;
  float v85;
  float v86;
  float v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;

  latitude = self->_latitude;
  v4 = -latitude;
  if (latitude >= 0.0)
    v4 = self->_latitude;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 >= 0.0)
    v10 = v9;
  v116 = v10;
  longitude = self->_longitude;
  v12 = -longitude;
  if (longitude >= 0.0)
    v12 = self->_longitude;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  v16 = v15 + (unint64_t)v14;
  v17 = fabs(v14);
  if (v14 <= 0.0)
    v16 = v15;
  v18 = v15 - (unint64_t)v17;
  if (v14 >= 0.0)
    v18 = v16;
  v115 = v18;
  horizontalAccuracy = self->_horizontalAccuracy;
  v20 = -horizontalAccuracy;
  if (horizontalAccuracy >= 0.0)
    v20 = self->_horizontalAccuracy;
  v21 = floorf(v20 + 0.5);
  v22 = (float)(v20 - v21) * 1.8447e19;
  v23 = fmodf(v21, 1.8447e19);
  v24 = 2654435761u * (unint64_t)v23;
  v25 = v24 + (unint64_t)v22;
  if (v22 <= 0.0)
    v25 = 2654435761u * (unint64_t)v23;
  v26 = v24 - (unint64_t)fabsf(v22);
  if (v22 >= 0.0)
    v26 = v25;
  v114 = v26;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    altitude = self->_altitude;
    v30 = -altitude;
    if (altitude >= 0.0)
      v30 = self->_altitude;
    v31 = floorf(v30 + 0.5);
    v32 = (float)(v30 - v31) * 1.8447e19;
    v28 = 2654435761u * (unint64_t)fmodf(v31, 1.8447e19);
    if (v32 >= 0.0)
    {
      if (v32 > 0.0)
        v28 += (unint64_t)v32;
    }
    else
    {
      v28 -= (unint64_t)fabsf(v32);
    }
  }
  else
  {
    v28 = 0;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    verticalAccuracy = self->_verticalAccuracy;
    v35 = -verticalAccuracy;
    if (verticalAccuracy >= 0.0)
      v35 = self->_verticalAccuracy;
    v36 = floorf(v35 + 0.5);
    v37 = (float)(v35 - v36) * 1.8447e19;
    v33 = 2654435761u * (unint64_t)fmodf(v36, 1.8447e19);
    if (v37 >= 0.0)
    {
      if (v37 > 0.0)
        v33 += (unint64_t)v37;
    }
    else
    {
      v33 -= (unint64_t)fabsf(v37);
    }
  }
  else
  {
    v33 = 0;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    speed = self->_speed;
    v40 = -speed;
    if (speed >= 0.0)
      v40 = self->_speed;
    v41 = floorf(v40 + 0.5);
    v42 = (float)(v40 - v41) * 1.8447e19;
    v38 = 2654435761u * (unint64_t)fmodf(v41, 1.8447e19);
    if (v42 >= 0.0)
    {
      if (v42 > 0.0)
        v38 += (unint64_t)v42;
    }
    else
    {
      v38 -= (unint64_t)fabsf(v42);
    }
  }
  else
  {
    v38 = 0;
  }
  v113 = v38;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    course = self->_course;
    v44 = -course;
    if (course >= 0.0)
      v44 = self->_course;
    v45 = floorf(v44 + 0.5);
    v46 = (float)(v44 - v45) * 1.8447e19;
    v47 = fmodf(v45, 1.8447e19);
    v48 = 2654435761u * (unint64_t)v47;
    v49 = v48 + (unint64_t)v46;
    if (v46 <= 0.0)
      v49 = 2654435761u * (unint64_t)v47;
    v50 = v48 - (unint64_t)fabsf(v46);
    if (v46 >= 0.0)
      v50 = v49;
    v112 = v50;
  }
  else
  {
    v112 = 0;
  }
  timestamp = self->_timestamp;
  v52 = -timestamp;
  if (timestamp >= 0.0)
    v52 = self->_timestamp;
  v53 = floor(v52 + 0.5);
  v54 = (v52 - v53) * 1.84467441e19;
  v55 = fmod(v53, 1.84467441e19);
  v56 = 2654435761u * (unint64_t)v55;
  v57 = v56 + (unint64_t)v54;
  if (v54 <= 0.0)
    v57 = 2654435761u * (unint64_t)v55;
  v58 = v56 - (unint64_t)fabs(v54);
  if (v54 >= 0.0)
    v58 = v57;
  v111 = v58;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    v110 = 2654435761 * self->_context;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_60:
      v109 = 2654435761 * self->_motionActivityType;
      if ((*(_WORD *)&has & 0x200) != 0)
        goto LABEL_61;
      goto LABEL_66;
    }
  }
  else
  {
    v110 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_60;
  }
  v109 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_61:
    v108 = 2654435761 * self->_motionActivityConfidence;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_62;
LABEL_67:
    v107 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_63;
    goto LABEL_68;
  }
LABEL_66:
  v108 = 0;
  if ((*(_WORD *)&has & 0x800) == 0)
    goto LABEL_67;
LABEL_62:
  v107 = 2654435761 * self->_provider;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_63:
    v106 = 2654435761 * self->_floor;
    goto LABEL_69;
  }
LABEL_68:
  v106 = 0;
LABEL_69:
  v105 = -[NSMutableArray hash](self->_appBundleIdIndices, "hash");
  v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x40000) != 0)
  {
    v104 = 2654435761 * self->_motionVehicleConnectedStateChanged;
    if ((*(_DWORD *)&v59 & 0x20000) != 0)
      goto LABEL_71;
  }
  else
  {
    v104 = 0;
    if ((*(_DWORD *)&v59 & 0x20000) != 0)
    {
LABEL_71:
      v103 = 2654435761 * self->_motionVehicleConnected;
      goto LABEL_74;
    }
  }
  v103 = 0;
LABEL_74:
  v102 = -[CLPMotionActivity hash](self->_rawMotionActivity, "hash");
  v101 = -[CLPMotionActivity hash](self->_motionActivity, "hash");
  v100 = -[CLPMotionActivity hash](self->_dominantMotionActivity, "hash");
  v60 = self->_has;
  if ((*(_BYTE *)&v60 & 8) != 0)
  {
    courseAccuracy = self->_courseAccuracy;
    v63 = -courseAccuracy;
    if (courseAccuracy >= 0.0)
      v63 = self->_courseAccuracy;
    v64 = floorf(v63 + 0.5);
    v65 = (float)(v63 - v64) * 1.8447e19;
    v61 = 2654435761u * (unint64_t)fmodf(v64, 1.8447e19);
    if (v65 >= 0.0)
    {
      if (v65 > 0.0)
        v61 += (unint64_t)v65;
    }
    else
    {
      v61 -= (unint64_t)fabsf(v65);
    }
  }
  else
  {
    v61 = 0;
  }
  if ((*(_WORD *)&v60 & 0x2000) != 0)
  {
    speedAccuracy = self->_speedAccuracy;
    v68 = -speedAccuracy;
    if (speedAccuracy >= 0.0)
      v68 = self->_speedAccuracy;
    v69 = floorf(v68 + 0.5);
    v70 = (float)(v68 - v69) * 1.8447e19;
    v66 = 2654435761u * (unint64_t)fmodf(v69, 1.8447e19);
    if (v70 >= 0.0)
    {
      if (v70 > 0.0)
        v66 += (unint64_t)v70;
    }
    else
    {
      v66 -= (unint64_t)fabsf(v70);
    }
  }
  else
  {
    v66 = 0;
  }
  if ((*(_WORD *)&v60 & 0x100) != 0)
  {
    v97 = 2654435761 * self->_modeIndicator;
    if ((*(_BYTE *)&v60 & 0x20) != 0)
      goto LABEL_92;
LABEL_97:
    v75 = 0;
    goto LABEL_100;
  }
  v97 = 0;
  if ((*(_BYTE *)&v60 & 0x20) == 0)
    goto LABEL_97;
LABEL_92:
  horzUncSemiMaj = self->_horzUncSemiMaj;
  v72 = -horzUncSemiMaj;
  if (horzUncSemiMaj >= 0.0)
    v72 = self->_horzUncSemiMaj;
  v73 = floorf(v72 + 0.5);
  v74 = (float)(v72 - v73) * 1.8447e19;
  v75 = 2654435761u * (unint64_t)fmodf(v73, 1.8447e19);
  if (v74 >= 0.0)
  {
    if (v74 > 0.0)
      v75 += (unint64_t)v74;
  }
  else
  {
    v75 -= (unint64_t)fabsf(v74);
  }
LABEL_100:
  v98 = v66;
  if ((*(_BYTE *)&v60 & 0x80) != 0)
  {
    horzUncSemiMin = self->_horzUncSemiMin;
    v78 = -horzUncSemiMin;
    if (horzUncSemiMin >= 0.0)
      v78 = self->_horzUncSemiMin;
    v79 = floorf(v78 + 0.5);
    v80 = (float)(v78 - v79) * 1.8447e19;
    v76 = 2654435761u * (unint64_t)fmodf(v79, 1.8447e19);
    if (v80 >= 0.0)
    {
      if (v80 > 0.0)
        v76 += (unint64_t)v80;
    }
    else
    {
      v76 -= (unint64_t)fabsf(v80);
    }
  }
  else
  {
    v76 = 0;
  }
  v96 = v76;
  v99 = v28;
  if ((*(_BYTE *)&v60 & 0x40) != 0)
  {
    horzUncSemiMajAz = self->_horzUncSemiMajAz;
    v84 = -horzUncSemiMajAz;
    if (horzUncSemiMajAz >= 0.0)
      v84 = self->_horzUncSemiMajAz;
    v85 = floorf(v84 + 0.5);
    v86 = (float)(v84 - v85) * 1.8447e19;
    v87 = fmodf(v85, 1.8447e19);
    v88 = 2654435761u * (unint64_t)v87;
    v81 = v75;
    if (v86 >= 0.0)
    {
      if (v86 > 0.0)
        v82 = v88 + (unint64_t)v86;
      else
        v82 = 2654435761u * (unint64_t)v87;
    }
    else
    {
      v82 = v88 - (unint64_t)fabsf(v86);
    }
  }
  else
  {
    v81 = v75;
    v82 = 0;
  }
  v89 = -[CLPSatelliteReport hash](self->_satReport, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    v90 = 2654435761 * self->_isFromLocationController;
  else
    v90 = 0;
  v91 = -[CLPPipelineDiagnosticReport hash](self->_pipelineDiagnosticReport, "hash");
  v92 = -[CLPBaroCalibrationIndication hash](self->_baroCalibrationIndication, "hash");
  v93 = -[CLPLocationProcessingMetadata hash](self->_processingMetadata, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    v94 = 2654435761 * self->_isProactiveLocation;
  else
    v94 = 0;
  return v115 ^ v116 ^ v114 ^ v99 ^ v33 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v61 ^ v98 ^ v97 ^ v81 ^ v96 ^ v82 ^ v89 ^ v90 ^ v91 ^ v92 ^ v93 ^ v94 ^ -[CLPVehicleType hash](self->_vehicleType, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $68CE81C649BB310E20AD4460D39D0015 has;
  int v6;
  NSMutableArray *appBundleIdIndices;
  int v8;
  CLPMotionActivity *rawMotionActivity;
  CLPMotionActivity *motionActivity;
  CLPMotionActivity *dominantMotionActivity;
  $68CE81C649BB310E20AD4460D39D0015 v12;
  int v13;
  CLPSatelliteReport *satReport;
  int v15;
  CLPPipelineDiagnosticReport *pipelineDiagnosticReport;
  CLPBaroCalibrationIndication *baroCalibrationIndication;
  CLPLocationProcessingMetadata *processingMetadata;
  int v19;
  char v20;
  CLPVehicleType *vehicleType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_latitude != *((double *)v4 + 1)
    || self->_longitude != *((double *)v4 + 2)
    || self->_horizontalAccuracy != *((float *)v4 + 21))
  {
    goto LABEL_127;
  }
  has = self->_has;
  v6 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_altitude != *((float *)v4 + 8))
      goto LABEL_127;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_verticalAccuracy != *((float *)v4 + 44))
      goto LABEL_127;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_speed != *((float *)v4 + 40))
      goto LABEL_127;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_course != *((float *)v4 + 15))
      goto LABEL_127;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_127;
  }
  if (self->_timestamp != *((double *)v4 + 3))
    goto LABEL_127;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_context != *((_DWORD *)v4 + 14))
      goto LABEL_127;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_motionActivityType != *((_DWORD *)v4 + 29))
      goto LABEL_127;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_motionActivityConfidence != *((_DWORD *)v4 + 28))
      goto LABEL_127;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_provider != *((_DWORD *)v4 + 34))
      goto LABEL_127;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_floor != *((_DWORD *)v4 + 20))
      goto LABEL_127;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_127;
  }
  appBundleIdIndices = self->_appBundleIdIndices;
  if ((unint64_t)appBundleIdIndices | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](appBundleIdIndices, "isEqual:"))
      goto LABEL_127;
    has = self->_has;
  }
  v8 = *((_DWORD *)v4 + 46);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0)
      goto LABEL_127;
    if (self->_motionVehicleConnectedStateChanged)
    {
      if (!*((_BYTE *)v4 + 183))
        goto LABEL_127;
    }
    else if (*((_BYTE *)v4 + 183))
    {
      goto LABEL_127;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0)
      goto LABEL_127;
    if (self->_motionVehicleConnected)
    {
      if (!*((_BYTE *)v4 + 182))
        goto LABEL_127;
    }
    else if (*((_BYTE *)v4 + 182))
    {
      goto LABEL_127;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_127;
  }
  rawMotionActivity = self->_rawMotionActivity;
  if ((unint64_t)rawMotionActivity | *((_QWORD *)v4 + 18)
    && !-[CLPMotionActivity isEqual:](rawMotionActivity, "isEqual:"))
  {
    goto LABEL_127;
  }
  motionActivity = self->_motionActivity;
  if ((unint64_t)motionActivity | *((_QWORD *)v4 + 13))
  {
    if (!-[CLPMotionActivity isEqual:](motionActivity, "isEqual:"))
      goto LABEL_127;
  }
  dominantMotionActivity = self->_dominantMotionActivity;
  if ((unint64_t)dominantMotionActivity | *((_QWORD *)v4 + 9))
  {
    if (!-[CLPMotionActivity isEqual:](dominantMotionActivity, "isEqual:"))
      goto LABEL_127;
  }
  v12 = self->_has;
  v13 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&v12 & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_courseAccuracy != *((float *)v4 + 16))
      goto LABEL_127;
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    if ((v13 & 0x2000) == 0 || self->_speedAccuracy != *((float *)v4 + 41))
      goto LABEL_127;
  }
  else if ((v13 & 0x2000) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
    if ((v13 & 0x100) == 0 || self->_modeIndicator != *((_DWORD *)v4 + 25))
      goto LABEL_127;
  }
  else if ((v13 & 0x100) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_BYTE *)&v12 & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_horzUncSemiMaj != *((float *)v4 + 22))
      goto LABEL_127;
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_BYTE *)&v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_horzUncSemiMin != *((float *)v4 + 24))
      goto LABEL_127;
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_BYTE *)&v12 & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_horzUncSemiMajAz != *((float *)v4 + 23))
      goto LABEL_127;
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_127;
  }
  satReport = self->_satReport;
  if ((unint64_t)satReport | *((_QWORD *)v4 + 19))
  {
    if (!-[CLPSatelliteReport isEqual:](satReport, "isEqual:"))
      goto LABEL_127;
    v12 = self->_has;
  }
  v15 = *((_DWORD *)v4 + 46);
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
    if ((v15 & 0x8000) == 0)
      goto LABEL_127;
    if (self->_isFromLocationController)
    {
      if (!*((_BYTE *)v4 + 180))
        goto LABEL_127;
    }
    else if (*((_BYTE *)v4 + 180))
    {
      goto LABEL_127;
    }
  }
  else if ((v15 & 0x8000) != 0)
  {
    goto LABEL_127;
  }
  pipelineDiagnosticReport = self->_pipelineDiagnosticReport;
  if ((unint64_t)pipelineDiagnosticReport | *((_QWORD *)v4 + 15)
    && !-[CLPPipelineDiagnosticReport isEqual:](pipelineDiagnosticReport, "isEqual:"))
  {
    goto LABEL_127;
  }
  baroCalibrationIndication = self->_baroCalibrationIndication;
  if ((unint64_t)baroCalibrationIndication | *((_QWORD *)v4 + 6))
  {
    if (!-[CLPBaroCalibrationIndication isEqual:](baroCalibrationIndication, "isEqual:"))
      goto LABEL_127;
  }
  processingMetadata = self->_processingMetadata;
  if ((unint64_t)processingMetadata | *((_QWORD *)v4 + 16))
  {
    if (!-[CLPLocationProcessingMetadata isEqual:](processingMetadata, "isEqual:"))
      goto LABEL_127;
  }
  v19 = *((_DWORD *)v4 + 46);
  if ((*((_BYTE *)&self->_has + 2) & 1) == 0)
  {
    if ((v19 & 0x10000) == 0)
      goto LABEL_133;
LABEL_127:
    v20 = 0;
    goto LABEL_128;
  }
  if ((v19 & 0x10000) == 0)
    goto LABEL_127;
  if (!self->_isProactiveLocation)
  {
    if (!*((_BYTE *)v4 + 181))
      goto LABEL_133;
    goto LABEL_127;
  }
  if (!*((_BYTE *)v4 + 181))
    goto LABEL_127;
LABEL_133:
  vehicleType = self->_vehicleType;
  if ((unint64_t)vehicleType | *((_QWORD *)v4 + 21))
    v20 = -[CLPVehicleType isEqual:](vehicleType, "isEqual:");
  else
    v20 = 1;
LABEL_128:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleType, 0);
  objc_storeStrong((id *)&self->_satReport, 0);
  objc_storeStrong((id *)&self->_rawMotionActivity, 0);
  objc_storeStrong((id *)&self->_processingMetadata, 0);
  objc_storeStrong((id *)&self->_pipelineDiagnosticReport, 0);
  objc_storeStrong((id *)&self->_motionActivity, 0);
  objc_storeStrong((id *)&self->_dominantMotionActivity, 0);
  objc_storeStrong((id *)&self->_baroCalibrationIndication, 0);
  objc_storeStrong((id *)&self->_appBundleIdIndices, 0);
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (void)setHorizontalAccuracy:(float)a3
{
  self->_horizontalAccuracy = a3;
}

- (void)setRawMotionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_rawMotionActivity, a3);
}

- (void)setMotionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivity, a3);
}

- (void)setDominantMotionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_dominantMotionActivity, a3);
}

- (void)setProvider:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_provider = a3;
}

- (void)setVerticalAccuracy:(float)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_verticalAccuracy = a3;
}

- (void)setAltitude:(float)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_altitude = a3;
}

- (void)setIsFromLocationController:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isFromLocationController = a3;
}

- (void)setMotionVehicleConnectedStateChanged:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_motionVehicleConnectedStateChanged = a3;
}

- (void)setMotionVehicleConnected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_motionVehicleConnected = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  $68CE81C649BB310E20AD4460D39D0015 has;
  $68CE81C649BB310E20AD4460D39D0015 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $68CE81C649BB310E20AD4460D39D0015 v12;
  $68CE81C649BB310E20AD4460D39D0015 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_53;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_53:
  PBDataWriterWriteFloatField();
  if ((*(_DWORD *)&self->_has & 4) != 0)
LABEL_5:
    PBDataWriterWriteFloatField();
LABEL_6:
  PBDataWriterWriteDoubleField();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&v6 & 0x200) == 0)
        goto LABEL_9;
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_appBundleIdIndices;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_has;
  }
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_rawMotionActivity)
    PBDataWriterWriteSubmessage();
  if (self->_motionActivity)
    PBDataWriterWriteSubmessage();
  if (self->_dominantMotionActivity)
    PBDataWriterWriteSubmessage();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x2000) == 0)
    {
LABEL_31:
      if ((*(_WORD *)&v13 & 0x100) == 0)
        goto LABEL_32;
      goto LABEL_62;
    }
  }
  else if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteFloatField();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v13 & 0x20) == 0)
      goto LABEL_33;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x20) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v13 & 0x80) == 0)
      goto LABEL_34;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteFloatField();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x80) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v13 & 0x40) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_64:
  PBDataWriterWriteFloatField();
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
LABEL_35:
    PBDataWriterWriteFloatField();
LABEL_36:
  if (self->_satReport)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_pipelineDiagnosticReport)
    PBDataWriterWriteSubmessage();
  if (self->_baroCalibrationIndication)
    PBDataWriterWriteSubmessage();
  if (self->_processingMetadata)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_vehicleType)
    PBDataWriterWriteSubmessage();

}

- (void)setHasAltitude:(BOOL)a3
{
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAltitude
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasVerticalAccuracy
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSpeed:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_speed = a3;
}

- (void)setHasSpeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSpeed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setCourse:(float)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_course = a3;
}

- (void)setHasCourse:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCourse
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setContext:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_context = a3;
}

- (void)setHasContext:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasContext
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMotionActivityType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_motionActivityType = a3;
}

- (void)setHasMotionActivityType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMotionActivityType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMotionActivityConfidence:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_motionActivityConfidence = a3;
}

- (void)setHasMotionActivityConfidence:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMotionActivityConfidence
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasProvider:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasProvider
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setFloor:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_floor = a3;
}

- (void)setHasFloor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasFloor
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearAppBundleIdIndices
{
  -[NSMutableArray removeAllObjects](self->_appBundleIdIndices, "removeAllObjects");
}

- (void)addAppBundleIdIndices:(id)a3
{
  id v4;
  NSMutableArray *appBundleIdIndices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  appBundleIdIndices = self->_appBundleIdIndices;
  v8 = v4;
  if (!appBundleIdIndices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_appBundleIdIndices;
    self->_appBundleIdIndices = v6;

    v4 = v8;
    appBundleIdIndices = self->_appBundleIdIndices;
  }
  -[NSMutableArray addObject:](appBundleIdIndices, "addObject:", v4);

}

- (unint64_t)appBundleIdIndicesCount
{
  return -[NSMutableArray count](self->_appBundleIdIndices, "count");
}

- (id)appBundleIdIndicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_appBundleIdIndices, "objectAtIndex:", a3);
}

+ (Class)appBundleIdIndicesType
{
  return (Class)objc_opt_class();
}

- (void)setHasMotionVehicleConnectedStateChanged:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasMotionVehicleConnectedStateChanged
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasMotionVehicleConnected:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasMotionVehicleConnected
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasRawMotionActivity
{
  return self->_rawMotionActivity != 0;
}

- (BOOL)hasMotionActivity
{
  return self->_motionActivity != 0;
}

- (BOOL)hasDominantMotionActivity
{
  return self->_dominantMotionActivity != 0;
}

- (void)setCourseAccuracy:(float)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_courseAccuracy = a3;
}

- (void)setHasCourseAccuracy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCourseAccuracy
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSpeedAccuracy:(float)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_speedAccuracy = a3;
}

- (void)setHasSpeedAccuracy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSpeedAccuracy
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int)modeIndicator
{
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_modeIndicator;
  else
    return 0;
}

- (void)setModeIndicator:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_modeIndicator = a3;
}

- (void)setHasModeIndicator:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasModeIndicator
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)modeIndicatorAsString:(int)a3
{
  if (a3 < 5)
    return *(&off_1E9595B88 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModeIndicator:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotRecognized")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotSpecified")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Autonomous")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Differential")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Estimated")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHorzUncSemiMaj:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_horzUncSemiMaj = a3;
}

- (void)setHasHorzUncSemiMaj:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasHorzUncSemiMaj
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHorzUncSemiMin:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_horzUncSemiMin = a3;
}

- (void)setHasHorzUncSemiMin:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHorzUncSemiMin
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHorzUncSemiMajAz:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_horzUncSemiMajAz = a3;
}

- (void)setHasHorzUncSemiMajAz:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHorzUncSemiMajAz
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasSatReport
{
  return self->_satReport != 0;
}

- (void)setHasIsFromLocationController:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsFromLocationController
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasPipelineDiagnosticReport
{
  return self->_pipelineDiagnosticReport != 0;
}

- (BOOL)hasBaroCalibrationIndication
{
  return self->_baroCalibrationIndication != 0;
}

- (BOOL)hasProcessingMetadata
{
  return self->_processingMetadata != 0;
}

- (void)setIsProactiveLocation:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isProactiveLocation = a3;
}

- (void)setHasIsProactiveLocation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsProactiveLocation
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasVehicleType
{
  return self->_vehicleType != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CLPLocation;
  -[CLPLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  $68CE81C649BB310E20AD4460D39D0015 has;
  void *v11;
  NSMutableArray *appBundleIdIndices;
  $68CE81C649BB310E20AD4460D39D0015 v13;
  void *v14;
  void *v15;
  CLPMotionActivity *rawMotionActivity;
  void *v17;
  CLPMotionActivity *motionActivity;
  void *v19;
  CLPMotionActivity *dominantMotionActivity;
  void *v21;
  $68CE81C649BB310E20AD4460D39D0015 v22;
  void *v23;
  CLPSatelliteReport *satReport;
  void *v25;
  void *v26;
  CLPPipelineDiagnosticReport *pipelineDiagnosticReport;
  void *v28;
  CLPBaroCalibrationIndication *baroCalibrationIndication;
  void *v30;
  CLPLocationProcessingMetadata *processingMetadata;
  void *v32;
  void *v33;
  CLPVehicleType *vehicleType;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t modeIndicator;
  void *v48;
  void *v49;
  void *v50;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latitude);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("latitude"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitude);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("longitude"));

  *(float *)&v6 = self->_horizontalAccuracy;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("horizontalAccuracy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(float *)&v9 = self->_altitude;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("altitude"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&v9 = self->_verticalAccuracy;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("verticalAccuracy"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_48;
  }
LABEL_47:
  *(float *)&v9 = self->_speed;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("speed"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_49;
  }
LABEL_48:
  *(float *)&v9 = self->_course;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("course"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_context);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("context"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_motionActivityType);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("motionActivityType"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_motionActivityConfidence);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("motionActivityConfidence"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_provider);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("provider"));

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_floor);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("floor"));

  }
LABEL_11:
  appBundleIdIndices = self->_appBundleIdIndices;
  if (appBundleIdIndices)
    objc_msgSend(v3, "setObject:forKey:", appBundleIdIndices, CFSTR("appBundleIdIndices"));
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_motionVehicleConnectedStateChanged);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("motionVehicleConnectedStateChanged"));

    v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_motionVehicleConnected);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("motionVehicleConnected"));

  }
  rawMotionActivity = self->_rawMotionActivity;
  if (rawMotionActivity)
  {
    -[CLPMotionActivity dictionaryRepresentation](rawMotionActivity, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("rawMotionActivity"));

  }
  motionActivity = self->_motionActivity;
  if (motionActivity)
  {
    -[CLPMotionActivity dictionaryRepresentation](motionActivity, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("motionActivity"));

  }
  dominantMotionActivity = self->_dominantMotionActivity;
  if (dominantMotionActivity)
  {
    -[CLPMotionActivity dictionaryRepresentation](dominantMotionActivity, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("dominantMotionActivity"));

  }
  v22 = self->_has;
  if ((*(_BYTE *)&v22 & 8) != 0)
  {
    *(float *)&v9 = self->_courseAccuracy;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("courseAccuracy"));

    v22 = self->_has;
    if ((*(_WORD *)&v22 & 0x2000) == 0)
    {
LABEL_25:
      if ((*(_WORD *)&v22 & 0x100) == 0)
        goto LABEL_26;
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&v22 & 0x2000) == 0)
  {
    goto LABEL_25;
  }
  *(float *)&v9 = self->_speedAccuracy;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("speedAccuracy"));

  v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x100) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v22 & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_60;
  }
LABEL_56:
  modeIndicator = self->_modeIndicator;
  if (modeIndicator >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeIndicator);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = *(&off_1E9595B88 + modeIndicator);
  }
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("modeIndicator"));

  v22 = self->_has;
  if ((*(_BYTE *)&v22 & 0x20) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v22 & 0x80) == 0)
      goto LABEL_28;
    goto LABEL_61;
  }
LABEL_60:
  *(float *)&v9 = self->_horzUncSemiMaj;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("horzUncSemiMaj"));

  v22 = self->_has;
  if ((*(_BYTE *)&v22 & 0x80) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v22 & 0x40) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_61:
  *(float *)&v9 = self->_horzUncSemiMin;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("horzUncSemiMin"));

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_29:
    *(float *)&v9 = self->_horzUncSemiMajAz;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("horzUncSemiMajAz"));

  }
LABEL_30:
  satReport = self->_satReport;
  if (satReport)
  {
    -[CLPSatelliteReport dictionaryRepresentation](satReport, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("satReport"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFromLocationController);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("isFromLocationController"));

  }
  pipelineDiagnosticReport = self->_pipelineDiagnosticReport;
  if (pipelineDiagnosticReport)
  {
    -[CLPPipelineDiagnosticReport dictionaryRepresentation](pipelineDiagnosticReport, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("pipelineDiagnosticReport"));

  }
  baroCalibrationIndication = self->_baroCalibrationIndication;
  if (baroCalibrationIndication)
  {
    -[CLPBaroCalibrationIndication dictionaryRepresentation](baroCalibrationIndication, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("baroCalibrationIndication"));

  }
  processingMetadata = self->_processingMetadata;
  if (processingMetadata)
  {
    -[CLPLocationProcessingMetadata dictionaryRepresentation](processingMetadata, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("processingMetadata"));

  }
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isProactiveLocation);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("isProactiveLocation"));

  }
  vehicleType = self->_vehicleType;
  if (vehicleType)
  {
    -[CLPVehicleType dictionaryRepresentation](vehicleType, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("vehicleType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $68CE81C649BB310E20AD4460D39D0015 has;
  $68CE81C649BB310E20AD4460D39D0015 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  $68CE81C649BB310E20AD4460D39D0015 v11;
  _DWORD *v12;
  $68CE81C649BB310E20AD4460D39D0015 v13;
  id v14;

  v4 = a3;
  v4[1] = *(_QWORD *)&self->_latitude;
  v4[2] = *(_QWORD *)&self->_longitude;
  *((_DWORD *)v4 + 21) = LODWORD(self->_horizontalAccuracy);
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = LODWORD(self->_altitude);
    *((_DWORD *)v4 + 46) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_50;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 44) = LODWORD(self->_verticalAccuracy);
  *((_DWORD *)v4 + 46) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_50:
  *((_DWORD *)v4 + 40) = LODWORD(self->_speed);
  *((_DWORD *)v4 + 46) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 15) = LODWORD(self->_course);
    *((_DWORD *)v4 + 46) |= 4u;
  }
LABEL_6:
  v4[3] = *(_QWORD *)&self->_timestamp;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_context;
    *((_DWORD *)v4 + 46) |= 2u;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&v6 & 0x200) == 0)
        goto LABEL_9;
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_8;
  }
  *((_DWORD *)v4 + 29) = self->_motionActivityType;
  *((_DWORD *)v4 + 46) |= 0x400u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_10;
LABEL_55:
    *((_DWORD *)v4 + 34) = self->_provider;
    *((_DWORD *)v4 + 46) |= 0x800u;
    if ((*(_DWORD *)&self->_has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_54:
  *((_DWORD *)v4 + 28) = self->_motionActivityConfidence;
  *((_DWORD *)v4 + 46) |= 0x200u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) != 0)
    goto LABEL_55;
LABEL_10:
  if ((*(_BYTE *)&v6 & 0x10) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 20) = self->_floor;
    *((_DWORD *)v4 + 46) |= 0x10u;
  }
LABEL_12:
  v14 = v4;
  if (-[CLPLocation appBundleIdIndicesCount](self, "appBundleIdIndicesCount"))
  {
    objc_msgSend(v14, "clearAppBundleIdIndices");
    v7 = -[CLPLocation appBundleIdIndicesCount](self, "appBundleIdIndicesCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[CLPLocation appBundleIdIndicesAtIndex:](self, "appBundleIdIndicesAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAppBundleIdIndices:", v10);

      }
    }
  }
  v11 = self->_has;
  v12 = v14;
  if ((*(_DWORD *)&v11 & 0x40000) != 0)
  {
    *((_BYTE *)v14 + 183) = self->_motionVehicleConnectedStateChanged;
    *((_DWORD *)v14 + 46) |= 0x40000u;
    v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    *((_BYTE *)v14 + 182) = self->_motionVehicleConnected;
    *((_DWORD *)v14 + 46) |= 0x20000u;
  }
  if (self->_rawMotionActivity)
  {
    objc_msgSend(v14, "setRawMotionActivity:");
    v12 = v14;
  }
  if (self->_motionActivity)
  {
    objc_msgSend(v14, "setMotionActivity:");
    v12 = v14;
  }
  if (self->_dominantMotionActivity)
  {
    objc_msgSend(v14, "setDominantMotionActivity:");
    v12 = v14;
  }
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
    v12[16] = LODWORD(self->_courseAccuracy);
    v12[46] |= 8u;
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x2000) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&v13 & 0x100) == 0)
        goto LABEL_29;
      goto LABEL_59;
    }
  }
  else if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
    goto LABEL_28;
  }
  v12[41] = LODWORD(self->_speedAccuracy);
  v12[46] |= 0x2000u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v13 & 0x20) == 0)
      goto LABEL_30;
    goto LABEL_60;
  }
LABEL_59:
  v12[25] = self->_modeIndicator;
  v12[46] |= 0x100u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x20) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v13 & 0x80) == 0)
      goto LABEL_31;
    goto LABEL_61;
  }
LABEL_60:
  v12[22] = LODWORD(self->_horzUncSemiMaj);
  v12[46] |= 0x20u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x80) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v13 & 0x40) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_61:
  v12[24] = LODWORD(self->_horzUncSemiMin);
  v12[46] |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_32:
    v12[23] = LODWORD(self->_horzUncSemiMajAz);
    v12[46] |= 0x40u;
  }
LABEL_33:
  if (self->_satReport)
  {
    objc_msgSend(v14, "setSatReport:");
    v12 = v14;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    *((_BYTE *)v12 + 180) = self->_isFromLocationController;
    v12[46] |= 0x8000u;
  }
  if (self->_pipelineDiagnosticReport)
  {
    objc_msgSend(v14, "setPipelineDiagnosticReport:");
    v12 = v14;
  }
  if (self->_baroCalibrationIndication)
  {
    objc_msgSend(v14, "setBaroCalibrationIndication:");
    v12 = v14;
  }
  if (self->_processingMetadata)
  {
    objc_msgSend(v14, "setProcessingMetadata:");
    v12 = v14;
  }
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *((_BYTE *)v12 + 181) = self->_isProactiveLocation;
    v12[46] |= 0x10000u;
  }
  if (self->_vehicleType)
  {
    objc_msgSend(v14, "setVehicleType:");
    v12 = v14;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $68CE81C649BB310E20AD4460D39D0015 has;
  $68CE81C649BB310E20AD4460D39D0015 v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  $68CE81C649BB310E20AD4460D39D0015 v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  $68CE81C649BB310E20AD4460D39D0015 v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  *(double *)(v5 + 8) = self->_latitude;
  *(double *)(v5 + 16) = self->_longitude;
  *(float *)(v5 + 84) = self->_horizontalAccuracy;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(float *)(v5 + 32) = self->_altitude;
    *(_DWORD *)(v5 + 184) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 176) = self->_verticalAccuracy;
  *(_DWORD *)(v5 + 184) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_37:
  *(float *)(v5 + 160) = self->_speed;
  *(_DWORD *)(v5 + 184) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_5:
    *(float *)(v5 + 60) = self->_course;
    *(_DWORD *)(v5 + 184) |= 4u;
  }
LABEL_6:
  *(double *)(v5 + 24) = self->_timestamp;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_context;
    *(_DWORD *)(v5 + 184) |= 2u;
    v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x400) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&v8 & 0x200) == 0)
        goto LABEL_9;
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&v8 & 0x400) == 0)
  {
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 116) = self->_motionActivityType;
  *(_DWORD *)(v5 + 184) |= 0x400u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&v8 & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 112) = self->_motionActivityConfidence;
  *(_DWORD *)(v5 + 184) |= 0x200u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&v8 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_42:
  *(_DWORD *)(v5 + 136) = self->_provider;
  *(_DWORD *)(v5 + 184) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 80) = self->_floor;
    *(_DWORD *)(v5 + 184) |= 0x10u;
  }
LABEL_12:
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = self->_appBundleIdIndices;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v34);
        objc_msgSend((id)v6, "addAppBundleIdIndices:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v11);
  }

  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) != 0)
  {
    *(_BYTE *)(v6 + 183) = self->_motionVehicleConnectedStateChanged;
    *(_DWORD *)(v6 + 184) |= 0x40000u;
    v15 = self->_has;
  }
  if ((*(_DWORD *)&v15 & 0x20000) != 0)
  {
    *(_BYTE *)(v6 + 182) = self->_motionVehicleConnected;
    *(_DWORD *)(v6 + 184) |= 0x20000u;
  }
  v16 = -[CLPMotionActivity copyWithZone:](self->_rawMotionActivity, "copyWithZone:", a3, (_QWORD)v34);
  v17 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v16;

  v18 = -[CLPMotionActivity copyWithZone:](self->_motionActivity, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v18;

  v20 = -[CLPMotionActivity copyWithZone:](self->_dominantMotionActivity, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v20;

  v22 = self->_has;
  if ((*(_BYTE *)&v22 & 8) != 0)
  {
    *(float *)(v6 + 64) = self->_courseAccuracy;
    *(_DWORD *)(v6 + 184) |= 8u;
    v22 = self->_has;
    if ((*(_WORD *)&v22 & 0x2000) == 0)
    {
LABEL_25:
      if ((*(_WORD *)&v22 & 0x100) == 0)
        goto LABEL_26;
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v22 & 0x2000) == 0)
  {
    goto LABEL_25;
  }
  *(float *)(v6 + 164) = self->_speedAccuracy;
  *(_DWORD *)(v6 + 184) |= 0x2000u;
  v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x100) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v22 & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v6 + 100) = self->_modeIndicator;
  *(_DWORD *)(v6 + 184) |= 0x100u;
  v22 = self->_has;
  if ((*(_BYTE *)&v22 & 0x20) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v22 & 0x80) == 0)
      goto LABEL_28;
    goto LABEL_48;
  }
LABEL_47:
  *(float *)(v6 + 88) = self->_horzUncSemiMaj;
  *(_DWORD *)(v6 + 184) |= 0x20u;
  v22 = self->_has;
  if ((*(_BYTE *)&v22 & 0x80) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v22 & 0x40) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_48:
  *(float *)(v6 + 96) = self->_horzUncSemiMin;
  *(_DWORD *)(v6 + 184) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_29:
    *(float *)(v6 + 92) = self->_horzUncSemiMajAz;
    *(_DWORD *)(v6 + 184) |= 0x40u;
  }
LABEL_30:
  v23 = -[CLPSatelliteReport copyWithZone:](self->_satReport, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v23;

  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    *(_BYTE *)(v6 + 180) = self->_isFromLocationController;
    *(_DWORD *)(v6 + 184) |= 0x8000u;
  }
  v25 = -[CLPPipelineDiagnosticReport copyWithZone:](self->_pipelineDiagnosticReport, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v25;

  v27 = -[CLPBaroCalibrationIndication copyWithZone:](self->_baroCalibrationIndication, "copyWithZone:", a3);
  v28 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v27;

  v29 = -[CLPLocationProcessingMetadata copyWithZone:](self->_processingMetadata, "copyWithZone:", a3);
  v30 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v29;

  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *(_BYTE *)(v6 + 181) = self->_isProactiveLocation;
    *(_DWORD *)(v6 + 184) |= 0x10000u;
  }
  v31 = -[CLPVehicleType copyWithZone:](self->_vehicleType, "copyWithZone:", a3);
  v32 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v31;

  return (id)v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  CLPMotionActivity *rawMotionActivity;
  uint64_t v15;
  CLPMotionActivity *motionActivity;
  uint64_t v17;
  CLPMotionActivity *dominantMotionActivity;
  uint64_t v19;
  int v20;
  CLPSatelliteReport *satReport;
  uint64_t v22;
  CLPPipelineDiagnosticReport *pipelineDiagnosticReport;
  uint64_t v24;
  CLPBaroCalibrationIndication *baroCalibrationIndication;
  uint64_t v26;
  CLPLocationProcessingMetadata *processingMetadata;
  uint64_t v28;
  CLPVehicleType *vehicleType;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  self->_latitude = *((double *)v4 + 1);
  self->_longitude = *((double *)v4 + 2);
  self->_horizontalAccuracy = *((float *)v4 + 21);
  v6 = *((_DWORD *)v4 + 46);
  if ((v6 & 1) != 0)
  {
    self->_altitude = *((float *)v4 + 8);
    *(_DWORD *)&self->_has |= 1u;
    v6 = *((_DWORD *)v4 + 46);
    if ((v6 & 0x4000) == 0)
    {
LABEL_3:
      if ((v6 & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((v6 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  self->_verticalAccuracy = *((float *)v4 + 44);
  *(_DWORD *)&self->_has |= 0x4000u;
  v6 = *((_DWORD *)v4 + 46);
  if ((v6 & 0x1000) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_28:
  self->_speed = *((float *)v4 + 40);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 46) & 4) != 0)
  {
LABEL_5:
    self->_course = *((float *)v4 + 15);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_6:
  self->_timestamp = *((double *)v4 + 3);
  v7 = *((_DWORD *)v4 + 46);
  if ((v7 & 2) != 0)
  {
    self->_context = *((_DWORD *)v4 + 14);
    *(_DWORD *)&self->_has |= 2u;
    v7 = *((_DWORD *)v4 + 46);
    if ((v7 & 0x400) == 0)
    {
LABEL_8:
      if ((v7 & 0x200) == 0)
        goto LABEL_9;
      goto LABEL_32;
    }
  }
  else if ((v7 & 0x400) == 0)
  {
    goto LABEL_8;
  }
  self->_motionActivityType = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x400u;
  v7 = *((_DWORD *)v4 + 46);
  if ((v7 & 0x200) == 0)
  {
LABEL_9:
    if ((v7 & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  self->_motionActivityConfidence = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x200u;
  v7 = *((_DWORD *)v4 + 46);
  if ((v7 & 0x800) == 0)
  {
LABEL_10:
    if ((v7 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_33:
  self->_provider = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_has |= 0x800u;
  if ((*((_DWORD *)v4 + 46) & 0x10) != 0)
  {
LABEL_11:
    self->_floor = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_12:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = *((id *)v4 + 5);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        -[CLPLocation addAppBundleIdIndices:](self, "addAppBundleIdIndices:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), (_QWORD)v31);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v10);
  }

  v13 = *((_DWORD *)v5 + 46);
  if ((v13 & 0x40000) != 0)
  {
    self->_motionVehicleConnectedStateChanged = *((_BYTE *)v5 + 183);
    *(_DWORD *)&self->_has |= 0x40000u;
    v13 = *((_DWORD *)v5 + 46);
  }
  if ((v13 & 0x20000) != 0)
  {
    self->_motionVehicleConnected = *((_BYTE *)v5 + 182);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  rawMotionActivity = self->_rawMotionActivity;
  v15 = *((_QWORD *)v5 + 18);
  if (rawMotionActivity)
  {
    if (v15)
      -[CLPMotionActivity mergeFrom:](rawMotionActivity, "mergeFrom:");
  }
  else if (v15)
  {
    -[CLPLocation setRawMotionActivity:](self, "setRawMotionActivity:");
  }
  motionActivity = self->_motionActivity;
  v17 = *((_QWORD *)v5 + 13);
  if (motionActivity)
  {
    if (v17)
      -[CLPMotionActivity mergeFrom:](motionActivity, "mergeFrom:");
  }
  else if (v17)
  {
    -[CLPLocation setMotionActivity:](self, "setMotionActivity:");
  }
  dominantMotionActivity = self->_dominantMotionActivity;
  v19 = *((_QWORD *)v5 + 9);
  if (dominantMotionActivity)
  {
    if (v19)
      -[CLPMotionActivity mergeFrom:](dominantMotionActivity, "mergeFrom:");
  }
  else if (v19)
  {
    -[CLPLocation setDominantMotionActivity:](self, "setDominantMotionActivity:");
  }
  v20 = *((_DWORD *)v5 + 46);
  if ((v20 & 8) != 0)
  {
    self->_courseAccuracy = *((float *)v5 + 16);
    *(_DWORD *)&self->_has |= 8u;
    v20 = *((_DWORD *)v5 + 46);
    if ((v20 & 0x2000) == 0)
    {
LABEL_49:
      if ((v20 & 0x100) == 0)
        goto LABEL_50;
      goto LABEL_59;
    }
  }
  else if ((v20 & 0x2000) == 0)
  {
    goto LABEL_49;
  }
  self->_speedAccuracy = *((float *)v5 + 41);
  *(_DWORD *)&self->_has |= 0x2000u;
  v20 = *((_DWORD *)v5 + 46);
  if ((v20 & 0x100) == 0)
  {
LABEL_50:
    if ((v20 & 0x20) == 0)
      goto LABEL_51;
    goto LABEL_60;
  }
LABEL_59:
  self->_modeIndicator = *((_DWORD *)v5 + 25);
  *(_DWORD *)&self->_has |= 0x100u;
  v20 = *((_DWORD *)v5 + 46);
  if ((v20 & 0x20) == 0)
  {
LABEL_51:
    if ((v20 & 0x80) == 0)
      goto LABEL_52;
    goto LABEL_61;
  }
LABEL_60:
  self->_horzUncSemiMaj = *((float *)v5 + 22);
  *(_DWORD *)&self->_has |= 0x20u;
  v20 = *((_DWORD *)v5 + 46);
  if ((v20 & 0x80) == 0)
  {
LABEL_52:
    if ((v20 & 0x40) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_61:
  self->_horzUncSemiMin = *((float *)v5 + 24);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)v5 + 46) & 0x40) != 0)
  {
LABEL_53:
    self->_horzUncSemiMajAz = *((float *)v5 + 23);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_54:
  satReport = self->_satReport;
  v22 = *((_QWORD *)v5 + 19);
  if (satReport)
  {
    if (v22)
      -[CLPSatelliteReport mergeFrom:](satReport, "mergeFrom:");
  }
  else if (v22)
  {
    -[CLPLocation setSatReport:](self, "setSatReport:");
  }
  if ((*((_BYTE *)v5 + 185) & 0x80) != 0)
  {
    self->_isFromLocationController = *((_BYTE *)v5 + 180);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  pipelineDiagnosticReport = self->_pipelineDiagnosticReport;
  v24 = *((_QWORD *)v5 + 15);
  if (pipelineDiagnosticReport)
  {
    if (v24)
      -[CLPPipelineDiagnosticReport mergeFrom:](pipelineDiagnosticReport, "mergeFrom:");
  }
  else if (v24)
  {
    -[CLPLocation setPipelineDiagnosticReport:](self, "setPipelineDiagnosticReport:");
  }
  baroCalibrationIndication = self->_baroCalibrationIndication;
  v26 = *((_QWORD *)v5 + 6);
  if (baroCalibrationIndication)
  {
    if (v26)
      -[CLPBaroCalibrationIndication mergeFrom:](baroCalibrationIndication, "mergeFrom:");
  }
  else if (v26)
  {
    -[CLPLocation setBaroCalibrationIndication:](self, "setBaroCalibrationIndication:");
  }
  processingMetadata = self->_processingMetadata;
  v28 = *((_QWORD *)v5 + 16);
  if (processingMetadata)
  {
    if (v28)
      -[CLPLocationProcessingMetadata mergeFrom:](processingMetadata, "mergeFrom:");
  }
  else if (v28)
  {
    -[CLPLocation setProcessingMetadata:](self, "setProcessingMetadata:");
  }
  if ((*((_BYTE *)v5 + 186) & 1) != 0)
  {
    self->_isProactiveLocation = *((_BYTE *)v5 + 181);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  vehicleType = self->_vehicleType;
  v30 = *((_QWORD *)v5 + 21);
  if (vehicleType)
  {
    if (v30)
      -[CLPVehicleType mergeFrom:](vehicleType, "mergeFrom:");
  }
  else if (v30)
  {
    -[CLPLocation setVehicleType:](self, "setVehicleType:");
  }

}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (float)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (float)altitude
{
  return self->_altitude;
}

- (float)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (float)speed
{
  return self->_speed;
}

- (float)course
{
  return self->_course;
}

- (int)context
{
  return self->_context;
}

- (int)motionActivityType
{
  return self->_motionActivityType;
}

- (int)motionActivityConfidence
{
  return self->_motionActivityConfidence;
}

- (int)provider
{
  return self->_provider;
}

- (int)floor
{
  return self->_floor;
}

- (NSMutableArray)appBundleIdIndices
{
  return self->_appBundleIdIndices;
}

- (void)setAppBundleIdIndices:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleIdIndices, a3);
}

- (BOOL)motionVehicleConnectedStateChanged
{
  return self->_motionVehicleConnectedStateChanged;
}

- (BOOL)motionVehicleConnected
{
  return self->_motionVehicleConnected;
}

- (CLPMotionActivity)rawMotionActivity
{
  return self->_rawMotionActivity;
}

- (CLPMotionActivity)motionActivity
{
  return self->_motionActivity;
}

- (CLPMotionActivity)dominantMotionActivity
{
  return self->_dominantMotionActivity;
}

- (float)courseAccuracy
{
  return self->_courseAccuracy;
}

- (float)speedAccuracy
{
  return self->_speedAccuracy;
}

- (float)horzUncSemiMaj
{
  return self->_horzUncSemiMaj;
}

- (float)horzUncSemiMin
{
  return self->_horzUncSemiMin;
}

- (float)horzUncSemiMajAz
{
  return self->_horzUncSemiMajAz;
}

- (CLPSatelliteReport)satReport
{
  return self->_satReport;
}

- (void)setSatReport:(id)a3
{
  objc_storeStrong((id *)&self->_satReport, a3);
}

- (BOOL)isFromLocationController
{
  return self->_isFromLocationController;
}

- (CLPPipelineDiagnosticReport)pipelineDiagnosticReport
{
  return self->_pipelineDiagnosticReport;
}

- (void)setPipelineDiagnosticReport:(id)a3
{
  objc_storeStrong((id *)&self->_pipelineDiagnosticReport, a3);
}

- (CLPBaroCalibrationIndication)baroCalibrationIndication
{
  return self->_baroCalibrationIndication;
}

- (void)setBaroCalibrationIndication:(id)a3
{
  objc_storeStrong((id *)&self->_baroCalibrationIndication, a3);
}

- (CLPLocationProcessingMetadata)processingMetadata
{
  return self->_processingMetadata;
}

- (void)setProcessingMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_processingMetadata, a3);
}

- (BOOL)isProactiveLocation
{
  return self->_isProactiveLocation;
}

- (CLPVehicleType)vehicleType
{
  return self->_vehicleType;
}

- (void)setVehicleType:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleType, a3);
}

@end
