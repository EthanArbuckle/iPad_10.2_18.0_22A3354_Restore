@implementation MTPBAlarmAdd

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTPBAlarmAdd;
  -[MTPBAlarmAdd description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPBAlarmAdd dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MTPBAlarm *alarm;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  alarm = self->_alarm;
  if (alarm)
  {
    -[MTPBAlarm dictionaryRepresentation](alarm, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("alarm"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTPBAlarmAddReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setAlarm:", self->_alarm);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MTPBAlarm copyWithZone:](self->_alarm, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  MTPBAlarm *alarm;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    alarm = self->_alarm;
    if ((unint64_t)alarm | v4[1])
      v6 = -[MTPBAlarm isEqual:](alarm, "isEqual:");
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
  return -[MTPBAlarm hash](self->_alarm, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  MTPBAlarm *alarm;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  alarm = self->_alarm;
  v6 = v4[1];
  if (alarm)
  {
    if (v6)
    {
      v7 = v4;
      -[MTPBAlarm mergeFrom:](alarm, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[MTPBAlarmAdd setAlarm:](self, "setAlarm:");
    goto LABEL_6;
  }

}

- (MTPBAlarm)alarm
{
  return self->_alarm;
}

- (void)setAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_alarm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarm, 0);
}

@end
