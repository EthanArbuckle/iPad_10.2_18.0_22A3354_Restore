@implementation GEOPDGroupParams

- (int)groupButtonType
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_groupButtonType;
  else
    return 0;
}

- (void)setGroupButtonType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_groupButtonType = a3;
}

- (void)setHasGroupButtonType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasGroupButtonType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)groupButtonTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("GROUP_BUTTON_TYPE_ACTION");
  if (a3 == 1)
  {
    v3 = CFSTR("GROUP_BUTTON_TYPE_GROUP");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsGroupButtonType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_BUTTON_TYPE_ACTION")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_BUTTON_TYPE_GROUP"));

  return v4;
}

- (int)actionDataItemIndex
{
  return self->_actionDataItemIndex;
}

- (void)setActionDataItemIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_actionDataItemIndex = a3;
}

- (void)setHasActionDataItemIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasActionDataItemIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasGroupData
{
  return self->_groupData != 0;
}

- (GEOPDGroupData)groupData
{
  return self->_groupData;
}

- (void)setGroupData:(id)a3
{
  objc_storeStrong((id *)&self->_groupData, a3);
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
  v8.super_class = (Class)GEOPDGroupParams;
  -[GEOPDGroupParams description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGroupParams dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGroupParams _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  int v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 2) != 0)
  {
    v6 = *(_DWORD *)(a1 + 28);
    if (v6)
    {
      if (v6 == 1)
      {
        v7 = CFSTR("GROUP_BUTTON_TYPE_GROUP");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 28));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("GROUP_BUTTON_TYPE_ACTION");
    }
    if (a2)
      v8 = CFSTR("groupButtonType");
    else
      v8 = CFSTR("group_button_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 32);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("actionDataItemIndex");
    else
      v10 = CFSTR("action_data_item_index");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  objc_msgSend((id)a1, "groupData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("groupData");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("group_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  v15 = *(void **)(a1 + 8);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __46__GEOPDGroupParams__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v19 = v18;
      v23 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDGroupParams _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPDGroupParams__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOPDGroupParams)initWithDictionary:(id)a3
{
  return (GEOPDGroupParams *)-[GEOPDGroupParams _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  GEOPDGroupData *v14;
  uint64_t v15;
  void *v16;

  v5 = a2;
  if (!a1)
    goto LABEL_28;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_28;
  if (a3)
    v6 = CFSTR("groupButtonType");
  else
    v6 = CFSTR("group_button_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("GROUP_BUTTON_TYPE_ACTION")) & 1) != 0)
      v9 = 0;
    else
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("GROUP_BUTTON_TYPE_GROUP"));

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_13:
    objc_msgSend(a1, "setGroupButtonType:", v9);
  }

  if (a3)
    v10 = CFSTR("actionDataItemIndex");
  else
    v10 = CFSTR("action_data_item_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setActionDataItemIndex:", objc_msgSend(v11, "intValue"));

  if (a3)
    v12 = CFSTR("groupData");
  else
    v12 = CFSTR("group_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOPDGroupData alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEOPDGroupData initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEOPDGroupData initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = (void *)v15;
    objc_msgSend(a1, "setGroupData:", v15);

  }
LABEL_28:

  return a1;
}

- (GEOPDGroupParams)initWithJSON:(id)a3
{
  return (GEOPDGroupParams *)-[GEOPDGroupParams _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDGroupParamsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGroupParamsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_groupData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOPDGroupParams readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 7) = self->_groupButtonType;
    *((_BYTE *)v6 + 32) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_actionDataItemIndex;
    *((_BYTE *)v6 + 32) |= 1u;
  }
  if (self->_groupData)
  {
    objc_msgSend(v6, "setGroupData:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_groupButtonType;
    *(_BYTE *)(v5 + 32) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_actionDataItemIndex;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v8 = -[GEOPDGroupData copyWithZone:](self->_groupData, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDGroupData *groupData;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOPDGroupParams readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_groupButtonType != *((_DWORD *)v4 + 7))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_actionDataItemIndex != *((_DWORD *)v4 + 6))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_14;
  }
  groupData = self->_groupData;
  if ((unint64_t)groupData | *((_QWORD *)v4 + 2))
    v6 = -[GEOPDGroupData isEqual:](groupData, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOPDGroupParams readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_groupButtonType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ -[GEOPDGroupData hash](self->_groupData, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_actionDataItemIndex;
  return v4 ^ v3 ^ -[GEOPDGroupData hash](self->_groupData, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  GEOPDGroupData *groupData;
  uint64_t v7;
  int *v8;

  v8 = (int *)a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_BYTE *)v8 + 32);
  if ((v5 & 2) != 0)
  {
    self->_groupButtonType = v8[7];
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v8 + 32);
  }
  if ((v5 & 1) != 0)
  {
    self->_actionDataItemIndex = v8[6];
    *(_BYTE *)&self->_flags |= 1u;
  }
  groupData = self->_groupData;
  v7 = *((_QWORD *)v8 + 2);
  if (groupData)
  {
    if (v7)
    {
      -[GEOPDGroupData mergeFrom:](groupData, "mergeFrom:");
LABEL_10:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[GEOPDGroupParams setGroupData:](self, "setGroupData:");
    goto LABEL_10;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDGroupParams readAll:](self, "readAll:", 0);
    -[GEOPDGroupData clearUnknownFields:](self->_groupData, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupData, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
