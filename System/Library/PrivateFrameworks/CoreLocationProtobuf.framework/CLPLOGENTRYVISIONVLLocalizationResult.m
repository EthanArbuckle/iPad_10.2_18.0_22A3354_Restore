@implementation CLPLOGENTRYVISIONVLLocalizationResult

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (BOOL)hasTransform
{
  return self->_transform != 0;
}

- (BOOL)hasCovariance
{
  return self->_covariance != 0;
}

- (void)setConfidence:(float)a3
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

- (BOOL)hasDebugInfo
{
  return self->_debugInfo != 0;
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
  v8.super_class = (Class)CLPLOGENTRYVISIONVLLocalizationResult;
  -[CLPLOGENTRYVISIONVLLocalizationResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLOGENTRYVISIONVLLocalizationResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  CLPLOGENTRYVISIONTimeStamp *timestamp;
  void *v6;
  CLPLOGENTRYVISIONVLLocation *location;
  void *v8;
  CLPLOGENTRYVISIONSimdDoubleMxN *transform;
  void *v10;
  CLPLOGENTRYVISIONVLMatrixfMxN *covariance;
  void *v12;
  void *v13;
  CLPLOGENTRYVISIONVLLocalizationDebugInfo *debugInfo;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  if (timestamp)
  {
    -[CLPLOGENTRYVISIONTimeStamp dictionaryRepresentation](timestamp, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timestamp"));

  }
  location = self->_location;
  if (location)
  {
    -[CLPLOGENTRYVISIONVLLocation dictionaryRepresentation](location, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("location"));

  }
  transform = self->_transform;
  if (transform)
  {
    -[CLPLOGENTRYVISIONSimdDoubleMxN dictionaryRepresentation](transform, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("transform"));

  }
  covariance = self->_covariance;
  if (covariance)
  {
    -[CLPLOGENTRYVISIONVLMatrixfMxN dictionaryRepresentation](covariance, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("covariance"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v4 = self->_confidence;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("confidence"));

  }
  debugInfo = self->_debugInfo;
  if (debugInfo)
  {
    -[CLPLOGENTRYVISIONVLLocalizationDebugInfo dictionaryRepresentation](debugInfo, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("debug_info"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVLLocalizationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_timestamp)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_transform)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_covariance)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_debugInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_timestamp)
  {
    objc_msgSend(v4, "setTimestamp:");
    v4 = v5;
  }
  if (self->_location)
  {
    objc_msgSend(v5, "setLocation:");
    v4 = v5;
  }
  if (self->_transform)
  {
    objc_msgSend(v5, "setTransform:");
    v4 = v5;
  }
  if (self->_covariance)
  {
    objc_msgSend(v5, "setCovariance:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = LODWORD(self->_confidence);
    *((_BYTE *)v4 + 56) |= 1u;
  }
  if (self->_debugInfo)
  {
    objc_msgSend(v5, "setDebugInfo:");
    v4 = v5;
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
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CLPLOGENTRYVISIONTimeStamp copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[CLPLOGENTRYVISIONVLLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[CLPLOGENTRYVISIONSimdDoubleMxN copyWithZone:](self->_transform, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[CLPLOGENTRYVISIONVLMatrixfMxN copyWithZone:](self->_covariance, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)(v5 + 8) = self->_confidence;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v14 = -[CLPLOGENTRYVISIONVLLocalizationDebugInfo copyWithZone:](self->_debugInfo, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CLPLOGENTRYVISIONTimeStamp *timestamp;
  CLPLOGENTRYVISIONVLLocation *location;
  CLPLOGENTRYVISIONSimdDoubleMxN *transform;
  CLPLOGENTRYVISIONVLMatrixfMxN *covariance;
  CLPLOGENTRYVISIONVLLocalizationDebugInfo *debugInfo;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  timestamp = self->_timestamp;
  if ((unint64_t)timestamp | *((_QWORD *)v4 + 5))
  {
    if (!-[CLPLOGENTRYVISIONTimeStamp isEqual:](timestamp, "isEqual:"))
      goto LABEL_17;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 4))
  {
    if (!-[CLPLOGENTRYVISIONVLLocation isEqual:](location, "isEqual:"))
      goto LABEL_17;
  }
  transform = self->_transform;
  if ((unint64_t)transform | *((_QWORD *)v4 + 6))
  {
    if (!-[CLPLOGENTRYVISIONSimdDoubleMxN isEqual:](transform, "isEqual:"))
      goto LABEL_17;
  }
  covariance = self->_covariance;
  if ((unint64_t)covariance | *((_QWORD *)v4 + 2))
  {
    if (!-[CLPLOGENTRYVISIONVLMatrixfMxN isEqual:](covariance, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_confidence != *((float *)v4 + 2))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  debugInfo = self->_debugInfo;
  if ((unint64_t)debugInfo | *((_QWORD *)v4 + 3))
    v10 = -[CLPLOGENTRYVISIONVLLocalizationDebugInfo isEqual:](debugInfo, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  float confidence;
  float v9;
  float v10;
  float v11;

  v3 = -[CLPLOGENTRYVISIONTimeStamp hash](self->_timestamp, "hash");
  v4 = -[CLPLOGENTRYVISIONVLLocation hash](self->_location, "hash");
  v5 = -[CLPLOGENTRYVISIONSimdDoubleMxN hash](self->_transform, "hash");
  v6 = -[CLPLOGENTRYVISIONVLMatrixfMxN hash](self->_covariance, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    confidence = self->_confidence;
    v9 = -confidence;
    if (confidence >= 0.0)
      v9 = self->_confidence;
    v10 = floorf(v9 + 0.5);
    v11 = (float)(v9 - v10) * 1.8447e19;
    v7 = 2654435761u * (unint64_t)fmodf(v10, 1.8447e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabsf(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[CLPLOGENTRYVISIONVLLocalizationDebugInfo hash](self->_debugInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CLPLOGENTRYVISIONTimeStamp *timestamp;
  uint64_t v6;
  CLPLOGENTRYVISIONVLLocation *location;
  uint64_t v8;
  CLPLOGENTRYVISIONSimdDoubleMxN *transform;
  uint64_t v10;
  CLPLOGENTRYVISIONVLMatrixfMxN *covariance;
  uint64_t v12;
  CLPLOGENTRYVISIONVLLocalizationDebugInfo *debugInfo;
  uint64_t v14;
  id v15;

  v4 = a3;
  timestamp = self->_timestamp;
  v6 = *((_QWORD *)v4 + 5);
  v15 = v4;
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
    -[CLPLOGENTRYVISIONVLLocalizationResult setTimestamp:](self, "setTimestamp:");
  }
  v4 = v15;
LABEL_7:
  location = self->_location;
  v8 = *((_QWORD *)v4 + 4);
  if (location)
  {
    if (!v8)
      goto LABEL_13;
    -[CLPLOGENTRYVISIONVLLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[CLPLOGENTRYVISIONVLLocalizationResult setLocation:](self, "setLocation:");
  }
  v4 = v15;
LABEL_13:
  transform = self->_transform;
  v10 = *((_QWORD *)v4 + 6);
  if (transform)
  {
    if (!v10)
      goto LABEL_19;
    -[CLPLOGENTRYVISIONSimdDoubleMxN mergeFrom:](transform, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[CLPLOGENTRYVISIONVLLocalizationResult setTransform:](self, "setTransform:");
  }
  v4 = v15;
LABEL_19:
  covariance = self->_covariance;
  v12 = *((_QWORD *)v4 + 2);
  if (covariance)
  {
    if (!v12)
      goto LABEL_25;
    -[CLPLOGENTRYVISIONVLMatrixfMxN mergeFrom:](covariance, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_25;
    -[CLPLOGENTRYVISIONVLLocalizationResult setCovariance:](self, "setCovariance:");
  }
  v4 = v15;
LABEL_25:
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_confidence = *((float *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  debugInfo = self->_debugInfo;
  v14 = *((_QWORD *)v4 + 3);
  if (debugInfo)
  {
    if (v14)
    {
      -[CLPLOGENTRYVISIONVLLocalizationDebugInfo mergeFrom:](debugInfo, "mergeFrom:");
LABEL_32:
      v4 = v15;
    }
  }
  else if (v14)
  {
    -[CLPLOGENTRYVISIONVLLocalizationResult setDebugInfo:](self, "setDebugInfo:");
    goto LABEL_32;
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

- (CLPLOGENTRYVISIONVLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (CLPLOGENTRYVISIONSimdDoubleMxN)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
  objc_storeStrong((id *)&self->_transform, a3);
}

- (CLPLOGENTRYVISIONVLMatrixfMxN)covariance
{
  return self->_covariance;
}

- (void)setCovariance:(id)a3
{
  objc_storeStrong((id *)&self->_covariance, a3);
}

- (float)confidence
{
  return self->_confidence;
}

- (CLPLOGENTRYVISIONVLLocalizationDebugInfo)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transform, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_covariance, 0);
}

@end
