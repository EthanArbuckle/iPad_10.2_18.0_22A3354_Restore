@implementation CLPLOGENTRYVISIONLSLHeading

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

- (BOOL)hasRotationFromGlobalToDeviceFrame
{
  return self->_rotationFromGlobalToDeviceFrame != 0;
}

- (BOOL)hasRotationFromGlobalToCameraFrame
{
  return self->_rotationFromGlobalToCameraFrame != 0;
}

- (BOOL)hasRotationalAccuracyInRadians
{
  return self->_rotationalAccuracyInRadians != 0;
}

- (void)setConfidence:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)globalReferenceFrame
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_globalReferenceFrame;
  else
    return -1;
}

- (void)setGlobalReferenceFrame:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_globalReferenceFrame = a3;
}

- (void)setHasGlobalReferenceFrame:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGlobalReferenceFrame
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)globalReferenceFrameAsString:(int)a3
{
  if ((a3 + 1) < 4)
    return *(&off_1E9595AC0 + a3 + 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGlobalReferenceFrame:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LSLGlobalReferenceFrameUnknown")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LSLGlobalReferenceFrameNWU")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LSLGlobalReferenceFrameENU")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LSLGlobalReferenceFrameECEF")))
  {
    v4 = 2;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (BOOL)hasSupplemantaryInfo
{
  return self->_supplemantaryInfo != 0;
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
  v8.super_class = (Class)CLPLOGENTRYVISIONLSLHeading;
  -[CLPLOGENTRYVISIONLSLHeading description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLOGENTRYVISIONLSLHeading dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CLPLOGENTRYVISIONTimeStamp *timestamp;
  void *v5;
  CLPLOGENTRYVISIONSimdDoubleMxN *rotationFromGlobalToDeviceFrame;
  void *v7;
  CLPLOGENTRYVISIONSimdDoubleMxN *rotationFromGlobalToCameraFrame;
  void *v9;
  CLPLOGENTRYVISIONSimdDoubleM *rotationalAccuracyInRadians;
  void *v11;
  char has;
  void *v13;
  int v14;
  void *v15;
  CLPLOGENTRYVISIONLSLLocation *location;
  void *v17;
  CLPLOGENTRYVISIONLSLHeadingSupplInfo *supplemantaryInfo;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  if (timestamp)
  {
    -[CLPLOGENTRYVISIONTimeStamp dictionaryRepresentation](timestamp, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

  }
  rotationFromGlobalToDeviceFrame = self->_rotationFromGlobalToDeviceFrame;
  if (rotationFromGlobalToDeviceFrame)
  {
    -[CLPLOGENTRYVISIONSimdDoubleMxN dictionaryRepresentation](rotationFromGlobalToDeviceFrame, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rotation_from_global_to_device_frame"));

  }
  rotationFromGlobalToCameraFrame = self->_rotationFromGlobalToCameraFrame;
  if (rotationFromGlobalToCameraFrame)
  {
    -[CLPLOGENTRYVISIONSimdDoubleMxN dictionaryRepresentation](rotationFromGlobalToCameraFrame, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("rotation_from_global_to_camera_frame"));

  }
  rotationalAccuracyInRadians = self->_rotationalAccuracyInRadians;
  if (rotationalAccuracyInRadians)
  {
    -[CLPLOGENTRYVISIONSimdDoubleM dictionaryRepresentation](rotationalAccuracyInRadians, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("rotational_accuracy_in_radians"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("confidence"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v14 = self->_globalReferenceFrame + 1;
    if (v14 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_globalReferenceFrame);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(&off_1E9595AC0 + v14);
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("global_reference_frame"));

  }
  location = self->_location;
  if (location)
  {
    -[CLPLOGENTRYVISIONLSLLocation dictionaryRepresentation](location, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("location"));

  }
  supplemantaryInfo = self->_supplemantaryInfo;
  if (supplemantaryInfo)
  {
    -[CLPLOGENTRYVISIONLSLHeadingSupplInfo dictionaryRepresentation](supplemantaryInfo, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("supplemantary_info"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONLSLHeadingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_timestamp)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_rotationFromGlobalToDeviceFrame)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_rotationFromGlobalToCameraFrame)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_rotationalAccuracyInRadians)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_supplemantaryInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_timestamp)
  {
    objc_msgSend(v4, "setTimestamp:");
    v4 = v6;
  }
  if (self->_rotationFromGlobalToDeviceFrame)
  {
    objc_msgSend(v6, "setRotationFromGlobalToDeviceFrame:");
    v4 = v6;
  }
  if (self->_rotationFromGlobalToCameraFrame)
  {
    objc_msgSend(v6, "setRotationFromGlobalToCameraFrame:");
    v4 = v6;
  }
  if (self->_rotationalAccuracyInRadians)
  {
    objc_msgSend(v6, "setRotationalAccuracyInRadians:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_confidence;
    *((_BYTE *)v4 + 72) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_globalReferenceFrame;
    *((_BYTE *)v4 + 72) |= 2u;
  }
  if (self->_location)
  {
    objc_msgSend(v6, "setLocation:");
    v4 = v6;
  }
  if (self->_supplemantaryInfo)
  {
    objc_msgSend(v6, "setSupplemantaryInfo:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char has;
  id v15;
  void *v16;
  id v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CLPLOGENTRYVISIONTimeStamp copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[CLPLOGENTRYVISIONSimdDoubleMxN copyWithZone:](self->_rotationFromGlobalToDeviceFrame, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[CLPLOGENTRYVISIONSimdDoubleMxN copyWithZone:](self->_rotationFromGlobalToCameraFrame, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[CLPLOGENTRYVISIONSimdDoubleM copyWithZone:](self->_rotationalAccuracyInRadians, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_confidence;
    *(_BYTE *)(v5 + 72) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_globalReferenceFrame;
    *(_BYTE *)(v5 + 72) |= 2u;
  }
  v15 = -[CLPLOGENTRYVISIONLSLLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v15;

  v17 = -[CLPLOGENTRYVISIONLSLHeadingSupplInfo copyWithZone:](self->_supplemantaryInfo, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CLPLOGENTRYVISIONTimeStamp *timestamp;
  CLPLOGENTRYVISIONSimdDoubleMxN *rotationFromGlobalToDeviceFrame;
  CLPLOGENTRYVISIONSimdDoubleMxN *rotationFromGlobalToCameraFrame;
  CLPLOGENTRYVISIONSimdDoubleM *rotationalAccuracyInRadians;
  CLPLOGENTRYVISIONLSLLocation *location;
  CLPLOGENTRYVISIONLSLHeadingSupplInfo *supplemantaryInfo;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  timestamp = self->_timestamp;
  if ((unint64_t)timestamp | *((_QWORD *)v4 + 8))
  {
    if (!-[CLPLOGENTRYVISIONTimeStamp isEqual:](timestamp, "isEqual:"))
      goto LABEL_24;
  }
  rotationFromGlobalToDeviceFrame = self->_rotationFromGlobalToDeviceFrame;
  if ((unint64_t)rotationFromGlobalToDeviceFrame | *((_QWORD *)v4 + 5))
  {
    if (!-[CLPLOGENTRYVISIONSimdDoubleMxN isEqual:](rotationFromGlobalToDeviceFrame, "isEqual:"))
      goto LABEL_24;
  }
  rotationFromGlobalToCameraFrame = self->_rotationFromGlobalToCameraFrame;
  if ((unint64_t)rotationFromGlobalToCameraFrame | *((_QWORD *)v4 + 4))
  {
    if (!-[CLPLOGENTRYVISIONSimdDoubleMxN isEqual:](rotationFromGlobalToCameraFrame, "isEqual:"))
      goto LABEL_24;
  }
  rotationalAccuracyInRadians = self->_rotationalAccuracyInRadians;
  if ((unint64_t)rotationalAccuracyInRadians | *((_QWORD *)v4 + 6))
  {
    if (!-[CLPLOGENTRYVISIONSimdDoubleM isEqual:](rotationalAccuracyInRadians, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_confidence != *((double *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_24:
    v11 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_globalReferenceFrame != *((_DWORD *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_24;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 3)
    && !-[CLPLOGENTRYVISIONLSLLocation isEqual:](location, "isEqual:"))
  {
    goto LABEL_24;
  }
  supplemantaryInfo = self->_supplemantaryInfo;
  if ((unint64_t)supplemantaryInfo | *((_QWORD *)v4 + 7))
    v11 = -[CLPLOGENTRYVISIONLSLHeadingSupplInfo isEqual:](supplemantaryInfo, "isEqual:");
  else
    v11 = 1;
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char has;
  unint64_t v8;
  double confidence;
  double v10;
  long double v11;
  double v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v3 = -[CLPLOGENTRYVISIONTimeStamp hash](self->_timestamp, "hash");
  v4 = -[CLPLOGENTRYVISIONSimdDoubleMxN hash](self->_rotationFromGlobalToDeviceFrame, "hash");
  v5 = -[CLPLOGENTRYVISIONSimdDoubleMxN hash](self->_rotationFromGlobalToCameraFrame, "hash");
  v6 = -[CLPLOGENTRYVISIONSimdDoubleM hash](self->_rotationalAccuracyInRadians, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    confidence = self->_confidence;
    v10 = -confidence;
    if (confidence >= 0.0)
      v10 = self->_confidence;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  if ((has & 2) != 0)
    v13 = 2654435761 * self->_globalReferenceFrame;
  else
    v13 = 0;
  v14 = v4 ^ v3 ^ v5 ^ v6;
  v15 = v8 ^ v13 ^ -[CLPLOGENTRYVISIONLSLLocation hash](self->_location, "hash");
  return v14 ^ v15 ^ -[CLPLOGENTRYVISIONLSLHeadingSupplInfo hash](self->_supplemantaryInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CLPLOGENTRYVISIONTimeStamp *timestamp;
  uint64_t v6;
  CLPLOGENTRYVISIONSimdDoubleMxN *rotationFromGlobalToDeviceFrame;
  uint64_t v8;
  CLPLOGENTRYVISIONSimdDoubleMxN *rotationFromGlobalToCameraFrame;
  uint64_t v10;
  CLPLOGENTRYVISIONSimdDoubleM *rotationalAccuracyInRadians;
  uint64_t v12;
  char v13;
  CLPLOGENTRYVISIONLSLLocation *location;
  uint64_t v15;
  CLPLOGENTRYVISIONLSLHeadingSupplInfo *supplemantaryInfo;
  uint64_t v17;
  id v18;

  v4 = a3;
  timestamp = self->_timestamp;
  v6 = *((_QWORD *)v4 + 8);
  v18 = v4;
  if (timestamp)
  {
    if (!v6)
      goto LABEL_7;
    -[CLPLOGENTRYVISIONTimeStamp mergeFrom:](timestamp, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[CLPLOGENTRYVISIONLSLHeading setTimestamp:](self, "setTimestamp:");
  }
  v4 = v18;
LABEL_7:
  rotationFromGlobalToDeviceFrame = self->_rotationFromGlobalToDeviceFrame;
  v8 = *((_QWORD *)v4 + 5);
  if (rotationFromGlobalToDeviceFrame)
  {
    if (!v8)
      goto LABEL_13;
    -[CLPLOGENTRYVISIONSimdDoubleMxN mergeFrom:](rotationFromGlobalToDeviceFrame, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[CLPLOGENTRYVISIONLSLHeading setRotationFromGlobalToDeviceFrame:](self, "setRotationFromGlobalToDeviceFrame:");
  }
  v4 = v18;
LABEL_13:
  rotationFromGlobalToCameraFrame = self->_rotationFromGlobalToCameraFrame;
  v10 = *((_QWORD *)v4 + 4);
  if (rotationFromGlobalToCameraFrame)
  {
    if (!v10)
      goto LABEL_19;
    -[CLPLOGENTRYVISIONSimdDoubleMxN mergeFrom:](rotationFromGlobalToCameraFrame, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[CLPLOGENTRYVISIONLSLHeading setRotationFromGlobalToCameraFrame:](self, "setRotationFromGlobalToCameraFrame:");
  }
  v4 = v18;
LABEL_19:
  rotationalAccuracyInRadians = self->_rotationalAccuracyInRadians;
  v12 = *((_QWORD *)v4 + 6);
  if (rotationalAccuracyInRadians)
  {
    if (!v12)
      goto LABEL_25;
    -[CLPLOGENTRYVISIONSimdDoubleM mergeFrom:](rotationalAccuracyInRadians, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_25;
    -[CLPLOGENTRYVISIONLSLHeading setRotationalAccuracyInRadians:](self, "setRotationalAccuracyInRadians:");
  }
  v4 = v18;
LABEL_25:
  v13 = *((_BYTE *)v4 + 72);
  if ((v13 & 1) != 0)
  {
    self->_confidence = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v13 = *((_BYTE *)v4 + 72);
  }
  if ((v13 & 2) != 0)
  {
    self->_globalReferenceFrame = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
  location = self->_location;
  v15 = *((_QWORD *)v4 + 3);
  if (location)
  {
    if (!v15)
      goto LABEL_35;
    -[CLPLOGENTRYVISIONLSLLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_35;
    -[CLPLOGENTRYVISIONLSLHeading setLocation:](self, "setLocation:");
  }
  v4 = v18;
LABEL_35:
  supplemantaryInfo = self->_supplemantaryInfo;
  v17 = *((_QWORD *)v4 + 7);
  if (supplemantaryInfo)
  {
    if (v17)
    {
      -[CLPLOGENTRYVISIONLSLHeadingSupplInfo mergeFrom:](supplemantaryInfo, "mergeFrom:");
LABEL_40:
      v4 = v18;
    }
  }
  else if (v17)
  {
    -[CLPLOGENTRYVISIONLSLHeading setSupplemantaryInfo:](self, "setSupplemantaryInfo:");
    goto LABEL_40;
  }

}

- (CLPLOGENTRYVISIONTimeStamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (CLPLOGENTRYVISIONSimdDoubleMxN)rotationFromGlobalToDeviceFrame
{
  return self->_rotationFromGlobalToDeviceFrame;
}

- (void)setRotationFromGlobalToDeviceFrame:(id)a3
{
  objc_storeStrong((id *)&self->_rotationFromGlobalToDeviceFrame, a3);
}

- (CLPLOGENTRYVISIONSimdDoubleMxN)rotationFromGlobalToCameraFrame
{
  return self->_rotationFromGlobalToCameraFrame;
}

- (void)setRotationFromGlobalToCameraFrame:(id)a3
{
  objc_storeStrong((id *)&self->_rotationFromGlobalToCameraFrame, a3);
}

- (CLPLOGENTRYVISIONSimdDoubleM)rotationalAccuracyInRadians
{
  return self->_rotationalAccuracyInRadians;
}

- (void)setRotationalAccuracyInRadians:(id)a3
{
  objc_storeStrong((id *)&self->_rotationalAccuracyInRadians, a3);
}

- (double)confidence
{
  return self->_confidence;
}

- (CLPLOGENTRYVISIONLSLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (CLPLOGENTRYVISIONLSLHeadingSupplInfo)supplemantaryInfo
{
  return self->_supplemantaryInfo;
}

- (void)setSupplemantaryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_supplemantaryInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_supplemantaryInfo, 0);
  objc_storeStrong((id *)&self->_rotationalAccuracyInRadians, 0);
  objc_storeStrong((id *)&self->_rotationFromGlobalToDeviceFrame, 0);
  objc_storeStrong((id *)&self->_rotationFromGlobalToCameraFrame, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
