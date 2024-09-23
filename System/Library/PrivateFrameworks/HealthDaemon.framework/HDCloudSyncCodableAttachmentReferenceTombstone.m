@implementation HDCloudSyncCodableAttachmentReferenceTombstone

- (BOOL)hasReferenceIdentifier
{
  return self->_referenceIdentifier != 0;
}

- (BOOL)hasSchemaIdentifier
{
  return self->_schemaIdentifier != 0;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
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
  v8.super_class = (Class)HDCloudSyncCodableAttachmentReferenceTombstone;
  -[HDCloudSyncCodableAttachmentReferenceTombstone description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachmentReferenceTombstone dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *referenceIdentifier;
  NSString *schemaIdentifier;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  referenceIdentifier = self->_referenceIdentifier;
  if (referenceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", referenceIdentifier, CFSTR("referenceIdentifier"));
  schemaIdentifier = self->_schemaIdentifier;
  if (schemaIdentifier)
    objc_msgSend(v4, "setObject:forKey:", schemaIdentifier, CFSTR("schemaIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("creationDate"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableAttachmentReferenceTombstoneReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_referenceIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_schemaIdentifier)
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
  v5 = v4;
  if (self->_referenceIdentifier)
  {
    objc_msgSend(v4, "setReferenceIdentifier:");
    v4 = v5;
  }
  if (self->_schemaIdentifier)
  {
    objc_msgSend(v5, "setSchemaIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_creationDate;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_referenceIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_schemaIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *referenceIdentifier;
  NSString *schemaIdentifier;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  referenceIdentifier = self->_referenceIdentifier;
  if ((unint64_t)referenceIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](referenceIdentifier, "isEqual:"))
      goto LABEL_10;
  }
  schemaIdentifier = self->_schemaIdentifier;
  if ((unint64_t)schemaIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](schemaIdentifier, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_creationDate == *((double *)v4 + 1))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  double creationDate;
  double v7;
  long double v8;
  double v9;

  v3 = -[NSString hash](self->_referenceIdentifier, "hash");
  v4 = -[NSString hash](self->_schemaIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    creationDate = self->_creationDate;
    v7 = -creationDate;
    if (creationDate >= 0.0)
      v7 = self->_creationDate;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[HDCloudSyncCodableAttachmentReferenceTombstone setReferenceIdentifier:](self, "setReferenceIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCloudSyncCodableAttachmentReferenceTombstone setSchemaIdentifier:](self, "setSchemaIdentifier:");
    v4 = v5;
  }
  if (((_BYTE)v4[4] & 1) != 0)
  {
    self->_creationDate = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_referenceIdentifier, a3);
}

- (NSString)schemaIdentifier
{
  return self->_schemaIdentifier;
}

- (void)setSchemaIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_schemaIdentifier, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
}

@end
