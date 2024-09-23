@implementation BLTPBSetSectionSubtypeParametersIconRequest

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (void)setSubtypeID:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_subtypeID = a3;
}

- (void)setHasSubtypeID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSubtypeID
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDefaultSubtype:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_defaultSubtype = a3;
}

- (void)setHasDefaultSubtype:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDefaultSubtype
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
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
  v8.super_class = (Class)BLTPBSetSectionSubtypeParametersIconRequest;
  -[BLTPBSetSectionSubtypeParametersIconRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBSetSectionSubtypeParametersIconRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sectionID;
  char has;
  void *v7;
  void *v8;
  BLTPBSectionIcon *icon;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sectionID = self->_sectionID;
  if (sectionID)
    objc_msgSend(v3, "setObject:forKey:", sectionID, CFSTR("sectionID"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_subtypeID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("subtypeID"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_defaultSubtype);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("defaultSubtype"));

  }
  icon = self->_icon;
  if (icon)
  {
    -[BLTPBSectionIcon dictionaryRepresentation](icon, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("icon"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSetSectionSubtypeParametersIconRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sectionID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_icon)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sectionID)
  {
    objc_msgSend(v4, "setSectionID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_subtypeID;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_defaultSubtype;
    *((_BYTE *)v4 + 36) |= 2u;
  }
  if (self->_icon)
  {
    objc_msgSend(v6, "setIcon:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sectionID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_subtypeID;
    *(_BYTE *)(v5 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_defaultSubtype;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v9 = -[BLTPBSectionIcon copyWithZone:](self->_icon, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sectionID;
  char v6;
  BLTPBSectionIcon *icon;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](sectionID, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_subtypeID != *((_QWORD *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_19;
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  if ((*((_BYTE *)v4 + 36) & 2) == 0)
    goto LABEL_13;
  if (!self->_defaultSubtype)
  {
    if (!*((_BYTE *)v4 + 32))
      goto LABEL_19;
    goto LABEL_13;
  }
  if (!*((_BYTE *)v4 + 32))
    goto LABEL_13;
LABEL_19:
  icon = self->_icon;
  if ((unint64_t)icon | *((_QWORD *)v4 + 2))
    v6 = -[BLTPBSectionIcon isEqual:](icon, "isEqual:");
  else
    v6 = 1;
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_sectionID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761u * self->_subtypeID;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[BLTPBSectionIcon hash](self->_icon, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_defaultSubtype;
  return v4 ^ v3 ^ v5 ^ -[BLTPBSectionIcon hash](self->_icon, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  BLTPBSectionIcon *icon;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[BLTPBSetSectionSubtypeParametersIconRequest setSectionID:](self, "setSectionID:");
    v4 = v8;
  }
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
  {
    self->_subtypeID = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_defaultSubtype = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 2u;
  }
  icon = self->_icon;
  v7 = *((_QWORD *)v4 + 2);
  if (icon)
  {
    if (v7)
    {
      -[BLTPBSectionIcon mergeFrom:](icon, "mergeFrom:");
LABEL_12:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[BLTPBSetSectionSubtypeParametersIconRequest setIcon:](self, "setIcon:");
    goto LABEL_12;
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

- (unint64_t)subtypeID
{
  return self->_subtypeID;
}

- (BOOL)defaultSubtype
{
  return self->_defaultSubtype;
}

- (BLTPBSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
