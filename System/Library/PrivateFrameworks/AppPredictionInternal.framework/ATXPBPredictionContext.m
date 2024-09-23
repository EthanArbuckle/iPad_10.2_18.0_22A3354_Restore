@implementation ATXPBPredictionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_timeContext, 0);
  objc_storeStrong((id *)&self->_locationMotionContext, 0);
  objc_storeStrong((id *)&self->_deviceStateContext, 0);
  objc_storeStrong((id *)&self->_ambientLightContext, 0);
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPredictionContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (ATXPBPredictionUserContext)userContext
{
  return self->_userContext;
}

- (ATXPBPredictionTimeContext)timeContext
{
  return self->_timeContext;
}

- (ATXPBPredictionLocationMotionContext)locationMotionContext
{
  return self->_locationMotionContext;
}

- (BOOL)isOverridden
{
  return self->_isOverridden;
}

- (ATXPBPredictionDeviceStateContext)deviceStateContext
{
  return self->_deviceStateContext;
}

- (ATXPBPredictionAmbientLightContext)ambientLightContext
{
  return self->_ambientLightContext;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_userContext, a3);
}

- (void)setTimeContext:(id)a3
{
  objc_storeStrong((id *)&self->_timeContext, a3);
}

- (void)setLocationMotionContext:(id)a3
{
  objc_storeStrong((id *)&self->_locationMotionContext, a3);
}

- (void)setIsOverridden:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isOverridden = a3;
}

- (void)setDeviceStateContext:(id)a3
{
  objc_storeStrong((id *)&self->_deviceStateContext, a3);
}

- (void)setAmbientLightContext:(id)a3
{
  objc_storeStrong((id *)&self->_ambientLightContext, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_deviceStateContext)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_timeContext)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_locationMotionContext)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_ambientLightContext)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userContext)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)setHasIsOverridden:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsOverridden
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDeviceStateContext
{
  return self->_deviceStateContext != 0;
}

- (BOOL)hasTimeContext
{
  return self->_timeContext != 0;
}

- (BOOL)hasLocationMotionContext
{
  return self->_locationMotionContext != 0;
}

- (BOOL)hasAmbientLightContext
{
  return self->_ambientLightContext != 0;
}

- (BOOL)hasUserContext
{
  return self->_userContext != 0;
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
  v8.super_class = (Class)ATXPBPredictionContext;
  -[ATXPBPredictionContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBPredictionContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  ATXPBPredictionDeviceStateContext *deviceStateContext;
  void *v6;
  ATXPBPredictionTimeContext *timeContext;
  void *v8;
  ATXPBPredictionLocationMotionContext *locationMotionContext;
  void *v10;
  ATXPBPredictionAmbientLightContext *ambientLightContext;
  void *v12;
  ATXPBPredictionUserContext *userContext;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isOverridden);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("isOverridden"));

  }
  deviceStateContext = self->_deviceStateContext;
  if (deviceStateContext)
  {
    -[ATXPBPredictionDeviceStateContext dictionaryRepresentation](deviceStateContext, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("deviceStateContext"));

  }
  timeContext = self->_timeContext;
  if (timeContext)
  {
    -[ATXPBPredictionTimeContext dictionaryRepresentation](timeContext, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timeContext"));

  }
  locationMotionContext = self->_locationMotionContext;
  if (locationMotionContext)
  {
    -[ATXPBPredictionLocationMotionContext dictionaryRepresentation](locationMotionContext, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("locationMotionContext"));

  }
  ambientLightContext = self->_ambientLightContext;
  if (ambientLightContext)
  {
    -[ATXPBPredictionAmbientLightContext dictionaryRepresentation](ambientLightContext, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("ambientLightContext"));

  }
  userContext = self->_userContext;
  if (userContext)
  {
    -[ATXPBPredictionUserContext dictionaryRepresentation](userContext, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("userContext"));

  }
  return v3;
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[48] = self->_isOverridden;
    v4[52] |= 1u;
  }
  v5 = v4;
  if (self->_deviceStateContext)
  {
    objc_msgSend(v4, "setDeviceStateContext:");
    v4 = v5;
  }
  if (self->_timeContext)
  {
    objc_msgSend(v5, "setTimeContext:");
    v4 = v5;
  }
  if (self->_locationMotionContext)
  {
    objc_msgSend(v5, "setLocationMotionContext:");
    v4 = v5;
  }
  if (self->_ambientLightContext)
  {
    objc_msgSend(v5, "setAmbientLightContext:");
    v4 = v5;
  }
  if (self->_userContext)
  {
    objc_msgSend(v5, "setUserContext:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_isOverridden;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v7 = -[ATXPBPredictionDeviceStateContext copyWithZone:](self->_deviceStateContext, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[ATXPBPredictionTimeContext copyWithZone:](self->_timeContext, "copyWithZone:", a3);
  v10 = (void *)v6[4];
  v6[4] = v9;

  v11 = -[ATXPBPredictionLocationMotionContext copyWithZone:](self->_locationMotionContext, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  v13 = -[ATXPBPredictionAmbientLightContext copyWithZone:](self->_ambientLightContext, "copyWithZone:", a3);
  v14 = (void *)v6[1];
  v6[1] = v13;

  v15 = -[ATXPBPredictionUserContext copyWithZone:](self->_userContext, "copyWithZone:", a3);
  v16 = (void *)v6[5];
  v6[5] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ATXPBPredictionDeviceStateContext *deviceStateContext;
  ATXPBPredictionTimeContext *timeContext;
  ATXPBPredictionLocationMotionContext *locationMotionContext;
  ATXPBPredictionAmbientLightContext *ambientLightContext;
  ATXPBPredictionUserContext *userContext;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) != 0)
    {
      if (self->_isOverridden)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_20;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_10;
    }
LABEL_20:
    v10 = 0;
    goto LABEL_21;
  }
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
    goto LABEL_20;
LABEL_10:
  deviceStateContext = self->_deviceStateContext;
  if ((unint64_t)deviceStateContext | *((_QWORD *)v4 + 2)
    && !-[ATXPBPredictionDeviceStateContext isEqual:](deviceStateContext, "isEqual:"))
  {
    goto LABEL_20;
  }
  timeContext = self->_timeContext;
  if ((unint64_t)timeContext | *((_QWORD *)v4 + 4))
  {
    if (!-[ATXPBPredictionTimeContext isEqual:](timeContext, "isEqual:"))
      goto LABEL_20;
  }
  locationMotionContext = self->_locationMotionContext;
  if ((unint64_t)locationMotionContext | *((_QWORD *)v4 + 3))
  {
    if (!-[ATXPBPredictionLocationMotionContext isEqual:](locationMotionContext, "isEqual:"))
      goto LABEL_20;
  }
  ambientLightContext = self->_ambientLightContext;
  if ((unint64_t)ambientLightContext | *((_QWORD *)v4 + 1))
  {
    if (!-[ATXPBPredictionAmbientLightContext isEqual:](ambientLightContext, "isEqual:"))
      goto LABEL_20;
  }
  userContext = self->_userContext;
  if ((unint64_t)userContext | *((_QWORD *)v4 + 5))
    v10 = -[ATXPBPredictionUserContext isEqual:](userContext, "isEqual:");
  else
    v10 = 1;
LABEL_21:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_isOverridden;
  else
    v3 = 0;
  v4 = -[ATXPBPredictionDeviceStateContext hash](self->_deviceStateContext, "hash") ^ v3;
  v5 = -[ATXPBPredictionTimeContext hash](self->_timeContext, "hash");
  v6 = v4 ^ v5 ^ -[ATXPBPredictionLocationMotionContext hash](self->_locationMotionContext, "hash");
  v7 = -[ATXPBPredictionAmbientLightContext hash](self->_ambientLightContext, "hash");
  return v6 ^ v7 ^ -[ATXPBPredictionUserContext hash](self->_userContext, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  ATXPBPredictionDeviceStateContext *deviceStateContext;
  uint64_t v7;
  ATXPBPredictionTimeContext *timeContext;
  uint64_t v9;
  ATXPBPredictionLocationMotionContext *locationMotionContext;
  uint64_t v11;
  ATXPBPredictionAmbientLightContext *ambientLightContext;
  uint64_t v13;
  ATXPBPredictionUserContext *userContext;
  uint64_t v15;
  _QWORD *v16;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_isOverridden = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 1u;
  }
  deviceStateContext = self->_deviceStateContext;
  v7 = v5[2];
  v16 = v5;
  if (deviceStateContext)
  {
    if (!v7)
      goto LABEL_9;
    -[ATXPBPredictionDeviceStateContext mergeFrom:](deviceStateContext, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[ATXPBPredictionContext setDeviceStateContext:](self, "setDeviceStateContext:");
  }
  v5 = v16;
LABEL_9:
  timeContext = self->_timeContext;
  v9 = v5[4];
  if (timeContext)
  {
    if (!v9)
      goto LABEL_15;
    -[ATXPBPredictionTimeContext mergeFrom:](timeContext, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[ATXPBPredictionContext setTimeContext:](self, "setTimeContext:");
  }
  v5 = v16;
LABEL_15:
  locationMotionContext = self->_locationMotionContext;
  v11 = v5[3];
  if (locationMotionContext)
  {
    if (!v11)
      goto LABEL_21;
    -[ATXPBPredictionLocationMotionContext mergeFrom:](locationMotionContext, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[ATXPBPredictionContext setLocationMotionContext:](self, "setLocationMotionContext:");
  }
  v5 = v16;
LABEL_21:
  ambientLightContext = self->_ambientLightContext;
  v13 = v5[1];
  if (ambientLightContext)
  {
    if (!v13)
      goto LABEL_27;
    -[ATXPBPredictionAmbientLightContext mergeFrom:](ambientLightContext, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    -[ATXPBPredictionContext setAmbientLightContext:](self, "setAmbientLightContext:");
  }
  v5 = v16;
LABEL_27:
  userContext = self->_userContext;
  v15 = v5[5];
  if (userContext)
  {
    if (v15)
    {
      -[ATXPBPredictionUserContext mergeFrom:](userContext, "mergeFrom:");
LABEL_32:
      v5 = v16;
    }
  }
  else if (v15)
  {
    -[ATXPBPredictionContext setUserContext:](self, "setUserContext:");
    goto LABEL_32;
  }

}

@end
