@implementation GEOTrailingEntityActionDetails

- (int)trailingEntityType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_trailingEntityType;
  else
    return 0;
}

- (void)setTrailingEntityType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_trailingEntityType = a3;
}

- (void)setHasTrailingEntityType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTrailingEntityType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)trailingEntityTypeAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E1C238B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrailingEntityType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_THUMBNAIL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_FLYOVER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_LOOK_AROUND")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_CALL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_WEBSITE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_APP_CLIP")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_QUERY_ACCELERATOR")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS_NO_ETA")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_ADD_STOP")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_HIKE_ROUTE_SNAPSHOT")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDisplayedString
{
  return self->_displayedString != 0;
}

- (NSString)displayedString
{
  return self->_displayedString;
}

- (void)setDisplayedString:(id)a3
{
  objc_storeStrong((id *)&self->_displayedString, a3);
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
  v8.super_class = (Class)GEOTrailingEntityActionDetails;
  -[GEOTrailingEntityActionDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTrailingEntityActionDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrailingEntityActionDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      v5 = *(int *)(a1 + 16);
      if (v5 >= 0xC)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C238B8[v5];
      }
      if (a2)
        v7 = CFSTR("trailingEntityType");
      else
        v7 = CFSTR("trailing_entity_type");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    objc_msgSend((id)a1, "displayedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a2)
        v9 = CFSTR("displayedString");
      else
        v9 = CFSTR("displayed_string");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);
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
  return -[GEOTrailingEntityActionDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTrailingEntityActionDetails)initWithDictionary:(id)a3
{
  return (GEOTrailingEntityActionDetails *)-[GEOTrailingEntityActionDetails _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v12;

  v5 = a2;
  if (!a1)
    goto LABEL_42;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_42;
  if (a3)
    v6 = CFSTR("trailingEntityType");
  else
    v6 = CFSTR("trailing_entity_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_THUMBNAIL")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_FLYOVER")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_LOOK_AROUND")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_CALL")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_WEBSITE")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_APP_CLIP")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_QUERY_ACCELERATOR")) & 1) != 0)
    {
      v9 = 8;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS_NO_ETA")) & 1) != 0)
    {
      v9 = 9;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_ADD_STOP")) & 1) != 0)
    {
      v9 = 10;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_HIKE_ROUTE_SNAPSHOT")))
    {
      v9 = 11;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_35:
    objc_msgSend(a1, "setTrailingEntityType:", v9);
  }

  if (a3)
    v10 = CFSTR("displayedString");
  else
    v10 = CFSTR("displayed_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(a1, "setDisplayedString:", v12);

  }
LABEL_42:

  return a1;
}

- (GEOTrailingEntityActionDetails)initWithJSON:(id)a3
{
  return (GEOTrailingEntityActionDetails *)-[GEOTrailingEntityActionDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrailingEntityActionDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrailingEntityActionDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_displayedString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEOTrailingEntityActionDetails readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_trailingEntityType;
    *((_BYTE *)v5 + 20) |= 1u;
  }
  if (self->_displayedString)
  {
    objc_msgSend(v5, "setDisplayedString:");
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
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_trailingEntityType;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_displayedString, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *displayedString;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEOTrailingEntityActionDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_trailingEntityType != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  displayedString = self->_displayedString;
  if ((unint64_t)displayedString | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](displayedString, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOTrailingEntityActionDetails readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_trailingEntityType;
  else
    v3 = 0;
  return -[NSString hash](self->_displayedString, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[5] & 1) != 0)
  {
    self->_trailingEntityType = v5[4];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v5 + 1))
  {
    -[GEOTrailingEntityActionDetails setDisplayedString:](self, "setDisplayedString:");
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedString, 0);
}

@end
