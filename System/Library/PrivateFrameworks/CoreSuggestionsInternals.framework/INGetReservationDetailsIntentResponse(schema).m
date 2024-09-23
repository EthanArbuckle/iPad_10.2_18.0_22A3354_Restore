@implementation INGetReservationDetailsIntentResponse(schema)

- (id)toSchemas
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "reservationsContainUniqueItemReferences"))
  {
    v2 = (void *)objc_opt_new();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(a1, "reservations", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v8, "performSelector:", sel_schema);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v9;
            if (v9 && objc_msgSend(v9, "count"))
              objc_msgSend(v2, "addObject:", v10);

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)reservationsContainUniqueItemReferences
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint8_t v21[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a1, "reservations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {
    v17 = 1;
    goto LABEL_18;
  }
  v5 = v4;
  v6 = *(_QWORD *)v23;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v8, "itemReference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "vocabularyIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (!v11)
      {
        sgDeveloperLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          v19 = "Failed to process event suggestion – INReservation.itemReference.vocabularyIdentifier property is nil.";
LABEL_16:
          _os_log_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEFAULT, v19, v21, 2u);
        }
LABEL_17:

        v17 = 0;
        goto LABEL_18;
      }
      objc_msgSend(v8, "itemReference");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "vocabularyIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v2, "containsObject:", v13);

      if ((v14 & 1) != 0)
      {
        sgDeveloperLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          v19 = "Failed to process event suggestion – two or more INReservation objects share the same INReservation.item"
                "Reference.vocabularyIdentifier.";
          goto LABEL_16;
        }
        goto LABEL_17;
      }
      objc_msgSend(v8, "itemReference");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "vocabularyIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v16);

    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v17 = 1;
    if (v5)
      continue;
    break;
  }
LABEL_18:

  return v17;
}

+ (id)fromSchemas:()schema
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD900]), "initWithCode:userActivity:", 3, 0);
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(MEMORY[0x1E0CBD900], "reservationClassForSchema:", v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "performSelector:withObject:", sel_fromSchema_, v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v14, "setReservations:", v4);
  return v14;
}

+ (id)reservationClassForSchema:()schema
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("@type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (+[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, CFSTR("http://schema.org/FlightReservation"))|| +[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, CFSTR("http://schema.org/TrainReservation"))|| +[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, CFSTR("http://schema.org/RentalCarReservation"))|| +[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, CFSTR("http://schema.org/FoodEstablishmentReservation"))
     || +[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, CFSTR("http://schema.org/LodgingReservation"))|| +[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, CFSTR("http://schema.org/EventReservation"))|| +[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, CFSTR("http://schema.org/BusReservation"))|| +[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, CFSTR("http://schema.org/BoatReservation"))))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
