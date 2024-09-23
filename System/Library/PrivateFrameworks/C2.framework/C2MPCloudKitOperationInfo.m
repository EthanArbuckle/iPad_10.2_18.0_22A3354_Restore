@implementation C2MPCloudKitOperationInfo

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *operationId;
  NSString *operationType;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  operationId = self->_operationId;
  if (operationId)
    objc_msgSend(v3, "setObject:forKey:", operationId, CFSTR("operation_id"));
  operationType = self->_operationType;
  if (operationType)
    objc_msgSend(v4, "setObject:forKey:", operationType, CFSTR("operation_type"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_operationTriggered);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("operation_triggered"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_operationGroupIndex);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("operation_group_index"));

  }
  return v4;
}

- (void)setOperationType:(id)a3
{
  objc_storeStrong((id *)&self->_operationType, a3);
}

- (void)setOperationTriggered:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_operationTriggered = a3;
}

- (void)setOperationId:(id)a3
{
  objc_storeStrong((id *)&self->_operationId, a3);
}

- (void)setOperationGroupIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_operationGroupIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong((id *)&self->_operationId, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_operationId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_operationType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }

}

- (BOOL)hasOperationId
{
  return self->_operationId != 0;
}

- (BOOL)hasOperationType
{
  return self->_operationType != 0;
}

- (void)setHasOperationTriggered:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOperationTriggered
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasOperationGroupIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOperationGroupIndex
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
  v8.super_class = (Class)C2MPCloudKitOperationInfo;
  -[C2MPCloudKitOperationInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPCloudKitOperationInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPCloudKitOperationInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_operationId)
  {
    objc_msgSend(v4, "setOperationId:");
    v4 = v6;
  }
  if (self->_operationType)
  {
    objc_msgSend(v6, "setOperationType:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_operationTriggered;
    *((_BYTE *)v4 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_operationGroupIndex;
    *((_BYTE *)v4 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_operationId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_operationType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_operationTriggered;
    *(_BYTE *)(v5 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_operationGroupIndex;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *operationId;
  NSString *operationType;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  operationId = self->_operationId;
  if ((unint64_t)operationId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](operationId, "isEqual:"))
      goto LABEL_18;
  }
  operationType = self->_operationType;
  if ((unint64_t)operationType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](operationType, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) != 0)
    {
      if (self->_operationTriggered)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_18;
        goto LABEL_14;
      }
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_14;
    }
LABEL_18:
    v7 = 0;
    goto LABEL_19;
  }
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
    goto LABEL_18;
LABEL_14:
  v7 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_operationGroupIndex != *((_DWORD *)v4 + 2))
      goto LABEL_18;
    v7 = 1;
  }
LABEL_19:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_operationId, "hash");
  v4 = -[NSString hash](self->_operationType, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_operationTriggered;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_operationGroupIndex;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[C2MPCloudKitOperationInfo setOperationId:](self, "setOperationId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[C2MPCloudKitOperationInfo setOperationType:](self, "setOperationType:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_operationTriggered = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 36);
  }
  if ((v5 & 1) != 0)
  {
    self->_operationGroupIndex = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)operationId
{
  return self->_operationId;
}

- (NSString)operationType
{
  return self->_operationType;
}

- (BOOL)operationTriggered
{
  return self->_operationTriggered;
}

- (unsigned)operationGroupIndex
{
  return self->_operationGroupIndex;
}

@end
