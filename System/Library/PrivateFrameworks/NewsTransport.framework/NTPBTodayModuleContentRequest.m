@implementation NTPBTodayModuleContentRequest

- (void)setModuleDescriptorType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_moduleDescriptorType = a3;
}

- (void)setHasModuleDescriptorType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModuleDescriptorType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTagID
{
  return self->_tagID != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasNameColorLight
{
  return self->_nameColorLight != 0;
}

- (BOOL)hasNameColorDark
{
  return self->_nameColorDark != 0;
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
  v8.super_class = (Class)NTPBTodayModuleContentRequest;
  -[NTPBTodayModuleContentRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTodayModuleContentRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *tagID;
  NSString *name;
  NSString *nameColorLight;
  NSString *nameColorDark;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_moduleDescriptorType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("module_descriptor_type"));

  }
  tagID = self->_tagID;
  if (tagID)
    objc_msgSend(v3, "setObject:forKey:", tagID, CFSTR("tag_ID"));
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  nameColorLight = self->_nameColorLight;
  if (nameColorLight)
    objc_msgSend(v3, "setObject:forKey:", nameColorLight, CFSTR("name_color_light"));
  nameColorDark = self->_nameColorDark;
  if (nameColorDark)
    objc_msgSend(v3, "setObject:forKey:", nameColorDark, CFSTR("name_color_dark"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayModuleContentRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_tagID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_nameColorLight)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_nameColorDark)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_moduleDescriptorType;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_tagID, "copyWithZone:", a3);
  v8 = (void *)v6[5];
  v6[5] = v7;

  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[NSString copyWithZone:](self->_nameColorLight, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  v13 = -[NSString copyWithZone:](self->_nameColorDark, "copyWithZone:", a3);
  v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *tagID;
  NSString *name;
  NSString *nameColorLight;
  NSString *nameColorDark;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_moduleDescriptorType != *((_DWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  tagID = self->_tagID;
  if ((unint64_t)tagID | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](tagID, "isEqual:"))
    goto LABEL_15;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_15;
  }
  nameColorLight = self->_nameColorLight;
  if ((unint64_t)nameColorLight | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](nameColorLight, "isEqual:"))
      goto LABEL_15;
  }
  nameColorDark = self->_nameColorDark;
  if ((unint64_t)nameColorDark | *((_QWORD *)v4 + 3))
    v9 = -[NSString isEqual:](nameColorDark, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_moduleDescriptorType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_tagID, "hash") ^ v3;
  v5 = -[NSString hash](self->_name, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_nameColorLight, "hash");
  return v6 ^ -[NSString hash](self->_nameColorDark, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[12] & 1) != 0)
  {
    self->_moduleDescriptorType = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[NTPBTodayModuleContentRequest setTagID:](self, "setTagID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBTodayModuleContentRequest setName:](self, "setName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBTodayModuleContentRequest setNameColorLight:](self, "setNameColorLight:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBTodayModuleContentRequest setNameColorDark:](self, "setNameColorDark:");
    v4 = v5;
  }

}

- (int)moduleDescriptorType
{
  return self->_moduleDescriptorType;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void)setTagID:(id)a3
{
  objc_storeStrong((id *)&self->_tagID, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)nameColorLight
{
  return self->_nameColorLight;
}

- (void)setNameColorLight:(id)a3
{
  objc_storeStrong((id *)&self->_nameColorLight, a3);
}

- (NSString)nameColorDark
{
  return self->_nameColorDark;
}

- (void)setNameColorDark:(id)a3
{
  objc_storeStrong((id *)&self->_nameColorDark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_nameColorLight, 0);
  objc_storeStrong((id *)&self->_nameColorDark, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
