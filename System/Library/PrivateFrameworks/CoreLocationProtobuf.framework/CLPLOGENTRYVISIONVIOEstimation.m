@implementation CLPLOGENTRYVISIONVIOEstimation

- (int)trackingState
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_trackingState;
  else
    return -1;
}

- (void)setTrackingState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_trackingState = a3;
}

- (void)setHasTrackingState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTrackingState
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)trackingStateAsString:(int)a3
{
  if ((a3 + 1) < 6)
    return *(&off_1E9595B58 + a3 + 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrackingState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIOTrackingStateUnknown")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIOTrackingStateNominal")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIOTrackingStateUnacceptable")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIOTrackingStateUnacceptableDueToFastMotion")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIOTrackingStateUnacceptableDueToLowSceneTexture")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VIOTrackingStateUnacceptableDueToLowLight")))
  {
    v4 = 4;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (BOOL)hasOriginTimestamp
{
  return self->_originTimestamp != 0;
}

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

- (BOOL)hasInertialStateInfo
{
  return self->_inertialStateInfo != 0;
}

- (BOOL)hasInertialState
{
  return self->_inertialState != 0;
}

- (BOOL)hasInertialCovarianceInfo
{
  return self->_inertialCovarianceInfo != 0;
}

- (BOOL)hasInertialCovariance
{
  return self->_inertialCovariance != 0;
}

- (BOOL)hasCameraPose
{
  return self->_cameraPose != 0;
}

- (BOOL)hasCameraIntrinsics
{
  return self->_cameraIntrinsics != 0;
}

- (BOOL)hasCameraImageResolution
{
  return self->_cameraImageResolution != 0;
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
  v8.super_class = (Class)CLPLOGENTRYVISIONVIOEstimation;
  -[CLPLOGENTRYVISIONVIOEstimation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLOGENTRYVISIONVIOEstimation dictionaryRepresentation](self, "dictionaryRepresentation");
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
  CLPLOGENTRYVISIONTimeStamp *originTimestamp;
  void *v7;
  CLPLOGENTRYVISIONTimeStamp *timestamp;
  void *v9;
  CLPLOGENTRYVISIONVIOInertialStateInfo *inertialStateInfo;
  void *v11;
  NSData *inertialState;
  CLPLOGENTRYVISIONVIOInertialCovarianceInfo *inertialCovarianceInfo;
  void *v14;
  NSData *inertialCovariance;
  CLPLOGENTRYVISIONSimdFloatMxN *cameraPose;
  void *v17;
  CLPLOGENTRYVISIONSimdFloatMxN *cameraIntrinsics;
  void *v19;
  CLPLOGENTRYVISIONCGSize *cameraImageResolution;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = self->_trackingState + 1;
    if (v4 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_trackingState);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E9595B58 + v4);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tracking_state"));

  }
  originTimestamp = self->_originTimestamp;
  if (originTimestamp)
  {
    -[CLPLOGENTRYVISIONTimeStamp dictionaryRepresentation](originTimestamp, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("origin_timestamp"));

  }
  timestamp = self->_timestamp;
  if (timestamp)
  {
    -[CLPLOGENTRYVISIONTimeStamp dictionaryRepresentation](timestamp, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestamp"));

  }
  inertialStateInfo = self->_inertialStateInfo;
  if (inertialStateInfo)
  {
    -[CLPLOGENTRYVISIONVIOInertialStateInfo dictionaryRepresentation](inertialStateInfo, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("inertial_state_info"));

  }
  inertialState = self->_inertialState;
  if (inertialState)
    objc_msgSend(v3, "setObject:forKey:", inertialState, CFSTR("inertial_state"));
  inertialCovarianceInfo = self->_inertialCovarianceInfo;
  if (inertialCovarianceInfo)
  {
    -[CLPLOGENTRYVISIONVIOInertialCovarianceInfo dictionaryRepresentation](inertialCovarianceInfo, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("inertial_covariance_info"));

  }
  inertialCovariance = self->_inertialCovariance;
  if (inertialCovariance)
    objc_msgSend(v3, "setObject:forKey:", inertialCovariance, CFSTR("inertial_covariance"));
  cameraPose = self->_cameraPose;
  if (cameraPose)
  {
    -[CLPLOGENTRYVISIONSimdFloatMxN dictionaryRepresentation](cameraPose, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("camera_pose"));

  }
  cameraIntrinsics = self->_cameraIntrinsics;
  if (cameraIntrinsics)
  {
    -[CLPLOGENTRYVISIONSimdFloatMxN dictionaryRepresentation](cameraIntrinsics, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("camera_intrinsics"));

  }
  cameraImageResolution = self->_cameraImageResolution;
  if (cameraImageResolution)
  {
    -[CLPLOGENTRYVISIONCGSize dictionaryRepresentation](cameraImageResolution, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("camera_image_resolution"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVIOEstimationReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_originTimestamp)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_timestamp)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_inertialStateInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_inertialState)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_inertialCovarianceInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_inertialCovariance)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_cameraPose)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_cameraIntrinsics)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_cameraImageResolution)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[20] = self->_trackingState;
    *((_BYTE *)v4 + 84) |= 1u;
  }
  v5 = v4;
  if (self->_originTimestamp)
  {
    objc_msgSend(v4, "setOriginTimestamp:");
    v4 = v5;
  }
  if (self->_timestamp)
  {
    objc_msgSend(v5, "setTimestamp:");
    v4 = v5;
  }
  if (self->_inertialStateInfo)
  {
    objc_msgSend(v5, "setInertialStateInfo:");
    v4 = v5;
  }
  if (self->_inertialState)
  {
    objc_msgSend(v5, "setInertialState:");
    v4 = v5;
  }
  if (self->_inertialCovarianceInfo)
  {
    objc_msgSend(v5, "setInertialCovarianceInfo:");
    v4 = v5;
  }
  if (self->_inertialCovariance)
  {
    objc_msgSend(v5, "setInertialCovariance:");
    v4 = v5;
  }
  if (self->_cameraPose)
  {
    objc_msgSend(v5, "setCameraPose:");
    v4 = v5;
  }
  if (self->_cameraIntrinsics)
  {
    objc_msgSend(v5, "setCameraIntrinsics:");
    v4 = v5;
  }
  if (self->_cameraImageResolution)
  {
    objc_msgSend(v5, "setCameraImageResolution:");
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
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_trackingState;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v7 = -[CLPLOGENTRYVISIONTimeStamp copyWithZone:](self->_originTimestamp, "copyWithZone:", a3);
  v8 = (void *)v6[8];
  v6[8] = v7;

  v9 = -[CLPLOGENTRYVISIONTimeStamp copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  v10 = (void *)v6[9];
  v6[9] = v9;

  v11 = -[CLPLOGENTRYVISIONVIOInertialStateInfo copyWithZone:](self->_inertialStateInfo, "copyWithZone:", a3);
  v12 = (void *)v6[7];
  v6[7] = v11;

  v13 = -[NSData copyWithZone:](self->_inertialState, "copyWithZone:", a3);
  v14 = (void *)v6[6];
  v6[6] = v13;

  v15 = -[CLPLOGENTRYVISIONVIOInertialCovarianceInfo copyWithZone:](self->_inertialCovarianceInfo, "copyWithZone:", a3);
  v16 = (void *)v6[5];
  v6[5] = v15;

  v17 = -[NSData copyWithZone:](self->_inertialCovariance, "copyWithZone:", a3);
  v18 = (void *)v6[4];
  v6[4] = v17;

  v19 = -[CLPLOGENTRYVISIONSimdFloatMxN copyWithZone:](self->_cameraPose, "copyWithZone:", a3);
  v20 = (void *)v6[3];
  v6[3] = v19;

  v21 = -[CLPLOGENTRYVISIONSimdFloatMxN copyWithZone:](self->_cameraIntrinsics, "copyWithZone:", a3);
  v22 = (void *)v6[2];
  v6[2] = v21;

  v23 = -[CLPLOGENTRYVISIONCGSize copyWithZone:](self->_cameraImageResolution, "copyWithZone:", a3);
  v24 = (void *)v6[1];
  v6[1] = v23;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CLPLOGENTRYVISIONTimeStamp *originTimestamp;
  CLPLOGENTRYVISIONTimeStamp *timestamp;
  CLPLOGENTRYVISIONVIOInertialStateInfo *inertialStateInfo;
  NSData *inertialState;
  CLPLOGENTRYVISIONVIOInertialCovarianceInfo *inertialCovarianceInfo;
  NSData *inertialCovariance;
  CLPLOGENTRYVISIONSimdFloatMxN *cameraPose;
  CLPLOGENTRYVISIONSimdFloatMxN *cameraIntrinsics;
  CLPLOGENTRYVISIONCGSize *cameraImageResolution;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_trackingState != *((_DWORD *)v4 + 20))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
LABEL_25:
    v14 = 0;
    goto LABEL_26;
  }
  originTimestamp = self->_originTimestamp;
  if ((unint64_t)originTimestamp | *((_QWORD *)v4 + 8)
    && !-[CLPLOGENTRYVISIONTimeStamp isEqual:](originTimestamp, "isEqual:"))
  {
    goto LABEL_25;
  }
  timestamp = self->_timestamp;
  if ((unint64_t)timestamp | *((_QWORD *)v4 + 9))
  {
    if (!-[CLPLOGENTRYVISIONTimeStamp isEqual:](timestamp, "isEqual:"))
      goto LABEL_25;
  }
  inertialStateInfo = self->_inertialStateInfo;
  if ((unint64_t)inertialStateInfo | *((_QWORD *)v4 + 7))
  {
    if (!-[CLPLOGENTRYVISIONVIOInertialStateInfo isEqual:](inertialStateInfo, "isEqual:"))
      goto LABEL_25;
  }
  inertialState = self->_inertialState;
  if ((unint64_t)inertialState | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](inertialState, "isEqual:"))
      goto LABEL_25;
  }
  inertialCovarianceInfo = self->_inertialCovarianceInfo;
  if ((unint64_t)inertialCovarianceInfo | *((_QWORD *)v4 + 5))
  {
    if (!-[CLPLOGENTRYVISIONVIOInertialCovarianceInfo isEqual:](inertialCovarianceInfo, "isEqual:"))
      goto LABEL_25;
  }
  inertialCovariance = self->_inertialCovariance;
  if ((unint64_t)inertialCovariance | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](inertialCovariance, "isEqual:"))
      goto LABEL_25;
  }
  cameraPose = self->_cameraPose;
  if ((unint64_t)cameraPose | *((_QWORD *)v4 + 3))
  {
    if (!-[CLPLOGENTRYVISIONSimdFloatMxN isEqual:](cameraPose, "isEqual:"))
      goto LABEL_25;
  }
  cameraIntrinsics = self->_cameraIntrinsics;
  if ((unint64_t)cameraIntrinsics | *((_QWORD *)v4 + 2))
  {
    if (!-[CLPLOGENTRYVISIONSimdFloatMxN isEqual:](cameraIntrinsics, "isEqual:"))
      goto LABEL_25;
  }
  cameraImageResolution = self->_cameraImageResolution;
  if ((unint64_t)cameraImageResolution | *((_QWORD *)v4 + 1))
    v14 = -[CLPLOGENTRYVISIONCGSize isEqual:](cameraImageResolution, "isEqual:");
  else
    v14 = 1;
LABEL_26:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_trackingState;
  else
    v3 = 0;
  v4 = -[CLPLOGENTRYVISIONTimeStamp hash](self->_originTimestamp, "hash") ^ v3;
  v5 = -[CLPLOGENTRYVISIONTimeStamp hash](self->_timestamp, "hash");
  v6 = v4 ^ v5 ^ -[CLPLOGENTRYVISIONVIOInertialStateInfo hash](self->_inertialStateInfo, "hash");
  v7 = -[NSData hash](self->_inertialState, "hash");
  v8 = v7 ^ -[CLPLOGENTRYVISIONVIOInertialCovarianceInfo hash](self->_inertialCovarianceInfo, "hash");
  v9 = v6 ^ v8 ^ -[NSData hash](self->_inertialCovariance, "hash");
  v10 = -[CLPLOGENTRYVISIONSimdFloatMxN hash](self->_cameraPose, "hash");
  v11 = v10 ^ -[CLPLOGENTRYVISIONSimdFloatMxN hash](self->_cameraIntrinsics, "hash");
  return v9 ^ v11 ^ -[CLPLOGENTRYVISIONCGSize hash](self->_cameraImageResolution, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  CLPLOGENTRYVISIONTimeStamp *originTimestamp;
  uint64_t v7;
  CLPLOGENTRYVISIONTimeStamp *timestamp;
  uint64_t v9;
  CLPLOGENTRYVISIONVIOInertialStateInfo *inertialStateInfo;
  uint64_t v11;
  CLPLOGENTRYVISIONVIOInertialCovarianceInfo *inertialCovarianceInfo;
  uint64_t v13;
  CLPLOGENTRYVISIONSimdFloatMxN *cameraPose;
  uint64_t v15;
  CLPLOGENTRYVISIONSimdFloatMxN *cameraIntrinsics;
  uint64_t v17;
  CLPLOGENTRYVISIONCGSize *cameraImageResolution;
  uint64_t v19;
  _QWORD *v20;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    self->_trackingState = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 1u;
  }
  originTimestamp = self->_originTimestamp;
  v7 = v5[8];
  v20 = v5;
  if (originTimestamp)
  {
    if (!v7)
      goto LABEL_9;
    -[CLPLOGENTRYVISIONTimeStamp mergeFrom:](originTimestamp, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[CLPLOGENTRYVISIONVIOEstimation setOriginTimestamp:](self, "setOriginTimestamp:");
  }
  v5 = v20;
LABEL_9:
  timestamp = self->_timestamp;
  v9 = v5[9];
  if (timestamp)
  {
    if (!v9)
      goto LABEL_15;
    -[CLPLOGENTRYVISIONTimeStamp mergeFrom:](timestamp, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[CLPLOGENTRYVISIONVIOEstimation setTimestamp:](self, "setTimestamp:");
  }
  v5 = v20;
LABEL_15:
  inertialStateInfo = self->_inertialStateInfo;
  v11 = v5[7];
  if (inertialStateInfo)
  {
    if (!v11)
      goto LABEL_21;
    -[CLPLOGENTRYVISIONVIOInertialStateInfo mergeFrom:](inertialStateInfo, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[CLPLOGENTRYVISIONVIOEstimation setInertialStateInfo:](self, "setInertialStateInfo:");
  }
  v5 = v20;
LABEL_21:
  if (v5[6])
  {
    -[CLPLOGENTRYVISIONVIOEstimation setInertialState:](self, "setInertialState:");
    v5 = v20;
  }
  inertialCovarianceInfo = self->_inertialCovarianceInfo;
  v13 = v5[5];
  if (inertialCovarianceInfo)
  {
    if (!v13)
      goto LABEL_29;
    -[CLPLOGENTRYVISIONVIOInertialCovarianceInfo mergeFrom:](inertialCovarianceInfo, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_29;
    -[CLPLOGENTRYVISIONVIOEstimation setInertialCovarianceInfo:](self, "setInertialCovarianceInfo:");
  }
  v5 = v20;
LABEL_29:
  if (v5[4])
  {
    -[CLPLOGENTRYVISIONVIOEstimation setInertialCovariance:](self, "setInertialCovariance:");
    v5 = v20;
  }
  cameraPose = self->_cameraPose;
  v15 = v5[3];
  if (cameraPose)
  {
    if (!v15)
      goto LABEL_37;
    -[CLPLOGENTRYVISIONSimdFloatMxN mergeFrom:](cameraPose, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_37;
    -[CLPLOGENTRYVISIONVIOEstimation setCameraPose:](self, "setCameraPose:");
  }
  v5 = v20;
LABEL_37:
  cameraIntrinsics = self->_cameraIntrinsics;
  v17 = v5[2];
  if (cameraIntrinsics)
  {
    if (!v17)
      goto LABEL_43;
    -[CLPLOGENTRYVISIONSimdFloatMxN mergeFrom:](cameraIntrinsics, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_43;
    -[CLPLOGENTRYVISIONVIOEstimation setCameraIntrinsics:](self, "setCameraIntrinsics:");
  }
  v5 = v20;
LABEL_43:
  cameraImageResolution = self->_cameraImageResolution;
  v19 = v5[1];
  if (cameraImageResolution)
  {
    if (v19)
    {
      -[CLPLOGENTRYVISIONCGSize mergeFrom:](cameraImageResolution, "mergeFrom:");
LABEL_48:
      v5 = v20;
    }
  }
  else if (v19)
  {
    -[CLPLOGENTRYVISIONVIOEstimation setCameraImageResolution:](self, "setCameraImageResolution:");
    goto LABEL_48;
  }

}

- (CLPLOGENTRYVISIONTimeStamp)originTimestamp
{
  return self->_originTimestamp;
}

- (void)setOriginTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_originTimestamp, a3);
}

- (CLPLOGENTRYVISIONTimeStamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (CLPLOGENTRYVISIONVIOInertialStateInfo)inertialStateInfo
{
  return self->_inertialStateInfo;
}

- (void)setInertialStateInfo:(id)a3
{
  objc_storeStrong((id *)&self->_inertialStateInfo, a3);
}

- (NSData)inertialState
{
  return self->_inertialState;
}

- (void)setInertialState:(id)a3
{
  objc_storeStrong((id *)&self->_inertialState, a3);
}

- (CLPLOGENTRYVISIONVIOInertialCovarianceInfo)inertialCovarianceInfo
{
  return self->_inertialCovarianceInfo;
}

- (void)setInertialCovarianceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_inertialCovarianceInfo, a3);
}

- (NSData)inertialCovariance
{
  return self->_inertialCovariance;
}

- (void)setInertialCovariance:(id)a3
{
  objc_storeStrong((id *)&self->_inertialCovariance, a3);
}

- (CLPLOGENTRYVISIONSimdFloatMxN)cameraPose
{
  return self->_cameraPose;
}

- (void)setCameraPose:(id)a3
{
  objc_storeStrong((id *)&self->_cameraPose, a3);
}

- (CLPLOGENTRYVISIONSimdFloatMxN)cameraIntrinsics
{
  return self->_cameraIntrinsics;
}

- (void)setCameraIntrinsics:(id)a3
{
  objc_storeStrong((id *)&self->_cameraIntrinsics, a3);
}

- (CLPLOGENTRYVISIONCGSize)cameraImageResolution
{
  return self->_cameraImageResolution;
}

- (void)setCameraImageResolution:(id)a3
{
  objc_storeStrong((id *)&self->_cameraImageResolution, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_originTimestamp, 0);
  objc_storeStrong((id *)&self->_inertialStateInfo, 0);
  objc_storeStrong((id *)&self->_inertialState, 0);
  objc_storeStrong((id *)&self->_inertialCovarianceInfo, 0);
  objc_storeStrong((id *)&self->_inertialCovariance, 0);
  objc_storeStrong((id *)&self->_cameraPose, 0);
  objc_storeStrong((id *)&self->_cameraIntrinsics, 0);
  objc_storeStrong((id *)&self->_cameraImageResolution, 0);
}

@end
