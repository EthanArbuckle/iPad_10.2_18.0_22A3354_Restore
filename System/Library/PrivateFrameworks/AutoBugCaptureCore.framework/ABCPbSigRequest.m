@implementation ABCPbSigRequest

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasSubtype
{
  return self->_subtype != 0;
}

- (BOOL)hasSubtypeContext
{
  return self->_subtypeContext != 0;
}

- (BOOL)hasCaseIdentifier
{
  return self->_caseIdentifier != 0;
}

- (BOOL)hasProcess
{
  return self->_process != 0;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (BOOL)hasBuildVariant
{
  return self->_buildVariant != 0;
}

- (BOOL)hasCaseGroupIdentifier
{
  return self->_caseGroupIdentifier != 0;
}

- (void)setLogSizeTotal:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_logSizeTotal = a3;
}

- (void)setHasLogSizeTotal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLogSizeTotal
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
  v8.super_class = (Class)ABCPbSigRequest;
  -[ABCPbSigRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCPbSigRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *domain;
  NSString *type;
  NSString *subtype;
  NSString *subtypeContext;
  NSString *caseIdentifier;
  NSString *process;
  NSString *build;
  NSString *buildVariant;
  NSString *caseGroupIdentifier;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  type = self->_type;
  if (type)
    objc_msgSend(v4, "setObject:forKey:", type, CFSTR("type"));
  subtype = self->_subtype;
  if (subtype)
    objc_msgSend(v4, "setObject:forKey:", subtype, CFSTR("subtype"));
  subtypeContext = self->_subtypeContext;
  if (subtypeContext)
    objc_msgSend(v4, "setObject:forKey:", subtypeContext, CFSTR("subtype_context"));
  caseIdentifier = self->_caseIdentifier;
  if (caseIdentifier)
    objc_msgSend(v4, "setObject:forKey:", caseIdentifier, CFSTR("case_identifier"));
  process = self->_process;
  if (process)
    objc_msgSend(v4, "setObject:forKey:", process, CFSTR("process"));
  build = self->_build;
  if (build)
    objc_msgSend(v4, "setObject:forKey:", build, CFSTR("build"));
  buildVariant = self->_buildVariant;
  if (buildVariant)
    objc_msgSend(v4, "setObject:forKey:", buildVariant, CFSTR("build_variant"));
  caseGroupIdentifier = self->_caseGroupIdentifier;
  if (caseGroupIdentifier)
    objc_msgSend(v4, "setObject:forKey:", caseGroupIdentifier, CFSTR("case_group_identifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_logSizeTotal);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("log_size_total"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSigRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_subtype)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_subtypeContext)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_caseIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_process)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_buildVariant)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_caseGroupIdentifier)
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
  v5 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    v4 = v5;
  }
  if (self->_type)
  {
    objc_msgSend(v5, "setType:");
    v4 = v5;
  }
  if (self->_subtype)
  {
    objc_msgSend(v5, "setSubtype:");
    v4 = v5;
  }
  if (self->_subtypeContext)
  {
    objc_msgSend(v5, "setSubtypeContext:");
    v4 = v5;
  }
  if (self->_caseIdentifier)
  {
    objc_msgSend(v5, "setCaseIdentifier:");
    v4 = v5;
  }
  if (self->_process)
  {
    objc_msgSend(v5, "setProcess:");
    v4 = v5;
  }
  if (self->_build)
  {
    objc_msgSend(v5, "setBuild:");
    v4 = v5;
  }
  if (self->_buildVariant)
  {
    objc_msgSend(v5, "setBuildVariant:");
    v4 = v5;
  }
  if (self->_caseGroupIdentifier)
  {
    objc_msgSend(v5, "setCaseGroupIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_logSizeTotal;
    *((_BYTE *)v4 + 88) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v8;

  v10 = -[NSString copyWithZone:](self->_subtype, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v10;

  v12 = -[NSString copyWithZone:](self->_subtypeContext, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  v14 = -[NSString copyWithZone:](self->_caseIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[NSString copyWithZone:](self->_process, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v18;

  v20 = -[NSString copyWithZone:](self->_buildVariant, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;

  v22 = -[NSString copyWithZone:](self->_caseGroupIdentifier, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v22;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_logSizeTotal;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *domain;
  NSString *type;
  NSString *subtype;
  NSString *subtypeContext;
  NSString *caseIdentifier;
  NSString *process;
  NSString *build;
  NSString *buildVariant;
  NSString *caseGroupIdentifier;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  domain = self->_domain;
  if ((unint64_t)domain | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](domain, "isEqual:"))
      goto LABEL_24;
  }
  type = self->_type;
  if ((unint64_t)type | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](type, "isEqual:"))
      goto LABEL_24;
  }
  subtype = self->_subtype;
  if ((unint64_t)subtype | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](subtype, "isEqual:"))
      goto LABEL_24;
  }
  subtypeContext = self->_subtypeContext;
  if ((unint64_t)subtypeContext | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](subtypeContext, "isEqual:"))
      goto LABEL_24;
  }
  caseIdentifier = self->_caseIdentifier;
  if ((unint64_t)caseIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](caseIdentifier, "isEqual:"))
      goto LABEL_24;
  }
  process = self->_process;
  if ((unint64_t)process | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](process, "isEqual:"))
      goto LABEL_24;
  }
  build = self->_build;
  if ((unint64_t)build | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](build, "isEqual:"))
      goto LABEL_24;
  }
  buildVariant = self->_buildVariant;
  if ((unint64_t)buildVariant | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](buildVariant, "isEqual:"))
      goto LABEL_24;
  }
  caseGroupIdentifier = self->_caseGroupIdentifier;
  if ((unint64_t)caseGroupIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](caseGroupIdentifier, "isEqual:"))
      goto LABEL_24;
  }
  v14 = (*((_BYTE *)v4 + 88) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) != 0 && self->_logSizeTotal == *((_DWORD *)v4 + 12))
    {
      v14 = 1;
      goto LABEL_25;
    }
LABEL_24:
    v14 = 0;
  }
LABEL_25:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;

  v3 = -[NSString hash](self->_domain, "hash");
  v4 = -[NSString hash](self->_type, "hash");
  v5 = -[NSString hash](self->_subtype, "hash");
  v6 = -[NSString hash](self->_subtypeContext, "hash");
  v7 = -[NSString hash](self->_caseIdentifier, "hash");
  v8 = -[NSString hash](self->_process, "hash");
  v9 = -[NSString hash](self->_build, "hash");
  v10 = -[NSString hash](self->_buildVariant, "hash");
  v11 = -[NSString hash](self->_caseGroupIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v12 = 2654435761 * self->_logSizeTotal;
  else
    v12 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[ABCPbSigRequest setDomain:](self, "setDomain:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[ABCPbSigRequest setType:](self, "setType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[ABCPbSigRequest setSubtype:](self, "setSubtype:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[ABCPbSigRequest setSubtypeContext:](self, "setSubtypeContext:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ABCPbSigRequest setCaseIdentifier:](self, "setCaseIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[ABCPbSigRequest setProcess:](self, "setProcess:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ABCPbSigRequest setBuild:](self, "setBuild:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ABCPbSigRequest setBuildVariant:](self, "setBuildVariant:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ABCPbSigRequest setCaseGroupIdentifier:](self, "setCaseGroupIdentifier:");
    v4 = v5;
  }
  if ((v4[22] & 1) != 0)
  {
    self->_logSizeTotal = v4[12];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(id)a3
{
  objc_storeStrong((id *)&self->_subtype, a3);
}

- (NSString)subtypeContext
{
  return self->_subtypeContext;
}

- (void)setSubtypeContext:(id)a3
{
  objc_storeStrong((id *)&self->_subtypeContext, a3);
}

- (NSString)caseIdentifier
{
  return self->_caseIdentifier;
}

- (void)setCaseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_caseIdentifier, a3);
}

- (NSString)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
  objc_storeStrong((id *)&self->_process, a3);
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (NSString)buildVariant
{
  return self->_buildVariant;
}

- (void)setBuildVariant:(id)a3
{
  objc_storeStrong((id *)&self->_buildVariant, a3);
}

- (NSString)caseGroupIdentifier
{
  return self->_caseGroupIdentifier;
}

- (void)setCaseGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_caseGroupIdentifier, a3);
}

- (unsigned)logSizeTotal
{
  return self->_logSizeTotal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_subtypeContext, 0);
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_caseIdentifier, 0);
  objc_storeStrong((id *)&self->_caseGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_buildVariant, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end
