@implementation GEOPDSearchBrandRelationship

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchBrandRelationship;
  -[GEOPDSearchBrandRelationship description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchBrandRelationship dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchBrandRelationship _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (!a1)
  {
    v5 = 0;
    return v5;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v4, "setObject:forKey:");
  v6 = *(_BYTE *)(a1 + 40);
  if ((v6 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("muid"));

    v6 = *(_BYTE *)(a1 + 40);
    if ((v6 & 4) == 0)
    {
LABEL_6:
      if ((v6 & 1) == 0)
        return v5;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)(a1 + 40) & 4) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v9 = CFSTR("parentMuid");
  else
    v9 = CFSTR("parent_muid");
  objc_msgSend(v5, "setObject:forKey:", v8, v9);

  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("expandedParentMuid");
    else
      v11 = CFSTR("expanded_parent_muid");
    objc_msgSend(v5, "setObject:forKey:", v10, v11);

  }
  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchBrandRelationship _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;

  v5 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("relationshipType");
      else
        v6 = CFSTR("relationship_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        v9 = v8;
        objc_storeStrong((id *)(a1 + 32), v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "unsignedLongLongValue");
        *(_BYTE *)(a1 + 40) |= 2u;
        *(_QWORD *)(a1 + 16) = v11;
      }

      if (a3)
        v12 = CFSTR("parentMuid");
      else
        v12 = CFSTR("parent_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_msgSend(v13, "unsignedLongLongValue");
        *(_BYTE *)(a1 + 40) |= 4u;
        *(_QWORD *)(a1 + 24) = v14;
      }

      if (a3)
        v15 = CFSTR("expandedParentMuid");
      else
        v15 = CFSTR("expanded_parent_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "unsignedLongLongValue");
        *(_BYTE *)(a1 + 40) |= 1u;
        *(_QWORD *)(a1 + 8) = v17;
      }

    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBrandRelationshipReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_relationshipType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteUint64Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteUint64Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_relationshipType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 24) = self->_parentMuid;
    *(_BYTE *)(v5 + 40) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 16) = self->_muid;
  *(_BYTE *)(v5 + 40) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 8) = self->_expandedParentMuid;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *relationshipType;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  relationshipType = self->_relationshipType;
  if ((unint64_t)relationshipType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](relationshipType, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_muid != *((_QWORD *)v4 + 2))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_parentMuid != *((_QWORD *)v4 + 3))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_expandedParentMuid != *((_QWORD *)v4 + 1))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_relationshipType, "hash");
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761u * self->_muid;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761u * self->_parentMuid;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761u * self->_expandedParentMuid;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipType, 0);
}

@end
