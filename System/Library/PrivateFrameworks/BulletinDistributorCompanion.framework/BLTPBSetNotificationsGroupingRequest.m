@implementation BLTPBSetNotificationsGroupingRequest

- (int)grouping
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_grouping;
  else
    return 0;
}

- (void)setGrouping:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_grouping = a3;
}

- (void)setHasGrouping:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGrouping
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)groupingAsString:(int)a3
{
  if (a3 < 3)
    return off_24D762808[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGrouping:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Section")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Off")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
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
  v8.super_class = (Class)BLTPBSetNotificationsGroupingRequest;
  -[BLTPBSetNotificationsGroupingRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBSetNotificationsGroupingRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t grouping;
  __CFString *v5;
  NSString *sectionID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    grouping = self->_grouping;
    if (grouping >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_grouping);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24D762808[grouping];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("grouping"));

  }
  sectionID = self->_sectionID;
  if (sectionID)
    objc_msgSend(v3, "setObject:forKey:", sectionID, CFSTR("sectionID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSetNotificationsGroupingRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_sectionID)
  {
    PBDataWriterWriteStringField();
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
    v4[2] = self->_grouping;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_sectionID)
  {
    v5 = v4;
    objc_msgSend(v4, "setSectionID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_grouping;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_sectionID, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sectionID;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_grouping != *((_DWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](sectionID, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_grouping;
  else
    v2 = 0;
  return -[NSString hash](self->_sectionID, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[6] & 1) != 0)
  {
    self->_grouping = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[BLTPBSetNotificationsGroupingRequest setSectionID:](self, "setSectionID:");
    v4 = v5;
  }

}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_sectionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end
