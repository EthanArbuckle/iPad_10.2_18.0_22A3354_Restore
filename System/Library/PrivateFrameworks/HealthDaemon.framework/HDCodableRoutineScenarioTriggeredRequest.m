@implementation HDCodableRoutineScenarioTriggeredRequest

- (void)setTriggerTypes:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_triggerTypes = a3;
}

- (void)setHasTriggerTypes:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTriggerTypes
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCurrentLocation
{
  return self->_currentLocation != 0;
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
  v8.super_class = (Class)HDCodableRoutineScenarioTriggeredRequest;
  -[HDCodableRoutineScenarioTriggeredRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableRoutineScenarioTriggeredRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  HDCodableRoutineLocation *currentLocation;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_triggerTypes);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("triggerTypes"));

  }
  currentLocation = self->_currentLocation;
  if (currentLocation)
  {
    -[HDCodableRoutineLocation dictionaryRepresentation](currentLocation, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("currentLocation"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutineScenarioTriggeredRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_currentLocation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_triggerTypes;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_currentLocation)
  {
    v5 = v4;
    objc_msgSend(v4, "setCurrentLocation:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_triggerTypes;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[HDCodableRoutineLocation copyWithZone:](self->_currentLocation, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableRoutineLocation *currentLocation;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_triggerTypes != *((_QWORD *)v4 + 1))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  currentLocation = self->_currentLocation;
  if ((unint64_t)currentLocation | *((_QWORD *)v4 + 2))
    v6 = -[HDCodableRoutineLocation isEqual:](currentLocation, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_triggerTypes;
  else
    v2 = 0;
  return -[HDCodableRoutineLocation hash](self->_currentLocation, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  HDCodableRoutineLocation *currentLocation;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((v4[3] & 1) != 0)
  {
    self->_triggerTypes = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  currentLocation = self->_currentLocation;
  v7 = v5[2];
  if (currentLocation)
  {
    if (v7)
    {
      v8 = v5;
      -[HDCodableRoutineLocation mergeFrom:](currentLocation, "mergeFrom:");
LABEL_8:
      v5 = v8;
    }
  }
  else if (v7)
  {
    v8 = v5;
    -[HDCodableRoutineScenarioTriggeredRequest setCurrentLocation:](self, "setCurrentLocation:");
    goto LABEL_8;
  }

}

- (unint64_t)triggerTypes
{
  return self->_triggerTypes;
}

- (HDCodableRoutineLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);
}

@end
