@implementation NMSMediaSyncServiceKeepLocalResponse

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NMSMediaSyncServiceKeepLocalResponse;
  -[NMSMediaSyncServiceKeepLocalResponse dealloc](&v3, sel_dealloc);
}

- (int)errorCode
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_errorCode;
  else
    return 0;
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)errorCodeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Generic");
  if (a3 == 1)
  {
    v3 = CFSTR("ValidatorException");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsErrorCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Generic")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ValidatorException"));

  return v4;
}

- (unint64_t)validatorExceptionsCount
{
  return self->_validatorExceptions.count;
}

- (int)validatorExceptions
{
  return self->_validatorExceptions.list;
}

- (void)clearValidatorExceptions
{
  PBRepeatedInt32Clear();
}

- (void)addValidatorException:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)validatorExceptionAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_validatorExceptions;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_validatorExceptions = &self->_validatorExceptions;
  count = self->_validatorExceptions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_validatorExceptions->list[a3];
}

- (void)setValidatorExceptions:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)validatorExceptionsAsString:(int)a3
{
  if ((a3 - 1) < 6)
    return off_24D646F60[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsValidatorExceptions:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExceedsPowerThreshold")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExceedsCellularPowerThreshold")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CellularDownloadNotAllowed")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoNetwork")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoStorage")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CellularDataNotAllowed")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 1;
  }

  return v4;
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
  v8.super_class = (Class)NMSMediaSyncServiceKeepLocalResponse;
  -[NMSMediaSyncServiceKeepLocalResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncServiceKeepLocalResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int errorCode;
  __CFString *v5;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_validatorExceptions;
  void *v7;
  unint64_t v8;
  unsigned int v9;
  __CFString *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    errorCode = self->_errorCode;
    if (errorCode)
    {
      if (errorCode == 1)
      {
        v5 = CFSTR("ValidatorException");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_errorCode);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("Generic");
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("errorCode"));

  }
  p_validatorExceptions = &self->_validatorExceptions;
  if (self->_validatorExceptions.count)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (p_validatorExceptions->count)
    {
      v8 = 0;
      do
      {
        v9 = p_validatorExceptions->list[v8] - 1;
        if (v9 >= 6)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), p_validatorExceptions->list[v8]);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = off_24D646F60[v9];
        }
        objc_msgSend(v7, "addObject:", v10);

        ++v8;
      }
      while (v8 < p_validatorExceptions->count);
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("validatorException"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NMSMediaSyncServiceKeepLocalResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_validatorExceptions;
  unint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  p_validatorExceptions = &self->_validatorExceptions;
  if (p_validatorExceptions->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v7;
      ++v6;
    }
    while (v6 < p_validatorExceptions->count);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  id v8;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[8] = self->_errorCode;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  v8 = v4;
  if (-[NMSMediaSyncServiceKeepLocalResponse validatorExceptionsCount](self, "validatorExceptionsCount"))
  {
    objc_msgSend(v8, "clearValidatorExceptions");
    v5 = -[NMSMediaSyncServiceKeepLocalResponse validatorExceptionsCount](self, "validatorExceptionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v8, "addValidatorException:", -[NMSMediaSyncServiceKeepLocalResponse validatorExceptionAtIndex:](self, "validatorExceptionAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v4 + 32) = self->_errorCode;
    *(_BYTE *)(v4 + 36) |= 1u;
  }
  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 8))
      goto LABEL_8;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_8:
    IsEqual = 0;
    goto LABEL_9;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_errorCode;
  else
    v2 = 0;
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;

  v4 = a3;
  if ((v4[9] & 1) != 0)
  {
    self->_errorCode = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  v8 = v4;
  v5 = objc_msgSend(v4, "validatorExceptionsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[NMSMediaSyncServiceKeepLocalResponse addValidatorException:](self, "addValidatorException:", objc_msgSend(v8, "validatorExceptionAtIndex:", i));
  }

}

@end
