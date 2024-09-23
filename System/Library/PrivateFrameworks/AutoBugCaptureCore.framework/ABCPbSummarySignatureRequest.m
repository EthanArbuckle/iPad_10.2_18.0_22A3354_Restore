@implementation ABCPbSummarySignatureRequest

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
  *(_BYTE *)&self->_has |= 4u;
  self->_logSizeTotal = a3;
}

- (void)setHasLogSizeTotal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLogSizeTotal
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCaseClosedTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_caseClosedTime = a3;
}

- (void)setHasCaseClosedTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaseClosedTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCaseClosureType
{
  return self->_caseClosureType != 0;
}

- (void)setCaseStartTime:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_caseStartTime = a3;
}

- (void)setHasCaseStartTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCaseStartTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCaseContext
{
  return self->_caseContext != 0;
}

- (BOOL)hasCaseDampeningType
{
  return self->_caseDampeningType != 0;
}

- (BOOL)hasCaseEffectiveProcess
{
  return self->_caseEffectiveProcess != 0;
}

- (BOOL)hasCaseRelatedProcesses
{
  return self->_caseRelatedProcesses != 0;
}

- (BOOL)hasCaseThresholdValues
{
  return self->_caseThresholdValues != 0;
}

- (void)setRemoteTrigger:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_remoteTrigger = a3;
}

- (void)setHasRemoteTrigger:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRemoteTrigger
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearAttachments
{
  -[NSMutableArray removeAllObjects](self->_attachments, "removeAllObjects");
}

- (void)addAttachments:(id)a3
{
  id v4;
  NSMutableArray *attachments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  attachments = self->_attachments;
  v8 = v4;
  if (!attachments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_attachments;
    self->_attachments = v6;

    v4 = v8;
    attachments = self->_attachments;
  }
  -[NSMutableArray addObject:](attachments, "addObject:", v4);

}

- (unint64_t)attachmentsCount
{
  return -[NSMutableArray count](self->_attachments, "count");
}

- (id)attachmentsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_attachments, "objectAtIndex:", a3);
}

+ (Class)attachmentsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)ABCPbSummarySignatureRequest;
  -[ABCPbSummarySignatureRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCPbSummarySignatureRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  void *v15;
  void *v16;
  NSString *caseClosureType;
  void *v18;
  NSString *caseContext;
  NSString *caseDampeningType;
  NSString *caseEffectiveProcess;
  NSString *caseRelatedProcesses;
  NSString *caseThresholdValues;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
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
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_logSizeTotal);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("log_size_total"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_caseClosedTime);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("case_closed_time"));

  }
  caseClosureType = self->_caseClosureType;
  if (caseClosureType)
    objc_msgSend(v4, "setObject:forKey:", caseClosureType, CFSTR("case_closure_type"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_caseStartTime);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("case_start_time"));

  }
  caseContext = self->_caseContext;
  if (caseContext)
    objc_msgSend(v4, "setObject:forKey:", caseContext, CFSTR("case_context"));
  caseDampeningType = self->_caseDampeningType;
  if (caseDampeningType)
    objc_msgSend(v4, "setObject:forKey:", caseDampeningType, CFSTR("case_dampening_type"));
  caseEffectiveProcess = self->_caseEffectiveProcess;
  if (caseEffectiveProcess)
    objc_msgSend(v4, "setObject:forKey:", caseEffectiveProcess, CFSTR("case_effective_process"));
  caseRelatedProcesses = self->_caseRelatedProcesses;
  if (caseRelatedProcesses)
    objc_msgSend(v4, "setObject:forKey:", caseRelatedProcesses, CFSTR("case_related_processes"));
  caseThresholdValues = self->_caseThresholdValues;
  if (caseThresholdValues)
    objc_msgSend(v4, "setObject:forKey:", caseThresholdValues, CFSTR("case_threshold_values"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_remoteTrigger);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("remote_trigger"));

  }
  if (-[NSMutableArray count](self->_attachments, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_attachments, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v26 = self->_attachments;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v33);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v28);
    }

    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("attachments"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSummarySignatureRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_type)
    PBDataWriterWriteStringField();
  if (self->_subtype)
    PBDataWriterWriteStringField();
  if (self->_subtypeContext)
    PBDataWriterWriteStringField();
  if (self->_caseIdentifier)
    PBDataWriterWriteStringField();
  if (self->_process)
    PBDataWriterWriteStringField();
  if (self->_build)
    PBDataWriterWriteStringField();
  if (self->_buildVariant)
    PBDataWriterWriteStringField();
  if (self->_caseGroupIdentifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_caseClosureType)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_caseContext)
    PBDataWriterWriteStringField();
  if (self->_caseDampeningType)
    PBDataWriterWriteStringField();
  if (self->_caseEffectiveProcess)
    PBDataWriterWriteStringField();
  if (self->_caseRelatedProcesses)
    PBDataWriterWriteStringField();
  if (self->_caseThresholdValues)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_attachments;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    v4 = v10;
  }
  if (self->_type)
  {
    objc_msgSend(v10, "setType:");
    v4 = v10;
  }
  if (self->_subtype)
  {
    objc_msgSend(v10, "setSubtype:");
    v4 = v10;
  }
  if (self->_subtypeContext)
  {
    objc_msgSend(v10, "setSubtypeContext:");
    v4 = v10;
  }
  if (self->_caseIdentifier)
  {
    objc_msgSend(v10, "setCaseIdentifier:");
    v4 = v10;
  }
  if (self->_process)
  {
    objc_msgSend(v10, "setProcess:");
    v4 = v10;
  }
  if (self->_build)
  {
    objc_msgSend(v10, "setBuild:");
    v4 = v10;
  }
  if (self->_buildVariant)
  {
    objc_msgSend(v10, "setBuildVariant:");
    v4 = v10;
  }
  if (self->_caseGroupIdentifier)
  {
    objc_msgSend(v10, "setCaseGroupIdentifier:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_logSizeTotal;
    *((_BYTE *)v4 + 164) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_caseClosedTime;
    *((_BYTE *)v4 + 164) |= 1u;
  }
  if (self->_caseClosureType)
  {
    objc_msgSend(v10, "setCaseClosureType:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_caseStartTime;
    *((_BYTE *)v4 + 164) |= 2u;
  }
  if (self->_caseContext)
  {
    objc_msgSend(v10, "setCaseContext:");
    v4 = v10;
  }
  if (self->_caseDampeningType)
  {
    objc_msgSend(v10, "setCaseDampeningType:");
    v4 = v10;
  }
  if (self->_caseEffectiveProcess)
  {
    objc_msgSend(v10, "setCaseEffectiveProcess:");
    v4 = v10;
  }
  if (self->_caseRelatedProcesses)
  {
    objc_msgSend(v10, "setCaseRelatedProcesses:");
    v4 = v10;
  }
  if (self->_caseThresholdValues)
  {
    objc_msgSend(v10, "setCaseThresholdValues:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 160) = self->_remoteTrigger;
    *((_BYTE *)v4 + 164) |= 8u;
  }
  if (-[ABCPbSummarySignatureRequest attachmentsCount](self, "attachmentsCount"))
  {
    objc_msgSend(v10, "clearAttachments");
    v6 = -[ABCPbSummarySignatureRequest attachmentsCount](self, "attachmentsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[ABCPbSummarySignatureRequest attachmentsAtIndex:](self, "attachmentsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAttachments:", v9);

      }
    }
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
  char has;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v6;

  v8 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v8;

  v10 = -[NSString copyWithZone:](self->_subtype, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v10;

  v12 = -[NSString copyWithZone:](self->_subtypeContext, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v12;

  v14 = -[NSString copyWithZone:](self->_caseIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v14;

  v16 = -[NSString copyWithZone:](self->_process, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v16;

  v18 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v18;

  v20 = -[NSString copyWithZone:](self->_buildVariant, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v20;

  v22 = -[NSString copyWithZone:](self->_caseGroupIdentifier, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v22;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_logSizeTotal;
    *(_BYTE *)(v5 + 164) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_caseClosedTime;
    *(_BYTE *)(v5 + 164) |= 1u;
  }
  v25 = -[NSString copyWithZone:](self->_caseClosureType, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v25;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_caseStartTime;
    *(_BYTE *)(v5 + 164) |= 2u;
  }
  v27 = -[NSString copyWithZone:](self->_caseContext, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v27;

  v29 = -[NSString copyWithZone:](self->_caseDampeningType, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v29;

  v31 = -[NSString copyWithZone:](self->_caseEffectiveProcess, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v31;

  v33 = -[NSString copyWithZone:](self->_caseRelatedProcesses, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v33;

  v35 = -[NSString copyWithZone:](self->_caseThresholdValues, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v35;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 160) = self->_remoteTrigger;
    *(_BYTE *)(v5 + 164) |= 8u;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v37 = self->_attachments;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v45 != v40)
          objc_enumerationMutation(v37);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v44);
        objc_msgSend((id)v5, "addAttachments:", v42);

      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v39);
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
  char has;
  NSString *caseClosureType;
  NSString *caseContext;
  NSString *caseDampeningType;
  NSString *caseEffectiveProcess;
  NSString *caseRelatedProcesses;
  NSString *caseThresholdValues;
  char v21;
  NSMutableArray *attachments;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  domain = self->_domain;
  if ((unint64_t)domain | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](domain, "isEqual:"))
      goto LABEL_52;
  }
  type = self->_type;
  if ((unint64_t)type | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](type, "isEqual:"))
      goto LABEL_52;
  }
  subtype = self->_subtype;
  if ((unint64_t)subtype | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](subtype, "isEqual:"))
      goto LABEL_52;
  }
  subtypeContext = self->_subtypeContext;
  if ((unint64_t)subtypeContext | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](subtypeContext, "isEqual:"))
      goto LABEL_52;
  }
  caseIdentifier = self->_caseIdentifier;
  if ((unint64_t)caseIdentifier | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](caseIdentifier, "isEqual:"))
      goto LABEL_52;
  }
  process = self->_process;
  if ((unint64_t)process | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](process, "isEqual:"))
      goto LABEL_52;
  }
  build = self->_build;
  if ((unint64_t)build | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](build, "isEqual:"))
      goto LABEL_52;
  }
  buildVariant = self->_buildVariant;
  if ((unint64_t)buildVariant | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](buildVariant, "isEqual:"))
      goto LABEL_52;
  }
  caseGroupIdentifier = self->_caseGroupIdentifier;
  if ((unint64_t)caseGroupIdentifier | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](caseGroupIdentifier, "isEqual:"))
      goto LABEL_52;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 164) & 4) == 0 || self->_logSizeTotal != *((_DWORD *)v4 + 30))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 164) & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 164) & 1) == 0 || self->_caseClosedTime != *((double *)v4 + 1))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 164) & 1) != 0)
  {
    goto LABEL_52;
  }
  caseClosureType = self->_caseClosureType;
  if ((unint64_t)caseClosureType | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](caseClosureType, "isEqual:"))
      goto LABEL_52;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 164) & 2) == 0 || self->_caseStartTime != *((double *)v4 + 2))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 164) & 2) != 0)
  {
    goto LABEL_52;
  }
  caseContext = self->_caseContext;
  if ((unint64_t)caseContext | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](caseContext, "isEqual:"))
  {
    goto LABEL_52;
  }
  caseDampeningType = self->_caseDampeningType;
  if ((unint64_t)caseDampeningType | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](caseDampeningType, "isEqual:"))
      goto LABEL_52;
  }
  caseEffectiveProcess = self->_caseEffectiveProcess;
  if ((unint64_t)caseEffectiveProcess | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](caseEffectiveProcess, "isEqual:"))
      goto LABEL_52;
  }
  caseRelatedProcesses = self->_caseRelatedProcesses;
  if ((unint64_t)caseRelatedProcesses | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](caseRelatedProcesses, "isEqual:"))
      goto LABEL_52;
  }
  caseThresholdValues = self->_caseThresholdValues;
  if ((unint64_t)caseThresholdValues | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](caseThresholdValues, "isEqual:"))
      goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 164) & 8) == 0)
      goto LABEL_58;
LABEL_52:
    v21 = 0;
    goto LABEL_53;
  }
  if ((*((_BYTE *)v4 + 164) & 8) == 0)
    goto LABEL_52;
  if (!self->_remoteTrigger)
  {
    if (!*((_BYTE *)v4 + 160))
      goto LABEL_58;
    goto LABEL_52;
  }
  if (!*((_BYTE *)v4 + 160))
    goto LABEL_52;
LABEL_58:
  attachments = self->_attachments;
  if ((unint64_t)attachments | *((_QWORD *)v4 + 3))
    v21 = -[NSMutableArray isEqual:](attachments, "isEqual:");
  else
    v21 = 1;
LABEL_53:

  return v21;
}

- (unint64_t)hash
{
  double caseClosedTime;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  double caseStartTime;
  double v11;
  long double v12;
  double v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;

  v31 = -[NSString hash](self->_domain, "hash");
  v30 = -[NSString hash](self->_type, "hash");
  v29 = -[NSString hash](self->_subtype, "hash");
  v28 = -[NSString hash](self->_subtypeContext, "hash");
  v27 = -[NSString hash](self->_caseIdentifier, "hash");
  v26 = -[NSString hash](self->_process, "hash");
  v25 = -[NSString hash](self->_build, "hash");
  v24 = -[NSString hash](self->_buildVariant, "hash");
  v23 = -[NSString hash](self->_caseGroupIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v21 = 2654435761 * self->_logSizeTotal;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v7 = 0;
    goto LABEL_11;
  }
  v21 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  caseClosedTime = self->_caseClosedTime;
  v4 = -caseClosedTime;
  if (caseClosedTime >= 0.0)
    v4 = self->_caseClosedTime;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      v7 += (unint64_t)v6;
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
LABEL_11:
  v8 = -[NSString hash](self->_caseClosureType, "hash", v21);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    caseStartTime = self->_caseStartTime;
    v11 = -caseStartTime;
    if (caseStartTime >= 0.0)
      v11 = self->_caseStartTime;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v14 = -[NSString hash](self->_caseContext, "hash");
  v15 = -[NSString hash](self->_caseDampeningType, "hash");
  v16 = -[NSString hash](self->_caseEffectiveProcess, "hash");
  v17 = -[NSString hash](self->_caseRelatedProcesses, "hash");
  v18 = -[NSString hash](self->_caseThresholdValues, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v19 = 2654435761 * self->_remoteTrigger;
  else
    v19 = 0;
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[NSMutableArray hash](self->_attachments, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 14))
    -[ABCPbSummarySignatureRequest setDomain:](self, "setDomain:");
  if (*((_QWORD *)v4 + 19))
    -[ABCPbSummarySignatureRequest setType:](self, "setType:");
  if (*((_QWORD *)v4 + 17))
    -[ABCPbSummarySignatureRequest setSubtype:](self, "setSubtype:");
  if (*((_QWORD *)v4 + 18))
    -[ABCPbSummarySignatureRequest setSubtypeContext:](self, "setSubtypeContext:");
  if (*((_QWORD *)v4 + 11))
    -[ABCPbSummarySignatureRequest setCaseIdentifier:](self, "setCaseIdentifier:");
  if (*((_QWORD *)v4 + 16))
    -[ABCPbSummarySignatureRequest setProcess:](self, "setProcess:");
  if (*((_QWORD *)v4 + 4))
    -[ABCPbSummarySignatureRequest setBuild:](self, "setBuild:");
  if (*((_QWORD *)v4 + 5))
    -[ABCPbSummarySignatureRequest setBuildVariant:](self, "setBuildVariant:");
  if (*((_QWORD *)v4 + 10))
    -[ABCPbSummarySignatureRequest setCaseGroupIdentifier:](self, "setCaseGroupIdentifier:");
  v5 = *((_BYTE *)v4 + 164);
  if ((v5 & 4) != 0)
  {
    self->_logSizeTotal = *((_DWORD *)v4 + 30);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 164);
  }
  if ((v5 & 1) != 0)
  {
    self->_caseClosedTime = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
    -[ABCPbSummarySignatureRequest setCaseClosureType:](self, "setCaseClosureType:");
  if ((*((_BYTE *)v4 + 164) & 2) != 0)
  {
    self->_caseStartTime = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 7))
    -[ABCPbSummarySignatureRequest setCaseContext:](self, "setCaseContext:");
  if (*((_QWORD *)v4 + 8))
    -[ABCPbSummarySignatureRequest setCaseDampeningType:](self, "setCaseDampeningType:");
  if (*((_QWORD *)v4 + 9))
    -[ABCPbSummarySignatureRequest setCaseEffectiveProcess:](self, "setCaseEffectiveProcess:");
  if (*((_QWORD *)v4 + 12))
    -[ABCPbSummarySignatureRequest setCaseRelatedProcesses:](self, "setCaseRelatedProcesses:");
  if (*((_QWORD *)v4 + 13))
    -[ABCPbSummarySignatureRequest setCaseThresholdValues:](self, "setCaseThresholdValues:");
  if ((*((_BYTE *)v4 + 164) & 8) != 0)
  {
    self->_remoteTrigger = *((_BYTE *)v4 + 160);
    *(_BYTE *)&self->_has |= 8u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[ABCPbSummarySignatureRequest addAttachments:](self, "addAttachments:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
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

- (double)caseClosedTime
{
  return self->_caseClosedTime;
}

- (NSString)caseClosureType
{
  return self->_caseClosureType;
}

- (void)setCaseClosureType:(id)a3
{
  objc_storeStrong((id *)&self->_caseClosureType, a3);
}

- (double)caseStartTime
{
  return self->_caseStartTime;
}

- (NSString)caseContext
{
  return self->_caseContext;
}

- (void)setCaseContext:(id)a3
{
  objc_storeStrong((id *)&self->_caseContext, a3);
}

- (NSString)caseDampeningType
{
  return self->_caseDampeningType;
}

- (void)setCaseDampeningType:(id)a3
{
  objc_storeStrong((id *)&self->_caseDampeningType, a3);
}

- (NSString)caseEffectiveProcess
{
  return self->_caseEffectiveProcess;
}

- (void)setCaseEffectiveProcess:(id)a3
{
  objc_storeStrong((id *)&self->_caseEffectiveProcess, a3);
}

- (NSString)caseRelatedProcesses
{
  return self->_caseRelatedProcesses;
}

- (void)setCaseRelatedProcesses:(id)a3
{
  objc_storeStrong((id *)&self->_caseRelatedProcesses, a3);
}

- (NSString)caseThresholdValues
{
  return self->_caseThresholdValues;
}

- (void)setCaseThresholdValues:(id)a3
{
  objc_storeStrong((id *)&self->_caseThresholdValues, a3);
}

- (BOOL)remoteTrigger
{
  return self->_remoteTrigger;
}

- (NSMutableArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_subtypeContext, 0);
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_caseThresholdValues, 0);
  objc_storeStrong((id *)&self->_caseRelatedProcesses, 0);
  objc_storeStrong((id *)&self->_caseIdentifier, 0);
  objc_storeStrong((id *)&self->_caseGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_caseEffectiveProcess, 0);
  objc_storeStrong((id *)&self->_caseDampeningType, 0);
  objc_storeStrong((id *)&self->_caseContext, 0);
  objc_storeStrong((id *)&self->_caseClosureType, 0);
  objc_storeStrong((id *)&self->_buildVariant, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end
