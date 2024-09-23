@implementation FCCCoalescingRuleProtobuf

- (BOOL)hasEventIdentifier
{
  return self->_eventIdentifier != 0;
}

- (void)setInterval:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_interval = a3;
}

- (void)setHasInterval:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInterval
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
  v8.super_class = (Class)FCCCoalescingRuleProtobuf;
  -[FCCCoalescingRuleProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCCoalescingRuleProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *eventIdentifier;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  eventIdentifier = self->_eventIdentifier;
  if (eventIdentifier)
    objc_msgSend(v3, "setObject:forKey:", eventIdentifier, CFSTR("eventIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_interval);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("interval"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCCoalescingRuleProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_eventIdentifier)
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
  if (self->_eventIdentifier)
  {
    v5 = v4;
    objc_msgSend(v4, "setEventIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_interval;
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_eventIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_interval;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *eventIdentifier;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  eventIdentifier = self->_eventIdentifier;
  if ((unint64_t)eventIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](eventIdentifier, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_interval == *((double *)v4 + 1))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double interval;
  double v6;
  long double v7;
  double v8;

  v3 = -[NSString hash](self->_eventIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    interval = self->_interval;
    v6 = -interval;
    if (interval >= 0.0)
      v6 = self->_interval;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[FCCCoalescingRuleProtobuf setEventIdentifier:](self, "setEventIdentifier:");
    v4 = v5;
  }
  if (((_BYTE)v4[3] & 1) != 0)
  {
    self->_interval = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eventIdentifier, a3);
}

- (double)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end
