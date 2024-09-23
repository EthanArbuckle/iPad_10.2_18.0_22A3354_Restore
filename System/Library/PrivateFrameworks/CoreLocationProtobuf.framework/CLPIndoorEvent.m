@implementation CLPIndoorEvent

- (CLPInertialOdometry)inertialOdometry
{
  return self->_inertialOdometry;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 1;
}

- (CLPIndoorPressure)pressure
{
  return self->_pressure;
}

- (CLPOutdoorUpdate)outdoorUpdate
{
  return self->_outdoorUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutUpdateMotionActivity, 0);
  objc_storeStrong((id *)&self->_wifiScan, 0);
  objc_storeStrong((id *)&self->_vlLocalizationResult, 0);
  objc_storeStrong((id *)&self->_vioEstimation, 0);
  objc_storeStrong((id *)&self->_pressure, 0);
  objc_storeStrong((id *)&self->_outdoorUpdate, 0);
  objc_storeStrong((id *)&self->_motionActivity, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_inertialOdometry, 0);
  objc_storeStrong((id *)&self->_cmPedometer, 0);
  objc_storeStrong((id *)&self->_cmAttitude, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setInertialOdometry:(id)a3
{
  objc_storeStrong((id *)&self->_inertialOdometry, a3);
}

- (void)setPressure:(id)a3
{
  objc_storeStrong((id *)&self->_pressure, a3);
}

- (CLPIndoorCMAttitude)cmAttitude
{
  return self->_cmAttitude;
}

- (CLPIndoorWifiScan)wifiScan
{
  return self->_wifiScan;
}

- (void)setOutdoorUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_outdoorUpdate, a3);
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_cmAttitude)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_cmPedometer)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_motionActivity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_pressure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_wifiScan)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_vioEstimation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_vlLocalizationResult)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_workoutUpdateMotionActivity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_inertialOdometry)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_outdoorUpdate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)setWifiScan:(id)a3
{
  objc_storeStrong((id *)&self->_wifiScan, a3);
}

- (void)setCmAttitude:(id)a3
{
  objc_storeStrong((id *)&self->_cmAttitude, a3);
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 0xC)
    return *(&off_1E9595A60 + a3 - 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CMAttitude")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CMPedometer")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Location")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MotionActivity")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Pressure")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WifiScan")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BundleId")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIOEstimation")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLLocalizationResult")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WorkoutUpdateMotionActivity")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InertialOdometry")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OutdoorUpdate")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasCmAttitude
{
  return self->_cmAttitude != 0;
}

- (BOOL)hasCmPedometer
{
  return self->_cmPedometer != 0;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (BOOL)hasMotionActivity
{
  return self->_motionActivity != 0;
}

- (BOOL)hasPressure
{
  return self->_pressure != 0;
}

- (BOOL)hasWifiScan
{
  return self->_wifiScan != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasVioEstimation
{
  return self->_vioEstimation != 0;
}

- (BOOL)hasVlLocalizationResult
{
  return self->_vlLocalizationResult != 0;
}

- (BOOL)hasWorkoutUpdateMotionActivity
{
  return self->_workoutUpdateMotionActivity != 0;
}

- (BOOL)hasInertialOdometry
{
  return self->_inertialOdometry != 0;
}

- (BOOL)hasOutdoorUpdate
{
  return self->_outdoorUpdate != 0;
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
  v8.super_class = (Class)CLPIndoorEvent;
  -[CLPIndoorEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPIndoorEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  void *v5;
  CLPIndoorCMAttitude *cmAttitude;
  void *v7;
  CLPIndoorCMPedometer *cmPedometer;
  void *v9;
  CLPLocation *location;
  void *v11;
  CLPIndoorMotionActivity *motionActivity;
  void *v13;
  CLPIndoorPressure *pressure;
  void *v15;
  CLPIndoorWifiScan *wifiScan;
  void *v17;
  CLPBundleId *bundleId;
  void *v19;
  CLPLOGENTRYVISIONVIOEstimation *vioEstimation;
  void *v21;
  CLPLOGENTRYVISIONVLLocalizationResult *vlLocalizationResult;
  void *v23;
  CLPWorkoutUpdateMotionActivity *workoutUpdateMotionActivity;
  void *v25;
  CLPInertialOdometry *inertialOdometry;
  void *v27;
  CLPOutdoorUpdate *outdoorUpdate;
  void *v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = self->_type - 1;
    if (v4 >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E9595A60 + v4);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  cmAttitude = self->_cmAttitude;
  if (cmAttitude)
  {
    -[CLPIndoorCMAttitude dictionaryRepresentation](cmAttitude, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cmAttitude"));

  }
  cmPedometer = self->_cmPedometer;
  if (cmPedometer)
  {
    -[CLPIndoorCMPedometer dictionaryRepresentation](cmPedometer, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cmPedometer"));

  }
  location = self->_location;
  if (location)
  {
    -[CLPLocation dictionaryRepresentation](location, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("location"));

  }
  motionActivity = self->_motionActivity;
  if (motionActivity)
  {
    -[CLPIndoorMotionActivity dictionaryRepresentation](motionActivity, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("motionActivity"));

  }
  pressure = self->_pressure;
  if (pressure)
  {
    -[CLPIndoorPressure dictionaryRepresentation](pressure, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("pressure"));

  }
  wifiScan = self->_wifiScan;
  if (wifiScan)
  {
    -[CLPIndoorWifiScan dictionaryRepresentation](wifiScan, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("wifiScan"));

  }
  bundleId = self->_bundleId;
  if (bundleId)
  {
    -[CLPBundleId dictionaryRepresentation](bundleId, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("bundleId"));

  }
  vioEstimation = self->_vioEstimation;
  if (vioEstimation)
  {
    -[CLPLOGENTRYVISIONVIOEstimation dictionaryRepresentation](vioEstimation, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("vioEstimation"));

  }
  vlLocalizationResult = self->_vlLocalizationResult;
  if (vlLocalizationResult)
  {
    -[CLPLOGENTRYVISIONVLLocalizationResult dictionaryRepresentation](vlLocalizationResult, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("vlLocalizationResult"));

  }
  workoutUpdateMotionActivity = self->_workoutUpdateMotionActivity;
  if (workoutUpdateMotionActivity)
  {
    -[CLPWorkoutUpdateMotionActivity dictionaryRepresentation](workoutUpdateMotionActivity, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("workoutUpdateMotionActivity"));

  }
  inertialOdometry = self->_inertialOdometry;
  if (inertialOdometry)
  {
    -[CLPInertialOdometry dictionaryRepresentation](inertialOdometry, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("inertialOdometry"));

  }
  outdoorUpdate = self->_outdoorUpdate;
  if (outdoorUpdate)
  {
    -[CLPOutdoorUpdate dictionaryRepresentation](outdoorUpdate, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("outdoorUpdate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIndoorEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[18] = self->_type;
    *((_BYTE *)v4 + 112) |= 1u;
  }
  v5 = v4;
  if (self->_cmAttitude)
  {
    objc_msgSend(v4, "setCmAttitude:");
    v4 = v5;
  }
  if (self->_cmPedometer)
  {
    objc_msgSend(v5, "setCmPedometer:");
    v4 = v5;
  }
  if (self->_location)
  {
    objc_msgSend(v5, "setLocation:");
    v4 = v5;
  }
  if (self->_motionActivity)
  {
    objc_msgSend(v5, "setMotionActivity:");
    v4 = v5;
  }
  if (self->_pressure)
  {
    objc_msgSend(v5, "setPressure:");
    v4 = v5;
  }
  if (self->_wifiScan)
  {
    objc_msgSend(v5, "setWifiScan:");
    v4 = v5;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v5, "setBundleId:");
    v4 = v5;
  }
  if (self->_vioEstimation)
  {
    objc_msgSend(v5, "setVioEstimation:");
    v4 = v5;
  }
  if (self->_vlLocalizationResult)
  {
    objc_msgSend(v5, "setVlLocalizationResult:");
    v4 = v5;
  }
  if (self->_workoutUpdateMotionActivity)
  {
    objc_msgSend(v5, "setWorkoutUpdateMotionActivity:");
    v4 = v5;
  }
  if (self->_inertialOdometry)
  {
    objc_msgSend(v5, "setInertialOdometry:");
    v4 = v5;
  }
  if (self->_outdoorUpdate)
  {
    objc_msgSend(v5, "setOutdoorUpdate:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_type;
    *(_BYTE *)(v5 + 112) |= 1u;
  }
  v7 = -[CLPIndoorCMAttitude copyWithZone:](self->_cmAttitude, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[CLPIndoorCMPedometer copyWithZone:](self->_cmPedometer, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[CLPLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v12 = (void *)v6[5];
  v6[5] = v11;

  v13 = -[CLPIndoorMotionActivity copyWithZone:](self->_motionActivity, "copyWithZone:", a3);
  v14 = (void *)v6[6];
  v6[6] = v13;

  v15 = -[CLPIndoorPressure copyWithZone:](self->_pressure, "copyWithZone:", a3);
  v16 = (void *)v6[8];
  v6[8] = v15;

  v17 = -[CLPIndoorWifiScan copyWithZone:](self->_wifiScan, "copyWithZone:", a3);
  v18 = (void *)v6[12];
  v6[12] = v17;

  v19 = -[CLPBundleId copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v20 = (void *)v6[1];
  v6[1] = v19;

  v21 = -[CLPLOGENTRYVISIONVIOEstimation copyWithZone:](self->_vioEstimation, "copyWithZone:", a3);
  v22 = (void *)v6[10];
  v6[10] = v21;

  v23 = -[CLPLOGENTRYVISIONVLLocalizationResult copyWithZone:](self->_vlLocalizationResult, "copyWithZone:", a3);
  v24 = (void *)v6[11];
  v6[11] = v23;

  v25 = -[CLPWorkoutUpdateMotionActivity copyWithZone:](self->_workoutUpdateMotionActivity, "copyWithZone:", a3);
  v26 = (void *)v6[13];
  v6[13] = v25;

  v27 = -[CLPInertialOdometry copyWithZone:](self->_inertialOdometry, "copyWithZone:", a3);
  v28 = (void *)v6[4];
  v6[4] = v27;

  v29 = -[CLPOutdoorUpdate copyWithZone:](self->_outdoorUpdate, "copyWithZone:", a3);
  v30 = (void *)v6[7];
  v6[7] = v29;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CLPIndoorCMAttitude *cmAttitude;
  CLPIndoorCMPedometer *cmPedometer;
  CLPLocation *location;
  CLPIndoorMotionActivity *motionActivity;
  CLPIndoorPressure *pressure;
  CLPIndoorWifiScan *wifiScan;
  CLPBundleId *bundleId;
  CLPLOGENTRYVISIONVIOEstimation *vioEstimation;
  CLPLOGENTRYVISIONVLLocalizationResult *vlLocalizationResult;
  CLPWorkoutUpdateMotionActivity *workoutUpdateMotionActivity;
  CLPInertialOdometry *inertialOdometry;
  CLPOutdoorUpdate *outdoorUpdate;
  char v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 1) == 0 || self->_type != *((_DWORD *)v4 + 18))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 112) & 1) != 0)
  {
LABEL_31:
    v17 = 0;
    goto LABEL_32;
  }
  cmAttitude = self->_cmAttitude;
  if ((unint64_t)cmAttitude | *((_QWORD *)v4 + 2) && !-[CLPIndoorCMAttitude isEqual:](cmAttitude, "isEqual:"))
    goto LABEL_31;
  cmPedometer = self->_cmPedometer;
  if ((unint64_t)cmPedometer | *((_QWORD *)v4 + 3))
  {
    if (!-[CLPIndoorCMPedometer isEqual:](cmPedometer, "isEqual:"))
      goto LABEL_31;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 5))
  {
    if (!-[CLPLocation isEqual:](location, "isEqual:"))
      goto LABEL_31;
  }
  motionActivity = self->_motionActivity;
  if ((unint64_t)motionActivity | *((_QWORD *)v4 + 6))
  {
    if (!-[CLPIndoorMotionActivity isEqual:](motionActivity, "isEqual:"))
      goto LABEL_31;
  }
  pressure = self->_pressure;
  if ((unint64_t)pressure | *((_QWORD *)v4 + 8))
  {
    if (!-[CLPIndoorPressure isEqual:](pressure, "isEqual:"))
      goto LABEL_31;
  }
  wifiScan = self->_wifiScan;
  if ((unint64_t)wifiScan | *((_QWORD *)v4 + 12))
  {
    if (!-[CLPIndoorWifiScan isEqual:](wifiScan, "isEqual:"))
      goto LABEL_31;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 1))
  {
    if (!-[CLPBundleId isEqual:](bundleId, "isEqual:"))
      goto LABEL_31;
  }
  vioEstimation = self->_vioEstimation;
  if ((unint64_t)vioEstimation | *((_QWORD *)v4 + 10))
  {
    if (!-[CLPLOGENTRYVISIONVIOEstimation isEqual:](vioEstimation, "isEqual:"))
      goto LABEL_31;
  }
  vlLocalizationResult = self->_vlLocalizationResult;
  if ((unint64_t)vlLocalizationResult | *((_QWORD *)v4 + 11))
  {
    if (!-[CLPLOGENTRYVISIONVLLocalizationResult isEqual:](vlLocalizationResult, "isEqual:"))
      goto LABEL_31;
  }
  workoutUpdateMotionActivity = self->_workoutUpdateMotionActivity;
  if ((unint64_t)workoutUpdateMotionActivity | *((_QWORD *)v4 + 13))
  {
    if (!-[CLPWorkoutUpdateMotionActivity isEqual:](workoutUpdateMotionActivity, "isEqual:"))
      goto LABEL_31;
  }
  inertialOdometry = self->_inertialOdometry;
  if ((unint64_t)inertialOdometry | *((_QWORD *)v4 + 4))
  {
    if (!-[CLPInertialOdometry isEqual:](inertialOdometry, "isEqual:"))
      goto LABEL_31;
  }
  outdoorUpdate = self->_outdoorUpdate;
  if ((unint64_t)outdoorUpdate | *((_QWORD *)v4 + 7))
    v17 = -[CLPOutdoorUpdate isEqual:](outdoorUpdate, "isEqual:");
  else
    v17 = 1;
LABEL_32:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[CLPIndoorCMAttitude hash](self->_cmAttitude, "hash") ^ v3;
  v5 = -[CLPIndoorCMPedometer hash](self->_cmPedometer, "hash");
  v6 = v4 ^ v5 ^ -[CLPLocation hash](self->_location, "hash");
  v7 = -[CLPIndoorMotionActivity hash](self->_motionActivity, "hash");
  v8 = v7 ^ -[CLPIndoorPressure hash](self->_pressure, "hash");
  v9 = v6 ^ v8 ^ -[CLPIndoorWifiScan hash](self->_wifiScan, "hash");
  v10 = -[CLPBundleId hash](self->_bundleId, "hash");
  v11 = v10 ^ -[CLPLOGENTRYVISIONVIOEstimation hash](self->_vioEstimation, "hash");
  v12 = v11 ^ -[CLPLOGENTRYVISIONVLLocalizationResult hash](self->_vlLocalizationResult, "hash");
  v13 = v9 ^ v12 ^ -[CLPWorkoutUpdateMotionActivity hash](self->_workoutUpdateMotionActivity, "hash");
  v14 = -[CLPInertialOdometry hash](self->_inertialOdometry, "hash");
  return v13 ^ v14 ^ -[CLPOutdoorUpdate hash](self->_outdoorUpdate, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  CLPIndoorCMAttitude *cmAttitude;
  uint64_t v7;
  CLPIndoorCMPedometer *cmPedometer;
  uint64_t v9;
  CLPLocation *location;
  uint64_t v11;
  CLPIndoorMotionActivity *motionActivity;
  uint64_t v13;
  CLPIndoorPressure *pressure;
  uint64_t v15;
  CLPIndoorWifiScan *wifiScan;
  uint64_t v17;
  CLPBundleId *bundleId;
  uint64_t v19;
  CLPLOGENTRYVISIONVIOEstimation *vioEstimation;
  uint64_t v21;
  CLPLOGENTRYVISIONVLLocalizationResult *vlLocalizationResult;
  uint64_t v23;
  CLPWorkoutUpdateMotionActivity *workoutUpdateMotionActivity;
  uint64_t v25;
  CLPInertialOdometry *inertialOdometry;
  uint64_t v27;
  CLPOutdoorUpdate *outdoorUpdate;
  uint64_t v29;
  _QWORD *v30;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 112) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 1u;
  }
  cmAttitude = self->_cmAttitude;
  v7 = v5[2];
  v30 = v5;
  if (cmAttitude)
  {
    if (!v7)
      goto LABEL_9;
    -[CLPIndoorCMAttitude mergeFrom:](cmAttitude, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[CLPIndoorEvent setCmAttitude:](self, "setCmAttitude:");
  }
  v5 = v30;
LABEL_9:
  cmPedometer = self->_cmPedometer;
  v9 = v5[3];
  if (cmPedometer)
  {
    if (!v9)
      goto LABEL_15;
    -[CLPIndoorCMPedometer mergeFrom:](cmPedometer, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[CLPIndoorEvent setCmPedometer:](self, "setCmPedometer:");
  }
  v5 = v30;
LABEL_15:
  location = self->_location;
  v11 = v5[5];
  if (location)
  {
    if (!v11)
      goto LABEL_21;
    -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[CLPIndoorEvent setLocation:](self, "setLocation:");
  }
  v5 = v30;
LABEL_21:
  motionActivity = self->_motionActivity;
  v13 = v5[6];
  if (motionActivity)
  {
    if (!v13)
      goto LABEL_27;
    -[CLPIndoorMotionActivity mergeFrom:](motionActivity, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    -[CLPIndoorEvent setMotionActivity:](self, "setMotionActivity:");
  }
  v5 = v30;
LABEL_27:
  pressure = self->_pressure;
  v15 = v5[8];
  if (pressure)
  {
    if (!v15)
      goto LABEL_33;
    -[CLPIndoorPressure mergeFrom:](pressure, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_33;
    -[CLPIndoorEvent setPressure:](self, "setPressure:");
  }
  v5 = v30;
LABEL_33:
  wifiScan = self->_wifiScan;
  v17 = v5[12];
  if (wifiScan)
  {
    if (!v17)
      goto LABEL_39;
    -[CLPIndoorWifiScan mergeFrom:](wifiScan, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_39;
    -[CLPIndoorEvent setWifiScan:](self, "setWifiScan:");
  }
  v5 = v30;
LABEL_39:
  bundleId = self->_bundleId;
  v19 = v5[1];
  if (bundleId)
  {
    if (!v19)
      goto LABEL_45;
    -[CLPBundleId mergeFrom:](bundleId, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_45;
    -[CLPIndoorEvent setBundleId:](self, "setBundleId:");
  }
  v5 = v30;
LABEL_45:
  vioEstimation = self->_vioEstimation;
  v21 = v5[10];
  if (vioEstimation)
  {
    if (!v21)
      goto LABEL_51;
    -[CLPLOGENTRYVISIONVIOEstimation mergeFrom:](vioEstimation, "mergeFrom:");
  }
  else
  {
    if (!v21)
      goto LABEL_51;
    -[CLPIndoorEvent setVioEstimation:](self, "setVioEstimation:");
  }
  v5 = v30;
LABEL_51:
  vlLocalizationResult = self->_vlLocalizationResult;
  v23 = v5[11];
  if (vlLocalizationResult)
  {
    if (!v23)
      goto LABEL_57;
    -[CLPLOGENTRYVISIONVLLocalizationResult mergeFrom:](vlLocalizationResult, "mergeFrom:");
  }
  else
  {
    if (!v23)
      goto LABEL_57;
    -[CLPIndoorEvent setVlLocalizationResult:](self, "setVlLocalizationResult:");
  }
  v5 = v30;
LABEL_57:
  workoutUpdateMotionActivity = self->_workoutUpdateMotionActivity;
  v25 = v5[13];
  if (workoutUpdateMotionActivity)
  {
    if (!v25)
      goto LABEL_63;
    -[CLPWorkoutUpdateMotionActivity mergeFrom:](workoutUpdateMotionActivity, "mergeFrom:");
  }
  else
  {
    if (!v25)
      goto LABEL_63;
    -[CLPIndoorEvent setWorkoutUpdateMotionActivity:](self, "setWorkoutUpdateMotionActivity:");
  }
  v5 = v30;
LABEL_63:
  inertialOdometry = self->_inertialOdometry;
  v27 = v5[4];
  if (inertialOdometry)
  {
    if (!v27)
      goto LABEL_69;
    -[CLPInertialOdometry mergeFrom:](inertialOdometry, "mergeFrom:");
  }
  else
  {
    if (!v27)
      goto LABEL_69;
    -[CLPIndoorEvent setInertialOdometry:](self, "setInertialOdometry:");
  }
  v5 = v30;
LABEL_69:
  outdoorUpdate = self->_outdoorUpdate;
  v29 = v5[7];
  if (outdoorUpdate)
  {
    if (v29)
    {
      -[CLPOutdoorUpdate mergeFrom:](outdoorUpdate, "mergeFrom:");
LABEL_74:
      v5 = v30;
    }
  }
  else if (v29)
  {
    -[CLPIndoorEvent setOutdoorUpdate:](self, "setOutdoorUpdate:");
    goto LABEL_74;
  }

}

- (CLPIndoorCMPedometer)cmPedometer
{
  return self->_cmPedometer;
}

- (void)setCmPedometer:(id)a3
{
  objc_storeStrong((id *)&self->_cmPedometer, a3);
}

- (CLPIndoorMotionActivity)motionActivity
{
  return self->_motionActivity;
}

- (void)setMotionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivity, a3);
}

- (CLPBundleId)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (CLPLOGENTRYVISIONVIOEstimation)vioEstimation
{
  return self->_vioEstimation;
}

- (void)setVioEstimation:(id)a3
{
  objc_storeStrong((id *)&self->_vioEstimation, a3);
}

- (CLPLOGENTRYVISIONVLLocalizationResult)vlLocalizationResult
{
  return self->_vlLocalizationResult;
}

- (void)setVlLocalizationResult:(id)a3
{
  objc_storeStrong((id *)&self->_vlLocalizationResult, a3);
}

- (CLPWorkoutUpdateMotionActivity)workoutUpdateMotionActivity
{
  return self->_workoutUpdateMotionActivity;
}

- (void)setWorkoutUpdateMotionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_workoutUpdateMotionActivity, a3);
}

@end
