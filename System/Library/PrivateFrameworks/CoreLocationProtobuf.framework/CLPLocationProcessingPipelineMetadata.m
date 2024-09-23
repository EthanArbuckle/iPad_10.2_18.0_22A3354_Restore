@implementation CLPLocationProcessingPipelineMetadata

- (BOOL)hasPrivacySanitization
{
  return self->_privacySanitization != 0;
}

- (BOOL)hasConsolidation
{
  return self->_consolidation != 0;
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
  v8.super_class = (Class)CLPLocationProcessingPipelineMetadata;
  -[CLPLocationProcessingPipelineMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLocationProcessingPipelineMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CLPPrivacySanitization *privacySanitization;
  void *v5;
  CLPConsolidation *consolidation;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  privacySanitization = self->_privacySanitization;
  if (privacySanitization)
  {
    -[CLPPrivacySanitization dictionaryRepresentation](privacySanitization, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("privacySanitization"));

  }
  consolidation = self->_consolidation;
  if (consolidation)
  {
    -[CLPConsolidation dictionaryRepresentation](consolidation, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("consolidation"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLocationProcessingPipelineMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_privacySanitization)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_consolidation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_privacySanitization)
  {
    objc_msgSend(v4, "setPrivacySanitization:");
    v4 = v5;
  }
  if (self->_consolidation)
  {
    objc_msgSend(v5, "setConsolidation:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CLPPrivacySanitization copyWithZone:](self->_privacySanitization, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[CLPConsolidation copyWithZone:](self->_consolidation, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  CLPPrivacySanitization *privacySanitization;
  CLPConsolidation *consolidation;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((privacySanitization = self->_privacySanitization, !((unint64_t)privacySanitization | v4[2]))
     || -[CLPPrivacySanitization isEqual:](privacySanitization, "isEqual:")))
  {
    consolidation = self->_consolidation;
    if ((unint64_t)consolidation | v4[1])
      v7 = -[CLPConsolidation isEqual:](consolidation, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[CLPPrivacySanitization hash](self->_privacySanitization, "hash");
  return -[CLPConsolidation hash](self->_consolidation, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CLPPrivacySanitization *privacySanitization;
  uint64_t v6;
  CLPConsolidation *consolidation;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  privacySanitization = self->_privacySanitization;
  v6 = v4[2];
  v9 = v4;
  if (privacySanitization)
  {
    if (!v6)
      goto LABEL_7;
    -[CLPPrivacySanitization mergeFrom:](privacySanitization, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[CLPLocationProcessingPipelineMetadata setPrivacySanitization:](self, "setPrivacySanitization:");
  }
  v4 = v9;
LABEL_7:
  consolidation = self->_consolidation;
  v8 = v4[1];
  if (consolidation)
  {
    if (v8)
    {
      -[CLPConsolidation mergeFrom:](consolidation, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[CLPLocationProcessingPipelineMetadata setConsolidation:](self, "setConsolidation:");
    goto LABEL_12;
  }

}

- (CLPPrivacySanitization)privacySanitization
{
  return self->_privacySanitization;
}

- (void)setPrivacySanitization:(id)a3
{
  objc_storeStrong((id *)&self->_privacySanitization, a3);
}

- (CLPConsolidation)consolidation
{
  return self->_consolidation;
}

- (void)setConsolidation:(id)a3
{
  objc_storeStrong((id *)&self->_consolidation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacySanitization, 0);
  objc_storeStrong((id *)&self->_consolidation, 0);
}

@end
