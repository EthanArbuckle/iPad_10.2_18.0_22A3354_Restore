@implementation GEOARElementDetails

- (int)arElementShown
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_arElementShown;
  else
    return 0;
}

- (void)setArElementShown:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_arElementShown = a3;
}

- (void)setHasArElementShown:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArElementShown
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)arElementShownAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C220C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArElementShown:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_ELEMENT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_ELEMENT_NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_ELEMENT_CONTINUE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_ELEMENT_MANEUVER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AR_ELEMENT_ARRIVAL")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)didUserSeeArLabel
{
  return self->_didUserSeeArLabel;
}

- (void)setDidUserSeeArLabel:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_didUserSeeArLabel = a3;
}

- (void)setHasDidUserSeeArLabel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDidUserSeeArLabel
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)didSafetyUiTraggier
{
  return self->_didSafetyUiTraggier;
}

- (void)setDidSafetyUiTraggier:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_didSafetyUiTraggier = a3;
}

- (void)setHasDidSafetyUiTraggier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDidSafetyUiTraggier
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
  v8.super_class = (Class)GEOARElementDetails;
  -[GEOARElementDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOARElementDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOARElementDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 16);
    if ((v5 & 1) != 0)
    {
      v6 = *(int *)(a1 + 8);
      if (v6 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C220C0[v6];
      }
      if (a2)
        v8 = CFSTR("arElementShown");
      else
        v8 = CFSTR("ar_element_shown");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

      v5 = *(_BYTE *)(a1 + 16);
    }
    if ((v5 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 13));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v10 = CFSTR("didUserSeeArLabel");
      else
        v10 = CFSTR("did_user_see_ar_label");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

      v5 = *(_BYTE *)(a1 + 16);
    }
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 12));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v12 = CFSTR("didSafetyUiTraggier");
      else
        v12 = CFSTR("did_safety_ui_traggier");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOARElementDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOARElementDetails)initWithDictionary:(id)a3
{
  return (GEOARElementDetails *)-[GEOARElementDetails _initWithDictionary:isJSON:](self, a3, 0);
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

  v5 = a2;
  if (!a1)
    goto LABEL_33;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_33;
  if (a3)
    v6 = CFSTR("arElementShown");
  else
    v6 = CFSTR("ar_element_shown");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_ELEMENT_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_ELEMENT_NONE")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_ELEMENT_CONTINUE")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_ELEMENT_MANEUVER")) & 1) != 0)
    {
      v9 = 3;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("AR_ELEMENT_ARRIVAL")))
    {
      v9 = 4;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_21:
    objc_msgSend(a1, "setArElementShown:", v9);
  }

  if (a3)
    v10 = CFSTR("didUserSeeArLabel");
  else
    v10 = CFSTR("did_user_see_ar_label");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDidUserSeeArLabel:", objc_msgSend(v11, "BOOLValue"));

  if (a3)
    v12 = CFSTR("didSafetyUiTraggier");
  else
    v12 = CFSTR("did_safety_ui_traggier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDidSafetyUiTraggier:", objc_msgSend(v13, "BOOLValue"));

LABEL_33:
  return a1;
}

- (GEOARElementDetails)initWithJSON:(id)a3
{
  return (GEOARElementDetails *)-[GEOARElementDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOARElementDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOARElementDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOARElementDetails readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v5[13] = self->_didUserSeeArLabel;
    v5[16] |= 4u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 2) = self->_arElementShown;
  v5[16] |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    v5[12] = self->_didSafetyUiTraggier;
    v5[16] |= 2u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_arElementShown;
    *((_BYTE *)result + 16) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 13) = self->_didUserSeeArLabel;
  *((_BYTE *)result + 16) |= 4u;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 12) = self->_didSafetyUiTraggier;
  *((_BYTE *)result + 16) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOARElementDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_arElementShown != *((_DWORD *)v4 + 2))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 16) & 1) != 0)
  {
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 4) == 0)
      goto LABEL_17;
    if (self->_didUserSeeArLabel)
    {
      if (!*((_BYTE *)v4 + 13))
        goto LABEL_17;
    }
    else if (*((_BYTE *)v4 + 13))
    {
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 16) & 4) != 0)
  {
    goto LABEL_17;
  }
  v5 = (*((_BYTE *)v4 + 16) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) != 0)
    {
      if (self->_didSafetyUiTraggier)
      {
        if (!*((_BYTE *)v4 + 12))
          goto LABEL_17;
      }
      else if (*((_BYTE *)v4 + 12))
      {
        goto LABEL_17;
      }
      v5 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v5 = 0;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOARElementDetails readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v3 = 2654435761 * self->_arElementShown;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_didUserSeeArLabel;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_didSafetyUiTraggier;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 1) == 0)
  {
    if ((*((_BYTE *)v5 + 16) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_didUserSeeArLabel = *((_BYTE *)v5 + 13);
    *(_BYTE *)&self->_flags |= 4u;
    if ((*((_BYTE *)v5 + 16) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_arElementShown = *((_DWORD *)v5 + 2);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 2) != 0)
  {
LABEL_4:
    self->_didSafetyUiTraggier = *((_BYTE *)v5 + 12);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_5:

}

@end
