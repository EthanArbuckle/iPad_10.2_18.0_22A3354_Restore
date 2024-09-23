@implementation GEOLocalizationCapabilities

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)setSupportsLocalizedTrafficControlIcons:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_supportsLocalizedTrafficControlIcons = a3;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLocalizationCapabilities;
  -[GEOLocalizationCapabilities dealloc](&v3, sel_dealloc);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_supportedPhoneticTypes.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_supportedPhoneticTypes.count);
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (unint64_t)supportedPhoneticTypesCount
{
  return self->_supportedPhoneticTypes.count;
}

- (int)supportedPhoneticTypes
{
  return self->_supportedPhoneticTypes.list;
}

- (void)clearSupportedPhoneticTypes
{
  PBRepeatedInt32Clear();
}

- (void)addSupportedPhoneticType:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)supportedPhoneticTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedPhoneticTypes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_supportedPhoneticTypes = &self->_supportedPhoneticTypes;
  count = self->_supportedPhoneticTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_supportedPhoneticTypes->list[a3];
}

- (void)setSupportedPhoneticTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)supportedPhoneticTypesAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C13C28[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedPhoneticTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NUANCE_LHPLUS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNABBREVIATED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("XSAMPA")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)supportsLocalizedTrafficControlIcons
{
  return self->_supportsLocalizedTrafficControlIcons;
}

- (void)setHasSupportsLocalizedTrafficControlIcons:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSupportsLocalizedTrafficControlIcons
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOLocalizationCapabilities;
  -[GEOLocalizationCapabilities description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLocalizationCapabilities dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocalizationCapabilities _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v7 = 0;
      do
      {
        v8 = *(int *)(*v6 + 4 * v7);
        if (v8 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E1C13C28[v8];
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = (_QWORD *)(a1 + 16);
      }
      while (v7 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v10 = CFSTR("supportedPhoneticType");
    else
      v10 = CFSTR("supported_phonetic_type");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  if ((*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("supportsLocalizedTrafficControlIcons");
    else
      v12 = CFSTR("supports_localized_traffic_control_icons");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  v13 = *(void **)(a1 + 8);
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __57__GEOLocalizationCapabilities__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLocalizationCapabilities _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOLocalizationCapabilities__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLocalizationCapabilities)initWithDictionary:(id)a3
{
  return (GEOLocalizationCapabilities *)-[GEOLocalizationCapabilities _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v19;
  int v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("supportedPhoneticType");
      else
        v6 = CFSTR("supported_phonetic_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = a3;
        v21 = v5;
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v19 = v7;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (!v9)
          goto LABEL_26;
        v10 = v9;
        v11 = *(_QWORD *)v23;
        while (1)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = v13;
              if ((objc_msgSend(v14, "isEqualToString:", CFSTR("NUANCE_LHPLUS")) & 1) != 0)
              {
                v15 = 0;
              }
              else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("UNABBREVIATED")) & 1) != 0)
              {
                v15 = 1;
              }
              else if (objc_msgSend(v14, "isEqualToString:", CFSTR("XSAMPA")))
              {
                v15 = 2;
              }
              else
              {
                v15 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_24;
              v15 = objc_msgSend(v13, "intValue");
            }
            objc_msgSend(a1, "addSupportedPhoneticType:", v15);
LABEL_24:
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (!v10)
          {
LABEL_26:

            v5 = v21;
            a3 = v20;
            v7 = v19;
            break;
          }
        }
      }

      if (a3)
        v16 = CFSTR("supportsLocalizedTrafficControlIcons");
      else
        v16 = CFSTR("supports_localized_traffic_control_icons");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSupportsLocalizedTrafficControlIcons:", objc_msgSend(v17, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOLocalizationCapabilities)initWithJSON:(id)a3
{
  return (GEOLocalizationCapabilities *)-[GEOLocalizationCapabilities _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocalizationCapabilitiesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocalizationCapabilitiesReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  _BYTE *v7;

  v7 = a3;
  -[GEOLocalizationCapabilities readAll:](self, "readAll:", 0);
  if (-[GEOLocalizationCapabilities supportedPhoneticTypesCount](self, "supportedPhoneticTypesCount"))
  {
    objc_msgSend(v7, "clearSupportedPhoneticTypes");
    v4 = -[GEOLocalizationCapabilities supportedPhoneticTypesCount](self, "supportedPhoneticTypesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addSupportedPhoneticType:", -[GEOLocalizationCapabilities supportedPhoneticTypeAtIndex:](self, "supportedPhoneticTypeAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v7[40] = self->_supportsLocalizedTrafficControlIcons;
    v7[44] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v4 + 40) = self->_supportsLocalizedTrafficControlIcons;
    *(_BYTE *)(v4 + 44) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_5;
  -[GEOLocalizationCapabilities readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_5;
  v5 = (v4[44] & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[44] & 1) == 0)
    {
LABEL_5:
      v5 = 0;
      goto LABEL_6;
    }
    if (self->_supportsLocalizedTrafficControlIcons)
    {
      if (!v4[40])
        goto LABEL_5;
    }
    else if (v4[40])
    {
      goto LABEL_5;
    }
    v5 = 1;
  }
LABEL_6:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOLocalizationCapabilities readAll:](self, "readAll:", 1);
  v3 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_supportsLocalizedTrafficControlIcons;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL *v7;

  v7 = (BOOL *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = objc_msgSend(v7, "supportedPhoneticTypesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOLocalizationCapabilities addSupportedPhoneticType:](self, "addSupportedPhoneticType:", objc_msgSend(v7, "supportedPhoneticTypeAtIndex:", i));
  }
  if (v7[44])
  {
    self->_supportsLocalizedTrafficControlIcons = v7[40];
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
    -[GEOLocalizationCapabilities readAll:](self, "readAll:", 0);
}

@end
