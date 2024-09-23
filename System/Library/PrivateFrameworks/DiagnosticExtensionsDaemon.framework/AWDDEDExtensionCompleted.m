@implementation AWDDEDExtensionCompleted

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasExtension
{
  return self->_extension != 0;
}

- (void)setNumfiles:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numfiles = a3;
}

- (void)setHasNumfiles:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumfiles
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumbytes:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numbytes = a3;
}

- (void)setHasNumbytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumbytes
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)error
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_error;
  else
    return 0;
}

- (void)setError:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasError
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)errorAsString:(int)a3
{
  if (a3 < 4)
    return off_24D1E65A0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsError:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEDCollectErrorNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEDCollectErrorNoSpace")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEDCollectErrorNoExtension")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DEDCollectErrorNoFiles")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
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
  v8.super_class = (Class)AWDDEDExtensionCompleted;
  -[AWDDEDExtensionCompleted description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDDEDExtensionCompleted dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *extension;
  char has;
  void *v7;
  void *v9;
  void *v10;
  uint64_t error;
  __CFString *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  extension = self->_extension;
  if (extension)
    objc_msgSend(v3, "setObject:forKey:", extension, CFSTR("extension"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numfiles);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("numfiles"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
LABEL_13:
      error = self->_error;
      if (error >= 4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_error);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_24D1E65A0[error];
      }
      objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("error"));

      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_9;
      return v3;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numbytes);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("numbytes"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 1) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("duration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDDEDExtensionCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_extension)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
LABEL_13:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 1) != 0)
LABEL_9:
    PBDataWriterWriteUint64Field();
LABEL_10:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[4] = self->_timestamp;
    *((_BYTE *)v4 + 56) |= 8u;
  }
  if (self->_extension)
  {
    v6 = v4;
    objc_msgSend(v4, "setExtension:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_numfiles;
    *((_BYTE *)v4 + 56) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
LABEL_13:
      *((_DWORD *)v4 + 10) = self->_error;
      *((_BYTE *)v4 + 56) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v4[2] = self->_numbytes;
  *((_BYTE *)v4 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 1) != 0)
  {
LABEL_9:
    v4[1] = self->_duration;
    *((_BYTE *)v4 + 56) |= 1u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 8u;
  }
  v7 = -[NSString copyWithZone:](self->_extension, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v7;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v6 + 24) = self->_numfiles;
    *(_BYTE *)(v6 + 56) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
LABEL_11:
      *(_DWORD *)(v6 + 40) = self->_error;
      *(_BYTE *)(v6 + 56) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        return (id)v6;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 16) = self->_numbytes;
  *(_BYTE *)(v6 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    *(_QWORD *)(v6 + 8) = self->_duration;
    *(_BYTE *)(v6 + 56) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *extension;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_timestamp != *((_QWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_29;
  }
  extension = self->_extension;
  if ((unint64_t)extension | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](extension, "isEqual:"))
    {
LABEL_29:
      v7 = 0;
      goto LABEL_30;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_numfiles != *((_QWORD *)v4 + 3))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_numbytes != *((_QWORD *)v4 + 2))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_error != *((_DWORD *)v4 + 10))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_29;
  }
  v7 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_duration != *((_QWORD *)v4 + 1))
      goto LABEL_29;
    v7 = 1;
  }
LABEL_30:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 8) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_extension, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761u * self->_numfiles;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      v6 = 2654435761u * self->_numbytes;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_7;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_8;
LABEL_12:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = 2654435761 * self->_error;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_8:
  v8 = 2654435761u * self->_duration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    v6 = v4;
    -[AWDDEDExtensionCompleted setExtension:](self, "setExtension:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 4) != 0)
  {
    self->_numfiles = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0)
        goto LABEL_8;
LABEL_13:
      self->_error = *((_DWORD *)v4 + 10);
      *(_BYTE *)&self->_has |= 0x10u;
      if ((*((_BYTE *)v4 + 56) & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_numbytes = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 0x10) != 0)
    goto LABEL_13;
LABEL_8:
  if ((v5 & 1) != 0)
  {
LABEL_9:
    self->_duration = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_10:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (unint64_t)numfiles
{
  return self->_numfiles;
}

- (unint64_t)numbytes
{
  return self->_numbytes;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
