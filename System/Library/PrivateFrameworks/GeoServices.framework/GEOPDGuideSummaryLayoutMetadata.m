@implementation GEOPDGuideSummaryLayoutMetadata

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGuideSummaryLayoutMetadata;
  -[GEOPDGuideSummaryLayoutMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGuideSummaryLayoutMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuideSummaryLayoutMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  const __CFString *v7;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 12) & 1) != 0)
    {
      v5 = *(_DWORD *)(a1 + 8);
      if (v5)
      {
        if (v5 == 1)
        {
          v6 = CFSTR("GUIDE_SUMMARY_CELL_WITH_COVER_PHOTO");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 8));
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v6 = CFSTR("GUIDE_SUMMARY_CELL_WITH_THUMBNAIL");
      }
      if (a2)
        v7 = CFSTR("guideSummaryType");
      else
        v7 = CFSTR("guide_summary_type");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

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
  return -[GEOPDGuideSummaryLayoutMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  int v9;

  v5 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("guideSummaryType");
      else
        v6 = CFSTR("guide_summary_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("GUIDE_SUMMARY_CELL_WITH_THUMBNAIL")) & 1) != 0)
          v9 = 0;
        else
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("GUIDE_SUMMARY_CELL_WITH_COVER_PHOTO"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_14:

          goto LABEL_15;
        }
        v9 = objc_msgSend(v7, "intValue");
      }
      *(_BYTE *)(a1 + 12) |= 1u;
      *(_DWORD *)(a1 + 8) = v9;
      goto LABEL_14;
    }
  }
LABEL_15:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGuideSummaryLayoutMetadataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_guideSummaryType;
    *((_BYTE *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  v5 = (*((_BYTE *)v4 + 12) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 12) & 1) != 0 && self->_guideSummaryType == *((_DWORD *)v4 + 2))
    {
      v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return 2654435761 * self->_guideSummaryType;
  else
    return 0;
}

- (void)mergeFrom:(uint64_t)a1
{
  _DWORD *v3;

  v3 = a2;
  if (a1 && (v3[3] & 1) != 0)
  {
    *(_DWORD *)(a1 + 8) = v3[2];
    *(_BYTE *)(a1 + 12) |= 1u;
  }

}

@end
