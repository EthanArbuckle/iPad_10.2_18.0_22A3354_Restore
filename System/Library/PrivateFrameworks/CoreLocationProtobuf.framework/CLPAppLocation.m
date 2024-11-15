@implementation CLPAppLocation

- (void)setAge:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_age = a3;
}

- (void)setHasAge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAge
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setServerHash:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasServerHash
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)routineMode
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_routineMode;
  else
    return -1;
}

- (void)setRoutineMode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_routineMode = a3;
}

- (void)setHasRoutineMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRoutineMode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)loiType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_loiType;
  else
    return -1;
}

- (void)setLoiType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_loiType = a3;
}

- (void)setHasLoiType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLoiType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)CLPAppLocation;
  -[CLPAppLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPAppLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *appBundleId;
  void *v6;
  void *v7;
  CLPLocation *location;
  void *v9;
  char has;
  void *v11;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  appBundleId = self->_appBundleId;
  if (appBundleId)
    objc_msgSend(v3, "setObject:forKey:", appBundleId, CFSTR("appBundleId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_appState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("appState"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_age);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("age"));

  }
  location = self->_location;
  if (location)
  {
    -[CLPLocation dictionaryRepresentation](location, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("location"));

  }
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_routineMode);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("routineMode"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_serverHash);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("serverHash"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 2) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_loiType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("loiType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPAppLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->_appBundleId)
    -[CLPAppLocation writeTo:].cold.1();
  v7 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (!self->_location)
    -[CLPAppLocation writeTo:].cold.2();
  PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }

}

- (void)copyTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setAppBundleId:", self->_appBundleId);
  *((_DWORD *)v5 + 6) = self->_appState;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_age;
    *((_BYTE *)v5 + 52) |= 1u;
  }
  objc_msgSend(v5, "setLocation:", self->_location);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *((_DWORD *)v5 + 11) = self->_routineMode;
    *((_BYTE *)v5 + 52) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_DWORD *)v5 + 12) = self->_serverHash;
  *((_BYTE *)v5 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 10) = self->_loiType;
    *((_BYTE *)v5 + 52) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 24) = self->_appState;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_age;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v8 = -[CLPLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v5 + 44) = self->_routineMode;
    *(_BYTE *)(v5 + 52) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v5;
    goto LABEL_6;
  }
  *(_DWORD *)(v5 + 48) = self->_serverHash;
  *(_BYTE *)(v5 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 40) = self->_loiType;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *appBundleId;
  char has;
  CLPLocation *location;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:"))
      goto LABEL_27;
  }
  if (self->_appState != *((_DWORD *)v4 + 6))
    goto LABEL_27;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_age != *((double *)v4 + 1))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_27;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 4))
  {
    if (!-[CLPLocation isEqual:](location, "isEqual:"))
    {
LABEL_27:
      v8 = 0;
      goto LABEL_28;
    }
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0 || self->_serverHash != *((_DWORD *)v4 + 12))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_routineMode != *((_DWORD *)v4 + 11))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_27;
  }
  v8 = (*((_BYTE *)v4 + 52) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_loiType != *((_DWORD *)v4 + 10))
      goto LABEL_27;
    v8 = 1;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t appState;
  unint64_t v5;
  double age;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[NSString hash](self->_appBundleId, "hash");
  appState = self->_appState;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    age = self->_age;
    v7 = -age;
    if (age >= 0.0)
      v7 = self->_age;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = -[CLPLocation hash](self->_location, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_11;
LABEL_14:
    v12 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_12;
LABEL_15:
    v13 = 0;
    return (2654435761 * appState) ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  v11 = 2654435761 * self->_serverHash;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_11:
  v12 = 2654435761 * self->_routineMode;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_15;
LABEL_12:
  v13 = 2654435761 * self->_loiType;
  return (2654435761 * appState) ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CLPLocation *location;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[CLPAppLocation setAppBundleId:](self, "setAppBundleId:");
    v4 = v8;
  }
  self->_appState = *((_DWORD *)v4 + 6);
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_age = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  location = self->_location;
  v6 = *((_QWORD *)v4 + 4);
  if (location)
  {
    if (!v6)
      goto LABEL_11;
    -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[CLPAppLocation setLocation:](self, "setLocation:");
  }
  v4 = v8;
LABEL_11:
  v7 = *((_BYTE *)v4 + 52);
  if ((v7 & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0)
      goto LABEL_13;
LABEL_17:
    self->_routineMode = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 52) & 2) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  self->_serverHash = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 8u;
  v7 = *((_BYTE *)v4 + 52);
  if ((v7 & 4) != 0)
    goto LABEL_17;
LABEL_13:
  if ((v7 & 2) != 0)
  {
LABEL_14:
    self->_loiType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_15:

}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

- (int)appState
{
  return self->_appState;
}

- (void)setAppState:(int)a3
{
  self->_appState = a3;
}

- (double)age
{
  return self->_age;
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (int)serverHash
{
  return self->_serverHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPAppLocation writeTo:]", "CLPCollectionRequest.gen.m", 1434, "nil != self->_appBundleId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CLPAppLocation writeTo:]", "CLPCollectionRequest.gen.m", 1450, "self->_location != nil");
}

@end
