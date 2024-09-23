@implementation FCCFitnessPlusPlanPostNotificationRequestProtobuf

- (void)setForce:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_force = a3;
}

- (void)setHasForce:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasForce
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
  v8.super_class = (Class)FCCFitnessPlusPlanPostNotificationRequestProtobuf;
  -[FCCFitnessPlusPlanPostNotificationRequestProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCFitnessPlusPlanPostNotificationRequestProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *type;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  type = self->_type;
  if (type)
    objc_msgSend(v3, "setObject:forKey:", type, CFSTR("type"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_force);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("force"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCFitnessPlusPlanPostNotificationRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_type)
    -[FCCFitnessPlusPlanPostNotificationRequestProtobuf writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;

  v4 = a3;
  objc_msgSend(v4, "setType:", self->_type);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_force;
    v4[20] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_force;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *type;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  type = self->_type;
  if ((unint64_t)type | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](type, "isEqual:"))
      goto LABEL_6;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      v6 = 0;
      goto LABEL_7;
    }
    if (self->_force)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_6;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_6;
    }
    v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_type, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_force;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[FCCFitnessPlusPlanPostNotificationRequestProtobuf setType:](self, "setType:");
    v4 = v5;
  }
  if (v4[20])
  {
    self->_force = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (BOOL)force
{
  return self->_force;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[FCCFitnessPlusPlanPostNotificationRequestProtobuf writeTo:]", "FCCFitnessPlusPlanPostNotificationRequestProtobuf.m", 96, "nil != self->_type");
}

@end
