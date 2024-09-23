@implementation GEOGenericSubstitutes

- (BOOL)hasSubstitute
{
  return self->_substitute != 0;
}

- (GEOFormattedString)substitute
{
  return self->_substitute;
}

- (void)setSubstitute:(id)a3
{
  objc_storeStrong((id *)&self->_substitute, a3);
}

- (int)waypointCategory
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_waypointCategory;
  else
    return 0;
}

- (void)setWaypointCategory:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_waypointCategory = a3;
}

- (void)setHasWaypointCategory:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasWaypointCategory
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)waypointCategoryAsString:(int)a3
{
  if (a3 < 0xE)
    return off_1E1C085B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWaypointCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_UNSPECIFIED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_WORK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_HOME")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_WORK")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_HOME")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_OTHER")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_POI")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_ADDRESS")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_UNKNOWN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_CUSTOM")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_SCHOOL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_SCHOOL")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_PERSON_LOCATION")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_CUSTOM_LABEL_ADDRESS")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOGenericSubstitutes;
  -[GEOGenericSubstitutes description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOGenericSubstitutes dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOGenericSubstitutes _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "substitute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("substitute"));

  }
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    v8 = *(int *)(a1 + 24);
    if (v8 >= 0xE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E1C085B8[v8];
    }
    if (a2)
      v10 = CFSTR("waypointCategory");
    else
      v10 = CFSTR("waypoint_category");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  v11 = *(void **)(a1 + 8);
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51__GEOGenericSubstitutes__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOGenericSubstitutes _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOGenericSubstitutes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOGenericSubstitutes)initWithDictionary:(id)a3
{
  return (GEOGenericSubstitutes *)-[GEOGenericSubstitutes _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOFormattedString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("substitute"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOFormattedString initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOFormattedString initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setSubstitute:", v8);

      }
      if (a3)
        v10 = CFSTR("waypointCategory");
      else
        v10 = CFSTR("waypoint_category");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_UNSPECIFIED")) & 1) != 0)
        {
          v13 = 0;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_WORK")) & 1) != 0)
        {
          v13 = 1;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_HOME")) & 1) != 0)
        {
          v13 = 2;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_WORK")) & 1) != 0)
        {
          v13 = 3;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_HOME")) & 1) != 0)
        {
          v13 = 4;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_OTHER")) & 1) != 0)
        {
          v13 = 5;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_POI")) & 1) != 0)
        {
          v13 = 6;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_ADDRESS")) & 1) != 0)
        {
          v13 = 7;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_UNKNOWN")) & 1) != 0)
        {
          v13 = 8;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_CUSTOM")) & 1) != 0)
        {
          v13 = 9;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_SCHOOL")) & 1) != 0)
        {
          v13 = 10;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_SCHOOL")) & 1) != 0)
        {
          v13 = 11;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_PERSON_LOCATION")) & 1) != 0)
        {
          v13 = 12;
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_CUSTOM_LABEL_ADDRESS")))
        {
          v13 = 13;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_45:

          goto LABEL_46;
        }
        v13 = objc_msgSend(v11, "intValue");
      }
      objc_msgSend(a1, "setWaypointCategory:", v13);
      goto LABEL_45;
    }
  }
LABEL_46:

  return a1;
}

- (GEOGenericSubstitutes)initWithJSON:(id)a3
{
  return (GEOGenericSubstitutes *)-[GEOGenericSubstitutes _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOGenericSubstitutesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOGenericSubstitutesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_substitute)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOGenericSubstitutes readAll:](self, "readAll:", 0);
  if (self->_substitute)
    objc_msgSend(v4, "setSubstitute:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_waypointCategory;
    *((_BYTE *)v4 + 28) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOFormattedString copyWithZone:](self->_substitute, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_waypointCategory;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOFormattedString *substitute;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOGenericSubstitutes readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  substitute = self->_substitute;
  if ((unint64_t)substitute | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOFormattedString isEqual:](substitute, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_waypointCategory == *((_DWORD *)v4 + 6))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  -[GEOGenericSubstitutes readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_substitute, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_waypointCategory;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOFormattedString *substitute;
  uint64_t v5;
  int *v6;

  v6 = (int *)a3;
  objc_msgSend(v6, "readAll:", 0);
  substitute = self->_substitute;
  v5 = *((_QWORD *)v6 + 2);
  if (substitute)
  {
    if (v5)
      -[GEOFormattedString mergeFrom:](substitute, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOGenericSubstitutes setSubstitute:](self, "setSubstitute:");
  }
  if ((v6[7] & 1) != 0)
  {
    self->_waypointCategory = v6[6];
    *(_BYTE *)&self->_flags |= 1u;
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
    -[GEOGenericSubstitutes readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_substitute, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitute, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
