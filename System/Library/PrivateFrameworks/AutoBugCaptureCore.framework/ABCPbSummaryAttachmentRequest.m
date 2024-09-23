@implementation ABCPbSummaryAttachmentRequest

- (BOOL)hasFileName
{
  return self->_fileName != 0;
}

- (void)setFileSize:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fileSize = a3;
}

- (void)setHasFileSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFileSize
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
  v8.super_class = (Class)ABCPbSummaryAttachmentRequest;
  -[ABCPbSummaryAttachmentRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCPbSummaryAttachmentRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *fileName;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  fileName = self->_fileName;
  if (fileName)
    objc_msgSend(v3, "setObject:forKey:", fileName, CFSTR("file_name"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_fileSize);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("file_size"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSummaryAttachmentRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_fileName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_fileName)
  {
    v5 = v4;
    objc_msgSend(v4, "setFileName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_fileSize;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_fileName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_fileSize;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *fileName;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  fileName = self->_fileName;
  if ((unint64_t)fileName | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](fileName, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_fileSize == *((_DWORD *)v4 + 4))
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
  uint64_t v4;

  v3 = -[NSString hash](self->_fileName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_fileSize;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[ABCPbSummaryAttachmentRequest setFileName:](self, "setFileName:");
    v4 = v5;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_fileSize = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (unsigned)fileSize
{
  return self->_fileSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end
