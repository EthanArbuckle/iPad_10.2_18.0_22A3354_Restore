@implementation DRSProtoTaskingConfigCompletion

- (BOOL)hasTaskingConfigMetadata
{
  return self->_taskingConfigMetadata != 0;
}

- (BOOL)hasCompletionType
{
  return self->_completionType != 0;
}

- (BOOL)hasCompletionDescription
{
  return self->_completionDescription != 0;
}

- (void)setActiveDuration:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_activeDuration = a3;
}

- (void)setHasActiveDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActiveDuration
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)DRSProtoTaskingConfigCompletion;
  -[DRSProtoTaskingConfigCompletion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoTaskingConfigCompletion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  DRSProtoTaskingConfigMetadata *taskingConfigMetadata;
  void *v6;
  NSString *completionType;
  NSString *completionDescription;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  taskingConfigMetadata = self->_taskingConfigMetadata;
  if (taskingConfigMetadata)
  {
    -[DRSProtoTaskingConfigMetadata dictionaryRepresentation](taskingConfigMetadata, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("tasking_config_metadata"));

  }
  completionType = self->_completionType;
  if (completionType)
    objc_msgSend(v3, "setObject:forKey:", completionType, CFSTR("completion_type"));
  completionDescription = self->_completionDescription;
  if (completionDescription)
    objc_msgSend(v3, "setObject:forKey:", completionDescription, CFSTR("completion_description"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v4 = self->_activeDuration;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("active_duration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoTaskingConfigCompletionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_taskingConfigMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_completionType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_completionDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_taskingConfigMetadata)
  {
    objc_msgSend(v4, "setTaskingConfigMetadata:");
    v4 = v5;
  }
  if (self->_completionType)
  {
    objc_msgSend(v5, "setCompletionType:");
    v4 = v5;
  }
  if (self->_completionDescription)
  {
    objc_msgSend(v5, "setCompletionDescription:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = LODWORD(self->_activeDuration);
    *((_BYTE *)v4 + 40) |= 1u;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[DRSProtoTaskingConfigMetadata copyWithZone:](self->_taskingConfigMetadata, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_completionType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_completionDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)(v5 + 8) = self->_activeDuration;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  DRSProtoTaskingConfigMetadata *taskingConfigMetadata;
  NSString *completionType;
  NSString *completionDescription;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  taskingConfigMetadata = self->_taskingConfigMetadata;
  if ((unint64_t)taskingConfigMetadata | *((_QWORD *)v4 + 4))
  {
    if (!-[DRSProtoTaskingConfigMetadata isEqual:](taskingConfigMetadata, "isEqual:"))
      goto LABEL_12;
  }
  completionType = self->_completionType;
  if ((unint64_t)completionType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](completionType, "isEqual:"))
      goto LABEL_12;
  }
  completionDescription = self->_completionDescription;
  if ((unint64_t)completionDescription | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](completionDescription, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_activeDuration == *((float *)v4 + 2))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  float activeDuration;
  float v8;
  float v9;
  float v10;

  v3 = -[DRSProtoTaskingConfigMetadata hash](self->_taskingConfigMetadata, "hash");
  v4 = -[NSString hash](self->_completionType, "hash");
  v5 = -[NSString hash](self->_completionDescription, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    activeDuration = self->_activeDuration;
    v8 = -activeDuration;
    if (activeDuration >= 0.0)
      v8 = self->_activeDuration;
    v9 = floorf(v8 + 0.5);
    v10 = (float)(v8 - v9) * 1.8447e19;
    v6 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabsf(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  DRSProtoTaskingConfigMetadata *taskingConfigMetadata;
  uint64_t v6;
  id v7;

  v4 = a3;
  taskingConfigMetadata = self->_taskingConfigMetadata;
  v6 = *((_QWORD *)v4 + 4);
  v7 = v4;
  if (taskingConfigMetadata)
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoTaskingConfigMetadata mergeFrom:](taskingConfigMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoTaskingConfigCompletion setTaskingConfigMetadata:](self, "setTaskingConfigMetadata:");
  }
  v4 = v7;
LABEL_7:
  if (*((_QWORD *)v4 + 3))
  {
    -[DRSProtoTaskingConfigCompletion setCompletionType:](self, "setCompletionType:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[DRSProtoTaskingConfigCompletion setCompletionDescription:](self, "setCompletionDescription:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_activeDuration = *((float *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (DRSProtoTaskingConfigMetadata)taskingConfigMetadata
{
  return self->_taskingConfigMetadata;
}

- (void)setTaskingConfigMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_taskingConfigMetadata, a3);
}

- (NSString)completionType
{
  return self->_completionType;
}

- (void)setCompletionType:(id)a3
{
  objc_storeStrong((id *)&self->_completionType, a3);
}

- (NSString)completionDescription
{
  return self->_completionDescription;
}

- (void)setCompletionDescription:(id)a3
{
  objc_storeStrong((id *)&self->_completionDescription, a3);
}

- (float)activeDuration
{
  return self->_activeDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskingConfigMetadata, 0);
  objc_storeStrong((id *)&self->_completionType, 0);
  objc_storeStrong((id *)&self->_completionDescription, 0);
}

@end
