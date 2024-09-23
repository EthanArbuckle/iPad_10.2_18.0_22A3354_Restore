@implementation HDCodableCDADocumentSample

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HDCodableCDADocumentSample sample](self, "sample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "applyToObject:", v4);
    if (v6)
    {
      v7 = -[HDCodableCDADocumentSample omittedContent](self, "omittedContent");
      -[HDCodableCDADocumentSample documentData](self, "documentData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableCDADocumentSample title](self, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableCDADocumentSample patientName](self, "patientName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableCDADocumentSample authorName](self, "authorName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableCDADocumentSample custodianName](self, "custodianName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 3;
      if (v7 != 3)
        v13 = 0;
      if (v7 == 2)
        v14 = 2;
      else
        v14 = v13;
      objc_msgSend(v4, "_applyPropertiesWithOmittedFlags:compressedDocumentData:title:patientName:authorName:custodianName:", v14, v8, v9, v10, v11, v12);

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (int)omittedContent
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_omittedContent;
  else
    return 1;
}

- (void)setOmittedContent:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_omittedContent = a3;
}

- (void)setHasOmittedContent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOmittedContent
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)omittedContentAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E6CFEE08[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOmittedContent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DocumentData")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Document")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasDocumentData
{
  return self->_documentData != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasPatientName
{
  return self->_patientName != 0;
}

- (BOOL)hasAuthorName
{
  return self->_authorName != 0;
}

- (BOOL)hasCustodianName
{
  return self->_custodianName != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableCDADocumentSample;
  -[HDCodableCDADocumentSample description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableCDADocumentSample dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableSample *sample;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  NSData *documentData;
  NSString *title;
  NSString *patientName;
  NSString *authorName;
  NSString *custodianName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = self->_omittedContent - 1;
    if (v6 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_omittedContent);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E6CFEE08[v6];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("omittedContent"));

  }
  documentData = self->_documentData;
  if (documentData)
    objc_msgSend(v3, "setObject:forKey:", documentData, CFSTR("documentData"));
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  patientName = self->_patientName;
  if (patientName)
    objc_msgSend(v3, "setObject:forKey:", patientName, CFSTR("patientName"));
  authorName = self->_authorName;
  if (authorName)
    objc_msgSend(v3, "setObject:forKey:", authorName, CFSTR("authorName"));
  custodianName = self->_custodianName;
  if (custodianName)
    objc_msgSend(v3, "setObject:forKey:", custodianName, CFSTR("custodianName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableCDADocumentSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_documentData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_patientName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_authorName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_custodianName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_omittedContent;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (self->_documentData)
  {
    objc_msgSend(v5, "setDocumentData:");
    v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_patientName)
  {
    objc_msgSend(v5, "setPatientName:");
    v4 = v5;
  }
  if (self->_authorName)
  {
    objc_msgSend(v5, "setAuthorName:");
    v4 = v5;
  }
  if (self->_custodianName)
  {
    objc_msgSend(v5, "setCustodianName:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_omittedContent;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v8 = -[NSData copyWithZone:](self->_documentData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_patientName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSString copyWithZone:](self->_authorName, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v14;

  v16 = -[NSString copyWithZone:](self->_custodianName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  NSData *documentData;
  NSString *title;
  NSString *patientName;
  NSString *authorName;
  NSString *custodianName;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 6))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_omittedContent != *((_DWORD *)v4 + 8))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  documentData = self->_documentData;
  if ((unint64_t)documentData | *((_QWORD *)v4 + 3)
    && !-[NSData isEqual:](documentData, "isEqual:"))
  {
    goto LABEL_19;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_19;
  }
  patientName = self->_patientName;
  if ((unint64_t)patientName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](patientName, "isEqual:"))
      goto LABEL_19;
  }
  authorName = self->_authorName;
  if ((unint64_t)authorName | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](authorName, "isEqual:"))
      goto LABEL_19;
  }
  custodianName = self->_custodianName;
  if ((unint64_t)custodianName | *((_QWORD *)v4 + 2))
    v11 = -[NSString isEqual:](custodianName, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[HDCodableSample hash](self->_sample, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_omittedContent;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSData hash](self->_documentData, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_title, "hash");
  v8 = -[NSString hash](self->_patientName, "hash");
  v9 = v8 ^ -[NSString hash](self->_authorName, "hash");
  return v7 ^ v9 ^ -[NSString hash](self->_custodianName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSample *sample;
  uint64_t v6;
  id v7;

  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 6);
  v7 = v4;
  if (sample)
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableCDADocumentSample setSample:](self, "setSample:");
  }
  v4 = v7;
LABEL_7:
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_omittedContent = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableCDADocumentSample setDocumentData:](self, "setDocumentData:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[HDCodableCDADocumentSample setTitle:](self, "setTitle:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableCDADocumentSample setPatientName:](self, "setPatientName:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[HDCodableCDADocumentSample setAuthorName:](self, "setAuthorName:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[HDCodableCDADocumentSample setCustodianName:](self, "setCustodianName:");
    v4 = v7;
  }

}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (NSData)documentData
{
  return self->_documentData;
}

- (void)setDocumentData:(id)a3
{
  objc_storeStrong((id *)&self->_documentData, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)patientName
{
  return self->_patientName;
}

- (void)setPatientName:(id)a3
{
  objc_storeStrong((id *)&self->_patientName, a3);
}

- (NSString)authorName
{
  return self->_authorName;
}

- (void)setAuthorName:(id)a3
{
  objc_storeStrong((id *)&self->_authorName, a3);
}

- (NSString)custodianName
{
  return self->_custodianName;
}

- (void)setCustodianName:(id)a3
{
  objc_storeStrong((id *)&self->_custodianName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_patientName, 0);
  objc_storeStrong((id *)&self->_documentData, 0);
  objc_storeStrong((id *)&self->_custodianName, 0);
  objc_storeStrong((id *)&self->_authorName, 0);
}

@end
