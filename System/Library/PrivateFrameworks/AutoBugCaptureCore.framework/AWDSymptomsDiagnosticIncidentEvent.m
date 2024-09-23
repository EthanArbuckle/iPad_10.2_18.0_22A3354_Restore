@implementation AWDSymptomsDiagnosticIncidentEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("Trigger");
  if (a3 == 2)
  {
    v3 = CFSTR("Action");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Trigger")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Action")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setValue:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_status;
  else
    return 1;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)statusAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1EA3B4C80[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Success")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fail")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Undetermined")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)state
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_state;
  else
    return 1;
}

- (void)setState:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)stateAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("Started");
  if (a3 == 2)
  {
    v3 = CFSTR("Ended");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Started")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Ended")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)hasDetectedName
{
  return self->_detectedName != 0;
}

- (BOOL)hasEffectiveName
{
  return self->_effectiveName != 0;
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
  v8.super_class = (Class)AWDSymptomsDiagnosticIncidentEvent;
  -[AWDSymptomsDiagnosticIncidentEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDSymptomsDiagnosticIncidentEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  int type;
  __CFString *v7;
  NSString *name;
  char v9;
  void *v10;
  unsigned int v11;
  __CFString *v12;
  int state;
  __CFString *v14;
  NSString *detectedName;
  NSString *effectiveName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    type = self->_type;
    if (type == 1)
    {
      v7 = CFSTR("Trigger");
    }
    else if (type == 2)
    {
      v7 = CFSTR("Action");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("type"));

  }
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  v9 = (char)self->_has;
  if ((v9 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_value);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("value"));

    v9 = (char)self->_has;
    if ((v9 & 8) == 0)
    {
LABEL_14:
      if ((v9 & 4) == 0)
        goto LABEL_27;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  v11 = self->_status - 1;
  if (v11 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1EA3B4C80[v11];
  }
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("status"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_21:
    state = self->_state;
    if (state == 1)
    {
      v14 = CFSTR("Started");
    }
    else if (state == 2)
    {
      v14 = CFSTR("Ended");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_state);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("state"));

  }
LABEL_27:
  detectedName = self->_detectedName;
  if (detectedName)
    objc_msgSend(v3, "setObject:forKey:", detectedName, CFSTR("detectedName"));
  effectiveName = self->_effectiveName;
  if (effectiveName)
    objc_msgSend(v3, "setObject:forKey:", effectiveName, CFSTR("effectiveName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSymptomsDiagnosticIncidentEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v7;
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_11:
  if (self->_detectedName)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_effectiveName)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 60) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_type;
    *((_BYTE *)v4 + 60) |= 0x10u;
  }
  v7 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    v4[2] = self->_value;
    *((_BYTE *)v4 + 60) |= 2u;
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 13) = self->_status;
  *((_BYTE *)v4 + 60) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 12) = self->_state;
    *((_BYTE *)v4 + 60) |= 4u;
  }
LABEL_11:
  if (self->_detectedName)
  {
    objc_msgSend(v7, "setDetectedName:");
    v4 = v7;
  }
  if (self->_effectiveName)
  {
    objc_msgSend(v7, "setEffectiveName:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 60) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(_BYTE *)(v5 + 60) |= 0x10u;
  }
  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  v10 = (char)self->_has;
  if ((v10 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
LABEL_11:
    *(_DWORD *)(v6 + 52) = self->_status;
    *(_BYTE *)(v6 + 60) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_QWORD *)(v6 + 16) = self->_value;
  *(_BYTE *)(v6 + 60) |= 2u;
  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v10 & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 48) = self->_state;
    *(_BYTE *)(v6 + 60) |= 4u;
  }
LABEL_9:
  v11 = -[NSString copyWithZone:](self->_detectedName, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v11;

  v13 = -[NSString copyWithZone:](self->_effectiveName, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v13;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *name;
  NSString *detectedName;
  NSString *effectiveName;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 14))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
    {
LABEL_34:
      v9 = 0;
      goto LABEL_35;
    }
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_value != *((_QWORD *)v4 + 2))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_status != *((_DWORD *)v4 + 13))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_state != *((_DWORD *)v4 + 12))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_34;
  }
  detectedName = self->_detectedName;
  if ((unint64_t)detectedName | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](detectedName, "isEqual:"))
  {
    goto LABEL_34;
  }
  effectiveName = self->_effectiveName;
  if ((unint64_t)effectiveName | *((_QWORD *)v4 + 4))
    v9 = -[NSString isEqual:](effectiveName, "isEqual:");
  else
    v9 = 1;
LABEL_35:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSUInteger v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_11:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  v6 = 2654435761u * self->_value;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_8:
  v7 = 2654435761 * self->_status;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_9:
  v8 = 2654435761 * self->_state;
LABEL_13:
  v9 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
  v10 = -[NSString hash](self->_detectedName, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_effectiveName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 60);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_type = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[AWDSymptomsDiagnosticIncidentEvent setName:](self, "setName:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 2) != 0)
  {
    self->_value = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 60);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_status = *((_DWORD *)v4 + 13);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
LABEL_10:
    self->_state = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 3))
  {
    -[AWDSymptomsDiagnosticIncidentEvent setDetectedName:](self, "setDetectedName:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[AWDSymptomsDiagnosticIncidentEvent setEffectiveName:](self, "setEffectiveName:");
    v4 = v7;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)value
{
  return self->_value;
}

- (NSString)detectedName
{
  return self->_detectedName;
}

- (void)setDetectedName:(id)a3
{
  objc_storeStrong((id *)&self->_detectedName, a3);
}

- (NSString)effectiveName
{
  return self->_effectiveName;
}

- (void)setEffectiveName:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_effectiveName, 0);
  objc_storeStrong((id *)&self->_detectedName, 0);
}

@end
