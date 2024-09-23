@implementation SYLogMultiSuspendableQueueState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_target)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)setResumeCount:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_resumeCount = a3;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setHasResumeCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResumeCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasTarget
{
  return self->_target != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SYLogMultiSuspendableQueueState;
  -[SYLogMultiSuspendableQueueState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLogMultiSuspendableQueueState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *label;
  NSString *target;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_resumeCount);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("resumeCount"));

  }
  label = self->_label;
  if (label)
    objc_msgSend(v3, "setObject:forKey:", label, CFSTR("label"));
  target = self->_target;
  if (target)
    objc_msgSend(v3, "setObject:forKey:", target, CFSTR("target"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYLogMultiSuspendableQueueStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_resumeCount;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    v4 = v5;
  }
  if (self->_target)
  {
    objc_msgSend(v5, "setTarget:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_resumeCount;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSString copyWithZone:](self->_target, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *label;
  NSString *target;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_resumeCount != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](label, "isEqual:"))
    goto LABEL_11;
  target = self->_target;
  if ((unint64_t)target | *((_QWORD *)v4 + 3))
    v7 = -[NSString isEqual:](target, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_resumeCount;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_label, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_target, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[8] & 1) != 0)
  {
    self->_resumeCount = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[SYLogMultiSuspendableQueueState setLabel:](self, "setLabel:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[SYLogMultiSuspendableQueueState setTarget:](self, "setTarget:");
    v4 = v5;
  }

}

- (int)resumeCount
{
  return self->_resumeCount;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)target
{
  return self->_target;
}

@end
