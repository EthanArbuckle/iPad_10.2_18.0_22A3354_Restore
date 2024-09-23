@implementation MTPBAlarm

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTPBAlarm;
  -[MTPBAlarm description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPBAlarm dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MTPBAlarmProperties *alarmProperties;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  alarmProperties = self->_alarmProperties;
  if (alarmProperties)
  {
    -[MTPBAlarmProperties dictionaryRepresentation](alarmProperties, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("alarmProperties"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTPBAlarmReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setAlarmProperties:", self->_alarmProperties);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MTPBAlarmProperties copyWithZone:](self->_alarmProperties, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  MTPBAlarmProperties *alarmProperties;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    alarmProperties = self->_alarmProperties;
    if ((unint64_t)alarmProperties | v4[1])
      v6 = -[MTPBAlarmProperties isEqual:](alarmProperties, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[MTPBAlarmProperties hash](self->_alarmProperties, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  MTPBAlarmProperties *alarmProperties;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  alarmProperties = self->_alarmProperties;
  v6 = v4[1];
  if (alarmProperties)
  {
    if (v6)
    {
      v7 = v4;
      -[MTPBAlarmProperties mergeFrom:](alarmProperties, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[MTPBAlarm setAlarmProperties:](self, "setAlarmProperties:");
    goto LABEL_6;
  }

}

- (MTPBAlarmProperties)alarmProperties
{
  return self->_alarmProperties;
}

- (void)setAlarmProperties:(id)a3
{
  objc_storeStrong((id *)&self->_alarmProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmProperties, 0);
}

@end
