@implementation GEORestrictionZoneInfo

- (NSMutableArray)restrictedZoneIds
{
  return self->_restrictedZoneIds;
}

- (void)setRestrictedZoneIds:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedZoneIds, a3);
}

- (void)clearRestrictedZoneIds
{
  -[NSMutableArray removeAllObjects](self->_restrictedZoneIds, "removeAllObjects");
}

- (void)addRestrictedZoneIds:(id)a3
{
  id v4;
  NSMutableArray *restrictedZoneIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  restrictedZoneIds = self->_restrictedZoneIds;
  v8 = v4;
  if (!restrictedZoneIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_restrictedZoneIds;
    self->_restrictedZoneIds = v6;

    v4 = v8;
    restrictedZoneIds = self->_restrictedZoneIds;
  }
  -[NSMutableArray addObject:](restrictedZoneIds, "addObject:", v4);

}

- (unint64_t)restrictedZoneIdsCount
{
  return -[NSMutableArray count](self->_restrictedZoneIds, "count");
}

- (id)restrictedZoneIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_restrictedZoneIds, "objectAtIndex:", a3);
}

+ (Class)restrictedZoneIdsType
{
  return (Class)objc_opt_class();
}

- (int)licensePlateRestrictionImpact
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_licensePlateRestrictionImpact;
  else
    return 0;
}

- (void)setLicensePlateRestrictionImpact:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_licensePlateRestrictionImpact = a3;
}

- (void)setHasLicensePlateRestrictionImpact:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLicensePlateRestrictionImpact
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)licensePlateRestrictionImpactAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C08510[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLicensePlateRestrictionImpact:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)environmentalCongestionZoneImpact
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_environmentalCongestionZoneImpact;
  else
    return 0;
}

- (void)setEnvironmentalCongestionZoneImpact:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_environmentalCongestionZoneImpact = a3;
}

- (void)setHasEnvironmentalCongestionZoneImpact:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEnvironmentalCongestionZoneImpact
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)environmentalCongestionZoneImpactAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C08510[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEnvironmentalCongestionZoneImpact:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)tollCongestionZoneImpact
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_tollCongestionZoneImpact;
  else
    return 0;
}

- (void)setTollCongestionZoneImpact:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_tollCongestionZoneImpact = a3;
}

- (void)setHasTollCongestionZoneImpact:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTollCongestionZoneImpact
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)tollCongestionZoneImpactAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C08510[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTollCongestionZoneImpact:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
  {
    v4 = 7;
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
  v8.super_class = (Class)GEORestrictionZoneInfo;
  -[GEORestrictionZoneInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORestrictionZoneInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORestrictionZoneInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  char v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v6 = *(id *)(a1 + 16);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("restrictedZoneIds");
    else
      v13 = CFSTR("restricted_zone_ids");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  v14 = *(_BYTE *)(a1 + 36);
  if ((v14 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 36) & 1) == 0)
      goto LABEL_19;
LABEL_28:
    v18 = *(int *)(a1 + 24);
    if (v18 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E1C08510[v18];
    }
    if (a2)
      v20 = CFSTR("environmentalCongestionZoneImpact");
    else
      v20 = CFSTR("environmental_congestion_zone_impact");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

    if ((*(_BYTE *)(a1 + 36) & 4) == 0)
      goto LABEL_42;
    goto LABEL_35;
  }
  v15 = *(int *)(a1 + 28);
  if (v15 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 28));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E1C08510[v15];
  }
  if (a2)
    v17 = CFSTR("licensePlateRestrictionImpact");
  else
    v17 = CFSTR("license_plate_restriction_impact");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v14 = *(_BYTE *)(a1 + 36);
  if ((v14 & 1) != 0)
    goto LABEL_28;
LABEL_19:
  if ((v14 & 4) != 0)
  {
LABEL_35:
    v21 = *(int *)(a1 + 32);
    if (v21 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E1C08510[v21];
    }
    if (a2)
      v23 = CFSTR("tollCongestionZoneImpact");
    else
      v23 = CFSTR("toll_congestion_zone_impact");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
LABEL_42:
  v24 = *(void **)(a1 + 8);
  if (v24)
  {
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __52__GEORestrictionZoneInfo__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E1C00600;
      v28 = v27;
      v32 = v28;
      objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v31);
      v29 = v28;

      v26 = v29;
    }
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORestrictionZoneInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEORestrictionZoneInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORestrictionZoneInfo)initWithDictionary:(id)a3
{
  return (GEORestrictionZoneInfo *)-[GEORestrictionZoneInfo _initWithDictionary:isJSON:](self, a3, 0);
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
  uint64_t i;
  uint64_t v13;
  GEORestrictedZoneId *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("restrictedZoneIds");
      else
        v6 = CFSTR("restricted_zone_ids");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = v5;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v32 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEORestrictedZoneId alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEORestrictedZoneId initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEORestrictedZoneId initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addRestrictedZoneIds:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          }
          while (v10);
        }

        v5 = v30;
      }

      if (a3)
        v17 = CFSTR("licensePlateRestrictionImpact");
      else
        v17 = CFSTR("license_plate_restriction_impact");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v18;
        if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
        {
          v20 = 0;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
        {
          v20 = 1;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
        {
          v20 = 2;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
        {
          v20 = 3;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
        {
          v20 = 4;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
        {
          v20 = 5;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
        {
          v20 = 6;
        }
        else if (objc_msgSend(v19, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
        {
          v20 = 7;
        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_45;
        v20 = objc_msgSend(v18, "intValue");
      }
      objc_msgSend(a1, "setLicensePlateRestrictionImpact:", v20);
LABEL_45:

      if (a3)
        v21 = CFSTR("environmentalCongestionZoneImpact");
      else
        v21 = CFSTR("environmental_congestion_zone_impact");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v22;
        if ((objc_msgSend(v23, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
        {
          v24 = 0;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
        {
          v24 = 1;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
        {
          v24 = 2;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
        {
          v24 = 3;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
        {
          v24 = 4;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
        {
          v24 = 5;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
        {
          v24 = 6;
        }
        else if (objc_msgSend(v23, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
        {
          v24 = 7;
        }
        else
        {
          v24 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_70;
        v24 = objc_msgSend(v22, "intValue");
      }
      objc_msgSend(a1, "setEnvironmentalCongestionZoneImpact:", v24);
LABEL_70:

      if (a3)
        v25 = CFSTR("tollCongestionZoneImpact");
      else
        v25 = CFSTR("toll_congestion_zone_impact");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = v26;
        if ((objc_msgSend(v27, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
        {
          v28 = 0;
        }
        else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
        {
          v28 = 1;
        }
        else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
        {
          v28 = 2;
        }
        else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
        {
          v28 = 3;
        }
        else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
        {
          v28 = 4;
        }
        else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
        {
          v28 = 5;
        }
        else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
        {
          v28 = 6;
        }
        else if (objc_msgSend(v27, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
        {
          v28 = 7;
        }
        else
        {
          v28 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_95:

          goto LABEL_96;
        }
        v28 = objc_msgSend(v26, "intValue");
      }
      objc_msgSend(a1, "setTollCongestionZoneImpact:", v28);
      goto LABEL_95;
    }
  }
LABEL_96:

  return a1;
}

- (GEORestrictionZoneInfo)initWithJSON:(id)a3
{
  return (GEORestrictionZoneInfo *)-[GEORestrictionZoneInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORestrictionZoneInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORestrictionZoneInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_restrictedZoneIds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_10;
LABEL_14:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_14;
LABEL_10:
  if ((flags & 4) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_restrictedZoneIds;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  id v9;

  v9 = a3;
  -[GEORestrictionZoneInfo readAll:](self, "readAll:", 0);
  if (-[GEORestrictionZoneInfo restrictedZoneIdsCount](self, "restrictedZoneIdsCount"))
  {
    objc_msgSend(v9, "clearRestrictedZoneIds");
    v4 = -[GEORestrictionZoneInfo restrictedZoneIdsCount](self, "restrictedZoneIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORestrictionZoneInfo restrictedZoneIdsAtIndex:](self, "restrictedZoneIdsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addRestrictedZoneIds:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
LABEL_11:
    *((_DWORD *)v9 + 6) = self->_environmentalCongestionZoneImpact;
    *((_BYTE *)v9 + 36) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_DWORD *)v9 + 7) = self->_licensePlateRestrictionImpact;
  *((_BYTE *)v9 + 36) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_11;
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v9 + 8) = self->_tollCongestionZoneImpact;
    *((_BYTE *)v9 + 36) |= 4u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char flags;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_restrictedZoneIds;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend((id)v5, "addRestrictedZoneIds:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_10;
LABEL_14:
    *(_DWORD *)(v5 + 24) = self->_environmentalCongestionZoneImpact;
    *(_BYTE *)(v5 + 36) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  *(_DWORD *)(v5 + 28) = self->_licensePlateRestrictionImpact;
  *(_BYTE *)(v5 + 36) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_14;
LABEL_10:
  if ((flags & 4) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 32) = self->_tollCongestionZoneImpact;
    *(_BYTE *)(v5 + 36) |= 4u;
  }
LABEL_12:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *restrictedZoneIds;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEORestrictionZoneInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  restrictedZoneIds = self->_restrictedZoneIds;
  if ((unint64_t)restrictedZoneIds | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](restrictedZoneIds, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_licensePlateRestrictionImpact != *((_DWORD *)v4 + 7))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_environmentalCongestionZoneImpact != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_tollCongestionZoneImpact != *((_DWORD *)v4 + 8))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEORestrictionZoneInfo readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_restrictedZoneIds, "hash");
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_licensePlateRestrictionImpact;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_environmentalCongestionZoneImpact;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_tollCongestionZoneImpact;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[GEORestrictionZoneInfo addRestrictedZoneIds:](self, "addRestrictedZoneIds:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 36);
  if ((v10 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
      goto LABEL_10;
LABEL_14:
    self->_environmentalCongestionZoneImpact = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_flags |= 1u;
    if ((*((_BYTE *)v4 + 36) & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  self->_licensePlateRestrictionImpact = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_flags |= 2u;
  v10 = *((_BYTE *)v4 + 36);
  if ((v10 & 1) != 0)
    goto LABEL_14;
LABEL_10:
  if ((v10 & 4) != 0)
  {
LABEL_11:
    self->_tollCongestionZoneImpact = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_12:

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORestrictionZoneInfo readAll:](self, "readAll:", 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_restrictedZoneIds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedZoneIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
