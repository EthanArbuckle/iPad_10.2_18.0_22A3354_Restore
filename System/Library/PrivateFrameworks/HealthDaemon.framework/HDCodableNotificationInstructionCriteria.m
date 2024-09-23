@implementation HDCodableNotificationInstructionCriteria

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasUUIDString
{
  return self->_uUIDString != 0;
}

- (void)setModificationTimeInterval:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_modificationTimeInterval = a3;
}

- (void)setHasModificationTimeInterval:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModificationTimeInterval
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)HDCodableNotificationInstructionCriteria;
  -[HDCodableNotificationInstructionCriteria description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNotificationInstructionCriteria dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *uUIDString;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  uUIDString = self->_uUIDString;
  if (uUIDString)
    objc_msgSend(v4, "setObject:forKey:", uUIDString, CFSTR("UUIDString"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_modificationTimeInterval);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("modificationTimeInterval"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNotificationInstructionCriteriaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_uUIDString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v5;
  }
  if (self->_uUIDString)
  {
    objc_msgSend(v5, "setUUIDString:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_modificationTimeInterval;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_uUIDString, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_modificationTimeInterval;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *uUIDString;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_10;
  }
  uUIDString = self->_uUIDString;
  if ((unint64_t)uUIDString | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](uUIDString, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_modificationTimeInterval == *((double *)v4 + 1))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  double modificationTimeInterval;
  double v7;
  long double v8;
  double v9;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_uUIDString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    modificationTimeInterval = self->_modificationTimeInterval;
    v7 = -modificationTimeInterval;
    if (modificationTimeInterval >= 0.0)
      v7 = self->_modificationTimeInterval;
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
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[HDCodableNotificationInstructionCriteria setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableNotificationInstructionCriteria setUUIDString:](self, "setUUIDString:");
    v4 = v5;
  }
  if (((_BYTE)v4[4] & 1) != 0)
  {
    self->_modificationTimeInterval = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)uUIDString
{
  return self->_uUIDString;
}

- (void)setUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_uUIDString, a3);
}

- (double)modificationTimeInterval
{
  return self->_modificationTimeInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uUIDString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
