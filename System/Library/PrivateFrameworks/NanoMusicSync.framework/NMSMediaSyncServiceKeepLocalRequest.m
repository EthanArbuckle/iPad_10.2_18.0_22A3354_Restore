@implementation NMSMediaSyncServiceKeepLocalRequest

- (BOOL)hasModelObject
{
  return self->_modelObject != 0;
}

- (int)enableState
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_enableState;
  else
    return 0;
}

- (void)setEnableState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enableState = a3;
}

- (void)setHasEnableState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnableState
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)enableStateAsString:(int)a3
{
  if (a3 < 5)
    return off_24D6480E0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEnableState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Enabled")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Disabled")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Automatic")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Cancelled")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasOptions
{
  return self->_options != 0;
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
  v8.super_class = (Class)NMSMediaSyncServiceKeepLocalRequest;
  -[NMSMediaSyncServiceKeepLocalRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncServiceKeepLocalRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NMSMediaSyncServiceModelObject *modelObject;
  void *v5;
  uint64_t enableState;
  __CFString *v7;
  NMSMediaSyncServiceKeepLocalOptions *options;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  modelObject = self->_modelObject;
  if (modelObject)
  {
    -[NMSMediaSyncServiceModelObject dictionaryRepresentation](modelObject, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("modelObject"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    enableState = self->_enableState;
    if (enableState >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_enableState);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_24D6480E0[enableState];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("enableState"));

  }
  options = self->_options;
  if (options)
  {
    -[NMSMediaSyncServiceKeepLocalOptions dictionaryRepresentation](options, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("options"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NMSMediaSyncServiceKeepLocalRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_modelObject)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_options)
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
  if (self->_modelObject)
  {
    objc_msgSend(v4, "setModelObject:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_enableState;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (self->_options)
  {
    objc_msgSend(v5, "setOptions:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NMSMediaSyncServiceModelObject copyWithZone:](self->_modelObject, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_enableState;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v8 = -[NMSMediaSyncServiceKeepLocalOptions copyWithZone:](self->_options, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NMSMediaSyncServiceModelObject *modelObject;
  NMSMediaSyncServiceKeepLocalOptions *options;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  modelObject = self->_modelObject;
  if ((unint64_t)modelObject | *((_QWORD *)v4 + 2))
  {
    if (!-[NMSMediaSyncServiceModelObject isEqual:](modelObject, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_enableState != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  options = self->_options;
  if ((unint64_t)options | *((_QWORD *)v4 + 3))
    v7 = -[NMSMediaSyncServiceKeepLocalOptions isEqual:](options, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[NMSMediaSyncServiceModelObject hash](self->_modelObject, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_enableState;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NMSMediaSyncServiceKeepLocalOptions hash](self->_options, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NMSMediaSyncServiceModelObject *modelObject;
  uint64_t v6;
  NMSMediaSyncServiceKeepLocalOptions *options;
  uint64_t v8;
  id v9;

  v4 = a3;
  modelObject = self->_modelObject;
  v6 = *((_QWORD *)v4 + 2);
  v9 = v4;
  if (modelObject)
  {
    if (!v6)
      goto LABEL_7;
    -[NMSMediaSyncServiceModelObject mergeFrom:](modelObject, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NMSMediaSyncServiceKeepLocalRequest setModelObject:](self, "setModelObject:");
  }
  v4 = v9;
LABEL_7:
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_enableState = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  options = self->_options;
  v8 = *((_QWORD *)v4 + 3);
  if (options)
  {
    if (v8)
    {
      -[NMSMediaSyncServiceKeepLocalOptions mergeFrom:](options, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[NMSMediaSyncServiceKeepLocalRequest setOptions:](self, "setOptions:");
    goto LABEL_14;
  }

}

- (NMSMediaSyncServiceModelObject)modelObject
{
  return self->_modelObject;
}

- (void)setModelObject:(id)a3
{
  objc_storeStrong((id *)&self->_modelObject, a3);
}

- (NMSMediaSyncServiceKeepLocalOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end
