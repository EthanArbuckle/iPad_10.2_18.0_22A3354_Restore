@implementation GEORPFeedbackLayoutFormConfig

- (unsigned)ttl
{
  return self->_ttl;
}

- (void)setTtl:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_ttl = a3;
}

- (void)setHasTtl:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTtl
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)formType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_formType;
  else
    return 0;
}

- (void)setFormType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_formType = a3;
}

- (void)setHasFormType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFormType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)formTypeAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E1C134E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFormType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_WORKFLOW")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_POI_ADD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_POI_EDIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_ADDRESS_ADD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_ADDRESS_EDIT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_GROUNDVIEW")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_NEW_INCIDENT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_POI_IMAGE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_INCIDENT_VOTING")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSMutableArray)layoutFields
{
  return self->_layoutFields;
}

- (void)setLayoutFields:(id)a3
{
  objc_storeStrong((id *)&self->_layoutFields, a3);
}

- (void)clearLayoutFields
{
  -[NSMutableArray removeAllObjects](self->_layoutFields, "removeAllObjects");
}

- (void)addLayoutField:(id)a3
{
  id v4;
  NSMutableArray *layoutFields;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  layoutFields = self->_layoutFields;
  v8 = v4;
  if (!layoutFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_layoutFields;
    self->_layoutFields = v6;

    v4 = v8;
    layoutFields = self->_layoutFields;
  }
  -[NSMutableArray addObject:](layoutFields, "addObject:", v4);

}

- (unint64_t)layoutFieldsCount
{
  return -[NSMutableArray count](self->_layoutFields, "count");
}

- (id)layoutFieldAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_layoutFields, "objectAtIndex:", a3);
}

+ (Class)layoutFieldType
{
  return (Class)objc_opt_class();
}

- (BOOL)enabled
{
  return (*(_BYTE *)&self->_flags & 8) == 0 || self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasEnabled
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)radius
{
  return self->_radius;
}

- (void)setRadius:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRadius
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEORPFeedbackLayoutFormConfig;
  -[GEORPFeedbackLayoutFormConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackLayoutFormConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackLayoutFormConfig _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const __CFString *v18;
  char v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("ttl"));

    v5 = *(_BYTE *)(a1 + 32);
  }
  if ((v5 & 1) != 0)
  {
    v7 = *(int *)(a1 + 16);
    if (v7 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E1C134E8[v7];
    }
    if (a2)
      v9 = CFSTR("formType");
    else
      v9 = CFSTR("form_type");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = *(id *)(a1 + 8);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    if (a2)
      v18 = CFSTR("layoutField");
    else
      v18 = CFSTR("layout_field");
    objc_msgSend(v4, "setObject:forKey:", v10, v18);

  }
  v19 = *(_BYTE *)(a1 + 32);
  if ((v19 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 28));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("enabled"));

    v19 = *(_BYTE *)(a1 + 32);
  }
  if ((v19 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("radius"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackLayoutFormConfig _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackLayoutFormConfig)initWithDictionary:(id)a3
{
  return (GEORPFeedbackLayoutFormConfig *)-[GEORPFeedbackLayoutFormConfig _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  GEORPLayoutField *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_56;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_56;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ttl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTtl:", objc_msgSend(v6, "unsignedIntValue"));

  if (a3)
    v7 = CFSTR("formType");
  else
    v7 = CFSTR("form_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_UNKNOWN")) & 1) != 0)
    {
      v10 = 0;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_WORKFLOW")) & 1) != 0)
    {
      v10 = 1;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_POI_ADD")) & 1) != 0)
    {
      v10 = 2;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_POI_EDIT")) & 1) != 0)
    {
      v10 = 3;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_ADDRESS_ADD")) & 1) != 0)
    {
      v10 = 4;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_ADDRESS_EDIT")) & 1) != 0)
    {
      v10 = 5;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_GROUNDVIEW")) & 1) != 0)
    {
      v10 = 6;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_NEW_INCIDENT")) & 1) != 0)
    {
      v10 = 7;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_POI_IMAGE")) & 1) != 0)
    {
      v10 = 8;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_FORM_INCIDENT_VOTING")))
    {
      v10 = 9;
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v8, "intValue");
LABEL_33:
    objc_msgSend(a1, "setFormType:", v10);
  }

  if (a3)
    v11 = CFSTR("layoutField");
  else
    v11 = CFSTR("layout_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v5;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = [GEORPLayoutField alloc];
            if ((a3 & 1) != 0)
              v20 = -[GEORPLayoutField initWithJSON:](v19, "initWithJSON:", v18);
            else
              v20 = -[GEORPLayoutField initWithDictionary:](v19, "initWithDictionary:", v18);
            v21 = (void *)v20;
            objc_msgSend(a1, "addLayoutField:", v20);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

    v5 = v25;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEnabled:", objc_msgSend(v22, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("radius"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRadius:", objc_msgSend(v23, "unsignedIntValue"));

LABEL_56:
  return a1;
}

- (GEORPFeedbackLayoutFormConfig)initWithJSON:(id)a3
{
  return (GEORPFeedbackLayoutFormConfig *)-[GEORPFeedbackLayoutFormConfig _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackLayoutFormConfigIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackLayoutFormConfigReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_layoutFields;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = (char)self->_flags;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = (char)self->_flags;
  }
  if ((v11 & 2) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  _DWORD *v10;

  v10 = a3;
  -[GEORPFeedbackLayoutFormConfig readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v10[6] = self->_ttl;
    *((_BYTE *)v10 + 32) |= 4u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v10[4] = self->_formType;
    *((_BYTE *)v10 + 32) |= 1u;
  }
  if (-[GEORPFeedbackLayoutFormConfig layoutFieldsCount](self, "layoutFieldsCount"))
  {
    objc_msgSend(v10, "clearLayoutFields");
    v5 = -[GEORPFeedbackLayoutFormConfig layoutFieldsCount](self, "layoutFieldsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEORPFeedbackLayoutFormConfig layoutFieldAtIndex:](self, "layoutFieldAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addLayoutField:", v8);

      }
    }
  }
  v9 = (char)self->_flags;
  if ((v9 & 8) != 0)
  {
    *((_BYTE *)v10 + 28) = self->_enabled;
    *((_BYTE *)v10 + 32) |= 8u;
    v9 = (char)self->_flags;
  }
  if ((v9 & 2) != 0)
  {
    v10[5] = self->_radius;
    *((_BYTE *)v10 + 32) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_ttl;
    *(_BYTE *)(v5 + 32) |= 4u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_formType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_layoutFields;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend((id)v6, "addLayoutField:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (char)self->_flags;
  if ((v14 & 8) != 0)
  {
    *(_BYTE *)(v6 + 28) = self->_enabled;
    *(_BYTE *)(v6 + 32) |= 8u;
    v14 = (char)self->_flags;
  }
  if ((v14 & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_radius;
    *(_BYTE *)(v6 + 32) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *layoutFields;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEORPFeedbackLayoutFormConfig readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 32);
  if ((flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_ttl != *((_DWORD *)v4 + 6))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_formType != *((_DWORD *)v4 + 4))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_27;
  }
  layoutFields = self->_layoutFields;
  if ((unint64_t)layoutFields | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](layoutFields, "isEqual:"))
      goto LABEL_27;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 32);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) != 0)
    {
      if (self->_enabled)
      {
        if (!*((_BYTE *)v4 + 28))
          goto LABEL_27;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_23;
    }
LABEL_27:
    v8 = 0;
    goto LABEL_28;
  }
  if ((v6 & 8) != 0)
    goto LABEL_27;
LABEL_23:
  v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_radius != *((_DWORD *)v4 + 5))
      goto LABEL_27;
    v8 = 1;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEORPFeedbackLayoutFormConfig readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v3 = 2654435761 * self->_ttl;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_formType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSMutableArray hash](self->_layoutFields, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v6 = 2654435761 * self->_enabled;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_8;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_10;
LABEL_8:
  v7 = 2654435761 * self->_radius;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
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
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_ttl = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_flags |= 4u;
    v5 = *((_BYTE *)v4 + 32);
  }
  if ((v5 & 1) != 0)
  {
    self->_formType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v4 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[GEORPFeedbackLayoutFormConfig addLayoutField:](self, "addLayoutField:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = *((_BYTE *)v4 + 32);
  if ((v11 & 8) != 0)
  {
    self->_enabled = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_flags |= 8u;
    v11 = *((_BYTE *)v4 + 32);
  }
  if ((v11 & 2) != 0)
  {
    self->_radius = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutFields, 0);
}

@end
