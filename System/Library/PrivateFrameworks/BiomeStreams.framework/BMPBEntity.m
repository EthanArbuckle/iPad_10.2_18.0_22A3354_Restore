@implementation BMPBEntity

- (BOOL)hasPersonEntity
{
  return self->_personEntity != 0;
}

- (void)setPersonEntity:(id)a3
{
  BMPBPersonEntity *v4;
  BMPBPersonEntity *personEntity;

  v4 = (BMPBPersonEntity *)a3;
  -[BMPBEntity clearOneofValuesForEntityType](self, "clearOneofValuesForEntityType");
  *(_BYTE *)&self->_has |= 1u;
  self->_entityType = 1;
  personEntity = self->_personEntity;
  self->_personEntity = v4;

}

- (BOOL)hasTopicEntity
{
  return self->_topicEntity != 0;
}

- (void)setTopicEntity:(id)a3
{
  BMPBTopicEntity *v4;
  BMPBTopicEntity *topicEntity;

  v4 = (BMPBTopicEntity *)a3;
  -[BMPBEntity clearOneofValuesForEntityType](self, "clearOneofValuesForEntityType");
  *(_BYTE *)&self->_has |= 1u;
  self->_entityType = 2;
  topicEntity = self->_topicEntity;
  self->_topicEntity = v4;

}

- (int)entityType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_entityType;
  else
    return 0;
}

- (void)setEntityType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_entityType = a3;
}

- (void)setHasEntityType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEntityType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)entityTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2647CE8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEntityType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("personEntity")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("topicEntity")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForEntityType
{
  BMPBPersonEntity *personEntity;
  BMPBTopicEntity *topicEntity;

  *(_BYTE *)&self->_has &= ~1u;
  self->_entityType = 0;
  personEntity = self->_personEntity;
  self->_personEntity = 0;

  topicEntity = self->_topicEntity;
  self->_topicEntity = 0;

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
  v8.super_class = (Class)BMPBEntity;
  -[BMPBEntity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBEntity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  BMPBPersonEntity *personEntity;
  void *v5;
  BMPBTopicEntity *topicEntity;
  void *v7;
  uint64_t entityType;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  personEntity = self->_personEntity;
  if (personEntity)
  {
    -[BMPBPersonEntity dictionaryRepresentation](personEntity, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("personEntity"));

  }
  topicEntity = self->_topicEntity;
  if (topicEntity)
  {
    -[BMPBTopicEntity dictionaryRepresentation](topicEntity, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("topicEntity"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    entityType = self->_entityType;
    if (entityType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_entityType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E2647CE8[entityType];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("entityType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBEntityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_personEntity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_topicEntity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_entityType;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_personEntity)
  {
    objc_msgSend(v4, "setPersonEntity:");
    v4 = v5;
  }
  if (self->_topicEntity)
  {
    objc_msgSend(v5, "setTopicEntity:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_entityType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[BMPBPersonEntity copyWithZone:](self->_personEntity, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[BMPBTopicEntity copyWithZone:](self->_topicEntity, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BMPBPersonEntity *personEntity;
  BMPBTopicEntity *topicEntity;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_entityType != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  personEntity = self->_personEntity;
  if ((unint64_t)personEntity | *((_QWORD *)v4 + 2) && !-[BMPBPersonEntity isEqual:](personEntity, "isEqual:"))
    goto LABEL_11;
  topicEntity = self->_topicEntity;
  if ((unint64_t)topicEntity | *((_QWORD *)v4 + 3))
    v7 = -[BMPBTopicEntity isEqual:](topicEntity, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_entityType;
  else
    v3 = 0;
  v4 = -[BMPBPersonEntity hash](self->_personEntity, "hash") ^ v3;
  return v4 ^ -[BMPBTopicEntity hash](self->_topicEntity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  BMPBPersonEntity *personEntity;
  uint64_t v7;
  BMPBTopicEntity *topicEntity;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_entityType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  personEntity = self->_personEntity;
  v7 = v5[2];
  v10 = v5;
  if (personEntity)
  {
    if (!v7)
      goto LABEL_9;
    -[BMPBPersonEntity mergeFrom:](personEntity, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[BMPBEntity setPersonEntity:](self, "setPersonEntity:");
  }
  v5 = v10;
LABEL_9:
  topicEntity = self->_topicEntity;
  v9 = v5[3];
  if (topicEntity)
  {
    if (v9)
    {
      -[BMPBTopicEntity mergeFrom:](topicEntity, "mergeFrom:");
LABEL_14:
      v5 = v10;
    }
  }
  else if (v9)
  {
    -[BMPBEntity setTopicEntity:](self, "setTopicEntity:");
    goto LABEL_14;
  }

}

- (BMPBPersonEntity)personEntity
{
  return self->_personEntity;
}

- (BMPBTopicEntity)topicEntity
{
  return self->_topicEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicEntity, 0);
  objc_storeStrong((id *)&self->_personEntity, 0);
}

@end
