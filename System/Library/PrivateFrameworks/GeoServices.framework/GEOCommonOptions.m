@implementation GEOCommonOptions

- (BOOL)includeTravelTimeAggressive
{
  return self->_includeTravelTimeAggressive;
}

- (void)setIncludeTravelTimeAggressive:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_includeTravelTimeAggressive = a3;
}

- (void)setHasIncludeTravelTimeAggressive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIncludeTravelTimeAggressive
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)includeTravelTimeEstimate
{
  return (*(_BYTE *)&self->_flags & 0x20) == 0 || self->_includeTravelTimeEstimate;
}

- (void)setIncludeTravelTimeEstimate:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_includeTravelTimeEstimate = a3;
}

- (void)setHasIncludeTravelTimeEstimate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIncludeTravelTimeEstimate
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)includeTravelTimeConservative
{
  return self->_includeTravelTimeConservative;
}

- (void)setIncludeTravelTimeConservative:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_includeTravelTimeConservative = a3;
}

- (void)setHasIncludeTravelTimeConservative:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIncludeTravelTimeConservative
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)excludeGuidance
{
  return (*(_BYTE *)&self->_flags & 1) != 0 && self->_excludeGuidance;
}

- (void)setExcludeGuidance:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_excludeGuidance = a3;
}

- (void)setHasExcludeGuidance:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasExcludeGuidance
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)includeSummaryForPredictedDestination
{
  return (*(_BYTE *)&self->_flags & 4) != 0 && self->_includeSummaryForPredictedDestination;
}

- (void)setIncludeSummaryForPredictedDestination:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_includeSummaryForPredictedDestination = a3;
}

- (void)setHasIncludeSummaryForPredictedDestination:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIncludeSummaryForPredictedDestination
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)includeSnapScoreMetadataDebug
{
  return self->_includeSnapScoreMetadataDebug;
}

- (void)setIncludeSnapScoreMetadataDebug:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_includeSnapScoreMetadataDebug = a3;
}

- (void)setHasIncludeSnapScoreMetadataDebug:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIncludeSnapScoreMetadataDebug
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)supportsArMode
{
  return self->_supportsArMode;
}

- (void)setSupportsArMode:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x40u;
  self->_supportsArMode = a3;
}

- (void)setHasSupportsArMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasSupportsArMode
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
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
  v8.super_class = (Class)GEOCommonOptions;
  -[GEOCommonOptions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCommonOptions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCommonOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 19));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("includeTravelTimeAggressive");
    else
      v16 = CFSTR("include_travel_time_aggressive");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 0x20) == 0)
    {
LABEL_4:
      if ((v5 & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)(a1 + 24) & 0x20) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 21));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("includeTravelTimeEstimate");
  else
    v18 = CFSTR("include_travel_time_estimate");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("includeTravelTimeConservative");
  else
    v20 = CFSTR("include_travel_time_conservative");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 16));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v22 = CFSTR("excludeGuidance");
  else
    v22 = CFSTR("exclude_guidance");
  objc_msgSend(v4, "setObject:forKey:", v21, v22);

  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0)
      goto LABEL_8;
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 17));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("includeSnapScoreMetadataDebug");
    else
      v26 = CFSTR("include_snap_score_metadata_debug");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

    if ((*(_BYTE *)(a1 + 24) & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_9;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 18));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v24 = CFSTR("includeSummaryForPredictedDestination");
  else
    v24 = CFSTR("include_summary_for_predicted_destination");
  objc_msgSend(v4, "setObject:forKey:", v23, v24);

  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 2) != 0)
    goto LABEL_39;
LABEL_8:
  if ((v5 & 0x40) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 22));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("supportsArMode");
    else
      v7 = CFSTR("supports_ar_mode");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_13:
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __46__GEOCommonOptions__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v12 = v11;
      v28 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v27);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCommonOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOCommonOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOCommonOptions)initWithDictionary:(id)a3
{
  return (GEOCommonOptions *)-[GEOCommonOptions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("includeTravelTimeAggressive");
      else
        v6 = CFSTR("include_travel_time_aggressive");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIncludeTravelTimeAggressive:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("includeTravelTimeEstimate");
      else
        v8 = CFSTR("include_travel_time_estimate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIncludeTravelTimeEstimate:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("includeTravelTimeConservative");
      else
        v10 = CFSTR("include_travel_time_conservative");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIncludeTravelTimeConservative:", objc_msgSend(v11, "BOOLValue"));

      if (a3)
        v12 = CFSTR("excludeGuidance");
      else
        v12 = CFSTR("exclude_guidance");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setExcludeGuidance:", objc_msgSend(v13, "BOOLValue"));

      if (a3)
        v14 = CFSTR("includeSummaryForPredictedDestination");
      else
        v14 = CFSTR("include_summary_for_predicted_destination");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIncludeSummaryForPredictedDestination:", objc_msgSend(v15, "BOOLValue"));

      if (a3)
        v16 = CFSTR("includeSnapScoreMetadataDebug");
      else
        v16 = CFSTR("include_snap_score_metadata_debug");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIncludeSnapScoreMetadataDebug:", objc_msgSend(v17, "BOOLValue"));

      if (a3)
        v18 = CFSTR("supportsArMode");
      else
        v18 = CFSTR("supports_ar_mode");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSupportsArMode:", objc_msgSend(v19, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOCommonOptions)initWithJSON:(id)a3
{
  return (GEOCommonOptions *)-[GEOCommonOptions _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCommonOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCommonOptionsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((flags & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOCommonOptions readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[19] = self->_includeTravelTimeAggressive;
    v5[24] |= 8u;
    flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v5[21] = self->_includeTravelTimeEstimate;
  v5[24] |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v5[20] = self->_includeTravelTimeConservative;
  v5[24] |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5[16] = self->_excludeGuidance;
  v5[24] |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0)
      goto LABEL_7;
LABEL_15:
    v5[17] = self->_includeSnapScoreMetadataDebug;
    v5[24] |= 2u;
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  v5[18] = self->_includeSummaryForPredictedDestination;
  v5[24] |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((flags & 0x40) != 0)
  {
LABEL_8:
    v5[22] = self->_supportsArMode;
    v5[24] |= 0x40u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_BYTE *)(v4 + 19) = self->_includeTravelTimeAggressive;
    *(_BYTE *)(v4 + 24) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v4 + 21) = self->_includeTravelTimeEstimate;
  *(_BYTE *)(v4 + 24) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(_BYTE *)(v4 + 20) = self->_includeTravelTimeConservative;
  *(_BYTE *)(v4 + 24) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *(_BYTE *)(v4 + 16) = self->_excludeGuidance;
  *(_BYTE *)(v4 + 24) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0)
      goto LABEL_7;
LABEL_15:
    *(_BYTE *)(v4 + 17) = self->_includeSnapScoreMetadataDebug;
    *(_BYTE *)(v4 + 24) |= 2u;
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  *(_BYTE *)(v4 + 18) = self->_includeSummaryForPredictedDestination;
  *(_BYTE *)(v4 + 24) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((flags & 0x40) != 0)
  {
LABEL_8:
    *(_BYTE *)(v4 + 22) = self->_supportsArMode;
    *(_BYTE *)(v4 + 24) |= 0x40u;
  }
LABEL_9:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[GEOCommonOptions readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((v4[24] & 8) == 0)
      goto LABEL_52;
    if (self->_includeTravelTimeAggressive)
    {
      if (!v4[19])
        goto LABEL_52;
    }
    else if (v4[19])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[24] & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((v4[24] & 0x20) == 0)
      goto LABEL_52;
    if (self->_includeTravelTimeEstimate)
    {
      if (!v4[21])
        goto LABEL_52;
    }
    else if (v4[21])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[24] & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((v4[24] & 0x10) == 0)
      goto LABEL_52;
    if (self->_includeTravelTimeConservative)
    {
      if (!v4[20])
        goto LABEL_52;
    }
    else if (v4[20])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[24] & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[24] & 1) == 0)
      goto LABEL_52;
    if (self->_excludeGuidance)
    {
      if (!v4[16])
        goto LABEL_52;
    }
    else if (v4[16])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[24] & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v4[24] & 4) == 0)
      goto LABEL_52;
    if (self->_includeSummaryForPredictedDestination)
    {
      if (!v4[18])
        goto LABEL_52;
    }
    else if (v4[18])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[24] & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[24] & 2) == 0)
      goto LABEL_52;
    if (self->_includeSnapScoreMetadataDebug)
    {
      if (!v4[17])
        goto LABEL_52;
    }
    else if (v4[17])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[24] & 2) != 0)
  {
    goto LABEL_52;
  }
  v5 = (v4[24] & 0x40) == 0;
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    if ((v4[24] & 0x40) != 0)
    {
      if (self->_supportsArMode)
      {
        if (!v4[22])
          goto LABEL_52;
      }
      else if (v4[22])
      {
        goto LABEL_52;
      }
      v5 = 1;
      goto LABEL_53;
    }
LABEL_52:
    v5 = 0;
  }
LABEL_53:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[GEOCommonOptions readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v3 = 2654435761 * self->_includeTravelTimeAggressive;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_includeTravelTimeEstimate;
      if ((*(_BYTE *)&self->_flags & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_includeTravelTimeConservative;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_excludeGuidance;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_includeSummaryForPredictedDestination;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_7;
LABEL_14:
    v8 = 0;
    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_14;
LABEL_7:
  v8 = 2654435761 * self->_includeSnapScoreMetadataDebug;
  if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v9 = 2654435761 * self->_supportsArMode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  BOOL v4;
  BOOL *v5;

  v5 = (BOOL *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5[24];
  if ((v4 & 8) != 0)
  {
    self->_includeTravelTimeAggressive = v5[19];
    *(_BYTE *)&self->_flags |= 8u;
    v4 = v5[24];
    if ((v4 & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v5[24] & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_includeTravelTimeEstimate = v5[21];
  *(_BYTE *)&self->_flags |= 0x20u;
  v4 = v5[24];
  if ((v4 & 0x10) == 0)
  {
LABEL_4:
    if (!v4)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_includeTravelTimeConservative = v5[20];
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = v5[24];
  if (!v4)
  {
LABEL_5:
    if ((v4 & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_excludeGuidance = v5[16];
  *(_BYTE *)&self->_flags |= 1u;
  v4 = v5[24];
  if ((v4 & 4) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0)
      goto LABEL_7;
LABEL_15:
    self->_includeSnapScoreMetadataDebug = v5[17];
    *(_BYTE *)&self->_flags |= 2u;
    if ((v5[24] & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  self->_includeSummaryForPredictedDestination = v5[18];
  *(_BYTE *)&self->_flags |= 4u;
  v4 = v5[24];
  if ((v4 & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v4 & 0x40) != 0)
  {
LABEL_8:
    self->_supportsArMode = v5[22];
    *(_BYTE *)&self->_flags |= 0x40u;
  }
LABEL_9:

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
    -[GEOCommonOptions readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
