@implementation NSSUpdateBetaEnrollmentStatusReqMsg

- (BOOL)hasBetaProgramInfo
{
  return self->_betaProgramInfo != 0;
}

- (void)setUnenroll:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_unenroll = a3;
}

- (void)setHasUnenroll:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUnenroll
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NSSUpdateBetaEnrollmentStatusReqMsg;
  -[NSSUpdateBetaEnrollmentStatusReqMsg description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSUpdateBetaEnrollmentStatusReqMsg dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *betaProgramInfo;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  betaProgramInfo = self->_betaProgramInfo;
  if (betaProgramInfo)
    objc_msgSend(v3, "setObject:forKey:", betaProgramInfo, CFSTR("betaProgramInfo"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_unenroll);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("unenroll"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUpdateBetaEnrollmentStatusReqMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_betaProgramInfo)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if (self->_betaProgramInfo)
  {
    v5 = v4;
    objc_msgSend(v4, "setBetaProgramInfo:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_unenroll;
    v4[20] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_betaProgramInfo, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_unenroll;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *betaProgramInfo;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  betaProgramInfo = self->_betaProgramInfo;
  if ((unint64_t)betaProgramInfo | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](betaProgramInfo, "isEqual:"))
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
    if (self->_unenroll)
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
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_betaProgramInfo, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_unenroll;
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
    -[NSSUpdateBetaEnrollmentStatusReqMsg setBetaProgramInfo:](self, "setBetaProgramInfo:");
    v4 = v5;
  }
  if (v4[20])
  {
    self->_unenroll = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)betaProgramInfo
{
  return self->_betaProgramInfo;
}

- (void)setBetaProgramInfo:(id)a3
{
  objc_storeStrong((id *)&self->_betaProgramInfo, a3);
}

- (BOOL)unenroll
{
  return self->_unenroll;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_betaProgramInfo, 0);
}

@end
