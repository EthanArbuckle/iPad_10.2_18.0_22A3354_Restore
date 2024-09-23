@implementation GEOPDTransitIncident

+ (id)transitIncidentsForPlaceData:(id)a3 hasTransitIncidentComponent:(BOOL *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  BOOL *v12;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  if (a4)
    *a4 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__GEOPDTransitIncident_PlaceDataExtras__transitIncidentsForPlaceData_hasTransitIncidentComponent___block_invoke;
  v10[3] = &unk_1E1C09740;
  v12 = a4;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v6, "enumerateComponentOfType:enumerationOptions:usingBlock:", 20, 1, v10);

  return v8;
}

void __98__GEOPDTransitIncident_PlaceDataExtras__transitIncidentsForPlaceData_hasTransitIncidentComponent___block_invoke(uint64_t a1, id *a2)
{
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _GEOTransitIncident *v14;
  id obj;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = *(_BYTE **)(a1 + 40);
  if (v3)
    *v3 = 1;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[GEOPDComponent values](a2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v16 = *(_QWORD *)v22;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v6);
        if (v7 && *(_QWORD *)(v7 + 664))
        {
          -[GEOPDComponentValue transitIncident]((id *)v7);
          v8 = (id *)objc_claimAutoreleasedReturnValue();
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          -[GEOPDTransitIncident transitIncidents](v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v18;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v18 != v12)
                  objc_enumerationMutation(v9);
                v14 = -[_GEOTransitIncident initWithIncident:]([_GEOTransitIncident alloc], "initWithIncident:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
                if (v14)
                  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

                ++v13;
              }
              while (v11 != v13);
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v11);
          }

        }
        ++v6;
      }
      while (v6 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

}

+ (id)transitIncidentsTTLExpirationDateForPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__GEOPDTransitIncident_PlaceDataExtras__transitIncidentsTTLExpirationDateForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09768;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateComponentOfType:enumerationOptions:usingBlock:", 20, 1, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __87__GEOPDTransitIncident_PlaceDataExtras__transitIncidentsTTLExpirationDateForPlaceData___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  v17 = a2;
  v5 = objc_msgSend(v17, "hasTimestampFirstSeen");
  v6 = v17;
  if (v17 && v5 && (*((_WORD *)v17 + 50) & 0x40) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v17, "timestampFirstSeen");
    LODWORD(v8) = *((_DWORD *)v17 + 21);
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:", v9 + (double)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    if (v12)
    {
      objc_msgSend(v12, "earlierDate:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }
    else
    {
      v16 = v10;
      v15 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v16;
    }

    *a3 = 1;
    v6 = v17;
  }

}

- (id)transitIncidents
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

- (void)addTransitIncident:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

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
  v8.super_class = (Class)GEOPDTransitIncident;
  -[GEOPDTransitIncident description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTransitIncident dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitIncident _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = *(id *)(a1 + 16);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("transitIncident");
    else
      v13 = CFSTR("transit_incident");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  v14 = *(void **)(a1 + 8);
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __50__GEOPDTransitIncident__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v18 = v17;
      v22 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitIncident _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOPDTransitIncident__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitIncidentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_transitIncidents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_transitIncidents;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        -[GEOPDTransitIncident addTransitIncident:]((uint64_t)v5, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *transitIncidents;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    transitIncidents = self->_transitIncidents;
    if ((unint64_t)transitIncidents | v4[2])
      v6 = -[NSMutableArray isEqual:](transitIncidents, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_transitIncidents, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitIncidents, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
