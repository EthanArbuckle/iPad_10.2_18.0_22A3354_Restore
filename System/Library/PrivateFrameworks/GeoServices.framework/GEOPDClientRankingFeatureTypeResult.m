@implementation GEOPDClientRankingFeatureTypeResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDClientRankingFeatureTypeResult;
  -[GEOPDClientRankingFeatureTypeResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDClientRankingFeatureTypeResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientRankingFeatureTypeResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 20) & 1) != 0)
  {
    v5 = *(int *)(a1 + 16);
    if (v5 >= 0x2A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C056F8[v5];
    }
    if (a2)
      v7 = CFSTR("resultFeature");
    else
      v7 = CFSTR("result_feature");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
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
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __65__GEOPDClientRankingFeatureTypeResult__dictionaryRepresentation___block_invoke;
      v15[3] = &unk_1E1C00600;
      v12 = v11;
      v16 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDClientRankingFeatureTypeResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __65__GEOPDClientRankingFeatureTypeResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;
  int v10;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("resultFeature");
    else
      v7 = CFSTR("result_feature");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNKNOWN_RESULT_FEATURE")) & 1) != 0)
      {
        v10 = 0;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SHOWN_TO_USER")) & 1) != 0)
      {
        v10 = 1;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FRACTION_OF_MATCH")) & 1) != 0)
      {
        v10 = 2;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("DISTANCE_TO_SUGGESTION")) & 1) != 0)
      {
        v10 = 3;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONTACT_RELEVANCE_SCORE")) & 1) != 0)
      {
        v10 = 4;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MATCHED_USING_NAME")) & 1) != 0)
      {
        v10 = 5;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MATCHED_USING_ORGANIZATION")) & 1) != 0)
      {
        v10 = 6;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MATCHED_USING_ADDRESS")) & 1) != 0)
      {
        v10 = 7;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MATCHED_USING_LABEL")) & 1) != 0)
      {
        v10 = 8;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MATCHED_USING_EVENT_NAME")) & 1) != 0)
      {
        v10 = 9;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PEOPLE_SUGGESTER_RANK")) & 1) != 0)
      {
        v10 = 10;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AGE")) & 1) != 0)
      {
        v10 = 11;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("IS_FAVORITE")) & 1) != 0)
      {
        v10 = 12;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("POI_OPEN_STATE_CURRENTLY_CLOSED")) & 1) != 0)
      {
        v10 = 13;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("POI_OPEN_STATE_PERMANENTLY_CLOSED")) & 1) != 0)
      {
        v10 = 14;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("POI_OPEN_STATE_IS_OPENING_SOON")) & 1) != 0)
      {
        v10 = 15;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("POI_OPEN_STATE_IS_CLOSING_SOON")) & 1) != 0)
      {
        v10 = 16;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MAPS_SUGGEST_CONTACT_RELEVANCE_SCORE")) & 1) != 0)
      {
        v10 = 17;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MAPS_SUGGEST_POI_RELEVANCE_SCORE")) & 1) != 0)
      {
        v10 = 18;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MAPS_SUGGEST_IS_TOURIST_SCORE")) & 1) != 0)
      {
        v10 = 19;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MAPS_SUGGEST_TIME_SINCE_LAST_INTERACTED")) & 1) != 0)
      {
        v10 = 20;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("DISTANCE_TO_SUGGESTION_FROM_VIEWPORT_CENTER")) & 1) != 0)
      {
        v10 = 21;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("IS_CONTAINED_IN_VIEWPORT")) & 1) != 0)
      {
        v10 = 22;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("TIME_SINCE_MAP_VIEWPORT_CHANGED_SECONDS")) & 1) != 0)
      {
        v10 = 23;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONTACT_WITH_HOME_LOCATION")) & 1) != 0)
      {
        v10 = 24;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONTACT_WITH_WORK_LOCATION")) & 1) != 0)
      {
        v10 = 25;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONTACT_WITH_SCHOOL_LOCATION")) & 1) != 0)
      {
        v10 = 26;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONTACT_WITH_OTHER_LOCATION")) & 1) != 0)
      {
        v10 = 27;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONTACT_WITH_LIVE_LOCATION")) & 1) != 0)
      {
        v10 = 28;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONTACT_WITH_NO_LOCATION")) & 1) != 0)
      {
        v10 = 29;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PREFIX_LAST_TOKEN_MATCH_COVER")) & 1) != 0)
      {
        v10 = 30;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PREFIX_MATCH_COVER")) & 1) != 0)
      {
        v10 = 31;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PREFIX_MATCH_POSITION")) & 1) != 0)
      {
        v10 = 32;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PREFIX_MATCH_WORD_BOUNDARY")) & 1) != 0)
      {
        v10 = 33;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PREFIX_TOKEN_MATCH_LENGTH_FIRST_QUERY_TOKEN")) & 1) != 0)
      {
        v10 = 34;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PREFIX_TOKEN_MATCH_POSITION_FIRST_QUERY_TOKEN")) & 1) != 0)
      {
        v10 = 35;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PREFIX_TOKEN_IS_NUMBER_FIRST_QUERY_TOKEN")) & 1) != 0)
      {
        v10 = 36;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PREFIX_TOKEN_MATCH_LOCATION_FIRST_QUERY_TOKEN")) & 1) != 0)
      {
        v10 = 37;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PREFIX_TOKEN_MATCH_LENGTH_SECOND_QUERY_TOKEN")) & 1) != 0)
      {
        v10 = 38;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PREFIX_TOKEN_MATCH_POSITION_SECOND_QUERY_TOKEN")) & 1) != 0)
      {
        v10 = 39;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PREFIX_TOKEN_IS_NUMBER_SECOND_QUERY_TOKEN")) & 1) != 0)
      {
        v10 = 40;
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("PREFIX_TOKEN_MATCH_LOCATION_SECOND_QUERY_TOKEN")))
      {
        v10 = 41;
      }
      else
      {
        v10 = 0;
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
      v10 = objc_msgSend(v8, "intValue");
    }
    *(_BYTE *)(v6 + 20) |= 1u;
    *(_DWORD *)(v6 + 16) = v10;
    goto LABEL_95;
  }
LABEL_96:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientRankingFeatureTypeResultReadAllFrom((uint64_t)self, a3);
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
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 16) = self->_resultFeature;
    *(_BYTE *)(v4 + 20) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  v5 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_resultFeature == *((_DWORD *)v4 + 4))
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
    return 2654435761 * self->_resultFeature;
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
