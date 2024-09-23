@implementation GEOPDSearchRewrittenQueryNonPayloadField

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchRewrittenQueryNonPayloadField;
  -[GEOPDSearchRewrittenQueryNonPayloadField description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchRewrittenQueryNonPayloadField dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchRewrittenQueryNonPayloadField _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  char v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  const __CFString *v22;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 27));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("hasNumericSplit");
    else
      v7 = CFSTR("has_numeric_split");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 32);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("hasCamelCase");
    else
      v14 = CFSTR("has_camel_case");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

    v5 = *(_BYTE *)(a1 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 0x40) == 0)
        goto LABEL_10;
LABEL_28:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 28));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v18 = CFSTR("hasSynonymCounterpart");
      else
        v18 = CFSTR("has_synonym_counterPart");
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

      if ((*(_BYTE *)(a1 + 32) & 0x10) == 0)
        goto LABEL_15;
      goto LABEL_11;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 25));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v16 = CFSTR("hasDirectionsIntent");
  else
    v16 = CFSTR("has_directions_intent");
  objc_msgSend(v4, "setObject:forKey:", v15, v16);

  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 0x40) != 0)
    goto LABEL_28;
LABEL_10:
  if ((v5 & 0x10) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 26));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("hasEmojiRewrite");
    else
      v9 = CFSTR("has_emoji_rewrite");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
LABEL_15:
  if (*(_QWORD *)(a1 + 8))
    objc_msgSend(v4, "setObject:forKey:");
  v10 = *(_BYTE *)(a1 + 32);
  if ((v10 & 1) != 0)
  {
    v11 = *(int *)(a1 + 16);
    if (v11 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C0A978[v11];
    }
    if (a2)
      v19 = CFSTR("pipelineType");
    else
      v19 = CFSTR("pipeline_type");
    objc_msgSend(v4, "setObject:forKey:", v12, v19);

    v10 = *(_BYTE *)(a1 + 32);
  }
  if ((v10 & 2) != 0)
  {
    v20 = *(int *)(a1 + 20);
    if (v20 >= 0x17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E1C0A998[v20];
    }
    if (a2)
      v22 = CFSTR("rewrittenQueryType");
    else
      v22 = CFSTR("rewritten_query_type");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchRewrittenQueryNonPayloadField _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchRewrittenQueryNonPayloadFieldReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  char v5;
  id v6;

  v6 = a3;
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:
  if (self->_rewrittenQuery)
    PBDataWriterWriteStringField();
  v5 = (char)self->_flags;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (char)self->_flags;
  }
  if ((v5 & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _BYTE *v6;
  char flags;
  uint64_t v8;
  void *v9;
  char v10;

  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    v5[27] = self->_hasNumericSplit;
    v5[32] |= 0x20u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[24] = self->_hasCamelCase;
  v5[32] |= 4u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5[25] = self->_hasDirectionsIntent;
  v5[32] |= 8u;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  v5[28] = self->_hasSynonymCounterpart;
  v5[32] |= 0x40u;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    v5[26] = self->_hasEmojiRewrite;
    v5[32] |= 0x10u;
  }
LABEL_7:
  v8 = -[NSString copyWithZone:](self->_rewrittenQuery, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v6 + 1);
  *((_QWORD *)v6 + 1) = v8;

  v10 = (char)self->_flags;
  if ((v10 & 1) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_pipelineType;
    v6[32] |= 1u;
    v10 = (char)self->_flags;
  }
  if ((v10 & 2) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_rewrittenQueryType;
    v6[32] |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *rewrittenQuery;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_54;
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 32);
  if ((flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x20) == 0)
      goto LABEL_54;
    if (self->_hasNumericSplit)
    {
      if (!*((_BYTE *)v4 + 27))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 27))
    {
      goto LABEL_54;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0)
      goto LABEL_54;
    if (self->_hasCamelCase)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_54;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0)
      goto LABEL_54;
    if (self->_hasDirectionsIntent)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_54;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x40) == 0)
      goto LABEL_54;
    if (self->_hasSynonymCounterpart)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_54;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x40) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0)
      goto LABEL_54;
    if (self->_hasEmojiRewrite)
    {
      if (!*((_BYTE *)v4 + 26))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 26))
    {
      goto LABEL_54;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_54;
  }
  rewrittenQuery = self->_rewrittenQuery;
  if (!((unint64_t)rewrittenQuery | *((_QWORD *)v4 + 1)))
    goto LABEL_45;
  if (!-[NSString isEqual:](rewrittenQuery, "isEqual:"))
  {
LABEL_54:
    v8 = 0;
    goto LABEL_55;
  }
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 32);
LABEL_45:
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_pipelineType != *((_DWORD *)v4 + 4))
      goto LABEL_54;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_54;
  }
  v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_rewrittenQueryType != *((_DWORD *)v4 + 5))
      goto LABEL_54;
    v8 = 1;
  }
LABEL_55:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    v3 = 2654435761 * self->_hasNumericSplit;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_hasCamelCase;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_hasDirectionsIntent;
    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_hasSynonymCounterpart;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_hasEmojiRewrite;
    goto LABEL_12;
  }
LABEL_11:
  v7 = 0;
LABEL_12:
  v8 = -[NSString hash](self->_rewrittenQuery, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v9 = 2654435761 * self->_pipelineType;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_14;
LABEL_16:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v8;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_16;
LABEL_14:
  v10 = 2654435761 * self->_rewrittenQueryType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenQuery, 0);
}

@end
