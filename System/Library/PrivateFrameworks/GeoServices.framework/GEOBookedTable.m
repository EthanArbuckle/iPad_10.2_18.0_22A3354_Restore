@implementation GEOBookedTable

- (BOOL)bookedUsingMaps
{
  return self->_bookedUsingMaps;
}

- (void)setBookedUsingMaps:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_bookedUsingMaps = a3;
}

- (void)setHasBookedUsingMaps:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasBookedUsingMaps
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_cancelled = a3;
}

- (void)setHasCancelled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasCancelled
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)viewedInProactiveTray
{
  return self->_viewedInProactiveTray;
}

- (void)setViewedInProactiveTray:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1000u;
  self->_viewedInProactiveTray = a3;
}

- (void)setHasViewedInProactiveTray:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xEFFF | v3;
}

- (BOOL)hasViewedInProactiveTray
{
  return (*(_WORD *)&self->_flags >> 12) & 1;
}

- (BOOL)tappedProactiveTrayItem
{
  return self->_tappedProactiveTrayItem;
}

- (void)setTappedProactiveTrayItem:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x200u;
  self->_tappedProactiveTrayItem = a3;
}

- (void)setHasTappedProactiveTrayItem:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasTappedProactiveTrayItem
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (BOOL)viewedInPlacecard
{
  return self->_viewedInPlacecard;
}

- (void)setViewedInPlacecard:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x800u;
  self->_viewedInPlacecard = a3;
}

- (void)setHasViewedInPlacecard:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v3;
}

- (BOOL)hasViewedInPlacecard
{
  return (*(_WORD *)&self->_flags >> 11) & 1;
}

- (BOOL)viewedDetailsFromPlacecard
{
  return self->_viewedDetailsFromPlacecard;
}

- (void)setViewedDetailsFromPlacecard:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_viewedDetailsFromPlacecard = a3;
}

- (void)setHasViewedDetailsFromPlacecard:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v3;
}

- (BOOL)hasViewedDetailsFromPlacecard
{
  return (*(_WORD *)&self->_flags >> 10) & 1;
}

- (BOOL)isAsync
{
  return self->_isAsync;
}

- (void)setIsAsync:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_isAsync = a3;
}

- (void)setHasIsAsync:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasIsAsync
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
  objc_storeStrong((id *)&self->_appId, a3);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)called
{
  return self->_called;
}

- (void)setCalled:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_called = a3;
}

- (void)setHasCalled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasCalled
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)routed
{
  return self->_routed;
}

- (void)setRouted:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_routed = a3;
}

- (void)setHasRouted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasRouted
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (BOOL)tappedChangeReservation
{
  return self->_tappedChangeReservation;
}

- (void)setTappedChangeReservation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_tappedChangeReservation = a3;
}

- (void)setHasTappedChangeReservation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasTappedChangeReservation
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (BOOL)tappedCancelReservation
{
  return self->_tappedCancelReservation;
}

- (void)setTappedCancelReservation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_tappedCancelReservation = a3;
}

- (void)setHasTappedCancelReservation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasTappedCancelReservation
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_shared = a3;
}

- (void)setHasShared:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasShared
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
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
  v8.super_class = (Class)GEOBookedTable;
  -[GEOBookedTable description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBookedTable dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBookedTable _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 36);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("bookedUsingMaps");
    else
      v7 = CFSTR("booked_using_maps");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_WORD *)(a1 + 36);
  }
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 26));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("cancelled"));

    v5 = *(_WORD *)(a1 + 36);
    if ((v5 & 0x1000) == 0)
    {
LABEL_9:
      if ((v5 & 0x200) == 0)
        goto LABEL_10;
      goto LABEL_34;
    }
  }
  else if ((v5 & 0x1000) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 35));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("viewedInProactiveTray");
  else
    v15 = CFSTR("viewed_in_proactive_tray");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  v5 = *(_WORD *)(a1 + 36);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_38;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v17 = CFSTR("tappedProactiveTrayItem");
  else
    v17 = CFSTR("tapped_proactive_tray_item");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v5 = *(_WORD *)(a1 + 36);
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 34));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("viewedInPlacecard");
  else
    v19 = CFSTR("viewed_in_placecard");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  v5 = *(_WORD *)(a1 + 36);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_13;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 33));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("viewedDetailsFromPlacecard");
  else
    v21 = CFSTR("viewed_details_from_placecard");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  if ((*(_WORD *)(a1 + 36) & 0x10) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 27));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("isAsync");
    else
      v9 = CFSTR("is_async");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
LABEL_17:
  objc_msgSend((id)a1, "appId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("appId");
    else
      v11 = CFSTR("app_id");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  v12 = *(_WORD *)(a1 + 36);
  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("muid"));

    v12 = *(_WORD *)(a1 + 36);
    if ((v12 & 4) == 0)
    {
LABEL_24:
      if ((v12 & 0x20) == 0)
        goto LABEL_25;
      goto LABEL_49;
    }
  }
  else if ((v12 & 4) == 0)
  {
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 25));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("called"));

  v12 = *(_WORD *)(a1 + 36);
  if ((v12 & 0x20) == 0)
  {
LABEL_25:
    if ((v12 & 0x100) == 0)
      goto LABEL_26;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 28));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("routed"));

  v12 = *(_WORD *)(a1 + 36);
  if ((v12 & 0x100) == 0)
  {
LABEL_26:
    if ((v12 & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 31));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v26 = CFSTR("tappedChangeReservation");
  else
    v26 = CFSTR("tapped_change_reservation");
  objc_msgSend(v4, "setObject:forKey:", v25, v26);

  v12 = *(_WORD *)(a1 + 36);
  if ((v12 & 0x80) == 0)
  {
LABEL_27:
    if ((v12 & 0x40) == 0)
      return v4;
    goto LABEL_58;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 30));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v28 = CFSTR("tappedCancelReservation");
  else
    v28 = CFSTR("tapped_cancel_reservation");
  objc_msgSend(v4, "setObject:forKey:", v27, v28);

  if ((*(_WORD *)(a1 + 36) & 0x40) != 0)
  {
LABEL_58:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 29));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("shared"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOBookedTable _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOBookedTable)initWithDictionary:(id)a3
{
  return (GEOBookedTable *)-[GEOBookedTable _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("bookedUsingMaps");
      else
        v6 = CFSTR("booked_using_maps");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBookedUsingMaps:", objc_msgSend(v7, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cancelled"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCancelled:", objc_msgSend(v8, "BOOLValue"));

      if (a3)
        v9 = CFSTR("viewedInProactiveTray");
      else
        v9 = CFSTR("viewed_in_proactive_tray");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setViewedInProactiveTray:", objc_msgSend(v10, "BOOLValue"));

      if (a3)
        v11 = CFSTR("tappedProactiveTrayItem");
      else
        v11 = CFSTR("tapped_proactive_tray_item");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTappedProactiveTrayItem:", objc_msgSend(v12, "BOOLValue"));

      if (a3)
        v13 = CFSTR("viewedInPlacecard");
      else
        v13 = CFSTR("viewed_in_placecard");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setViewedInPlacecard:", objc_msgSend(v14, "BOOLValue"));

      if (a3)
        v15 = CFSTR("viewedDetailsFromPlacecard");
      else
        v15 = CFSTR("viewed_details_from_placecard");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setViewedDetailsFromPlacecard:", objc_msgSend(v16, "BOOLValue"));

      if (a3)
        v17 = CFSTR("isAsync");
      else
        v17 = CFSTR("is_async");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsAsync:", objc_msgSend(v18, "BOOLValue"));

      if (a3)
        v19 = CFSTR("appId");
      else
        v19 = CFSTR("app_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(a1, "setAppId:", v21);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMuid:", objc_msgSend(v22, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("called"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCalled:", objc_msgSend(v23, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routed"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRouted:", objc_msgSend(v24, "BOOLValue"));

      if (a3)
        v25 = CFSTR("tappedChangeReservation");
      else
        v25 = CFSTR("tapped_change_reservation");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTappedChangeReservation:", objc_msgSend(v26, "BOOLValue"));

      if (a3)
        v27 = CFSTR("tappedCancelReservation");
      else
        v27 = CFSTR("tapped_cancel_reservation");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTappedCancelReservation:", objc_msgSend(v28, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shared"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setShared:", objc_msgSend(v29, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOBookedTable)initWithJSON:(id)a3
{
  return (GEOBookedTable *)-[GEOBookedTable _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOBookedTableIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOBookedTableReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  __int16 flags;
  __int16 v5;
  id v6;

  v6 = a3;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_4:
    if ((flags & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_5:
    if ((flags & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_6:
    if ((flags & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  if (self->_appId)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_flags;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = (__int16)self->_flags;
    if ((v5 & 4) == 0)
    {
LABEL_13:
      if ((v5 & 0x20) == 0)
        goto LABEL_14;
      goto LABEL_28;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  v5 = (__int16)self->_flags;
  if ((v5 & 0x20) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  v5 = (__int16)self->_flags;
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x80) == 0)
      goto LABEL_16;
LABEL_30:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_flags & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  v5 = (__int16)self->_flags;
  if ((v5 & 0x80) != 0)
    goto LABEL_30;
LABEL_16:
  if ((v5 & 0x40) != 0)
LABEL_17:
    PBDataWriterWriteBOOLField();
LABEL_18:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 flags;
  __int16 v6;
  _BYTE *v7;

  v7 = a3;
  -[GEOBookedTable readAll:](self, "readAll:", 0);
  v4 = v7;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v7[24] = self->_bookedUsingMaps;
    *((_WORD *)v7 + 18) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v7[26] = self->_cancelled;
  *((_WORD *)v7 + 18) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_4:
    if ((flags & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v7[35] = self->_viewedInProactiveTray;
  *((_WORD *)v7 + 18) |= 0x1000u;
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_5:
    if ((flags & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v7[32] = self->_tappedProactiveTrayItem;
  *((_WORD *)v7 + 18) |= 0x200u;
  flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_6:
    if ((flags & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v7[34] = self->_viewedInPlacecard;
  *((_WORD *)v7 + 18) |= 0x800u;
  flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_24:
  v7[33] = self->_viewedDetailsFromPlacecard;
  *((_WORD *)v7 + 18) |= 0x400u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    v7[27] = self->_isAsync;
    *((_WORD *)v7 + 18) |= 0x10u;
  }
LABEL_9:
  if (self->_appId)
  {
    objc_msgSend(v7, "setAppId:");
    v4 = v7;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 1) != 0)
  {
    v4[2] = self->_muid;
    *((_WORD *)v4 + 18) |= 1u;
    v6 = (__int16)self->_flags;
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 0x20) == 0)
        goto LABEL_14;
      goto LABEL_28;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_13;
  }
  *((_BYTE *)v4 + 25) = self->_called;
  *((_WORD *)v4 + 18) |= 4u;
  v6 = (__int16)self->_flags;
  if ((v6 & 0x20) == 0)
  {
LABEL_14:
    if ((v6 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_28:
  *((_BYTE *)v4 + 28) = self->_routed;
  *((_WORD *)v4 + 18) |= 0x20u;
  v6 = (__int16)self->_flags;
  if ((v6 & 0x100) == 0)
  {
LABEL_15:
    if ((v6 & 0x80) == 0)
      goto LABEL_16;
LABEL_30:
    *((_BYTE *)v4 + 30) = self->_tappedCancelReservation;
    *((_WORD *)v4 + 18) |= 0x80u;
    if ((*(_WORD *)&self->_flags & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_29:
  *((_BYTE *)v4 + 31) = self->_tappedChangeReservation;
  *((_WORD *)v4 + 18) |= 0x100u;
  v6 = (__int16)self->_flags;
  if ((v6 & 0x80) != 0)
    goto LABEL_30;
LABEL_16:
  if ((v6 & 0x40) != 0)
  {
LABEL_17:
    *((_BYTE *)v4 + 29) = self->_shared;
    *((_WORD *)v4 + 18) |= 0x40u;
  }
LABEL_18:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 flags;
  uint64_t v8;
  void *v9;
  __int16 v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_bookedUsingMaps;
    *(_WORD *)(v5 + 36) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 26) = self->_cancelled;
  *(_WORD *)(v5 + 36) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_4:
    if ((flags & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *(_BYTE *)(v5 + 35) = self->_viewedInProactiveTray;
  *(_WORD *)(v5 + 36) |= 0x1000u;
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_5:
    if ((flags & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *(_BYTE *)(v5 + 32) = self->_tappedProactiveTrayItem;
  *(_WORD *)(v5 + 36) |= 0x200u;
  flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_6:
    if ((flags & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *(_BYTE *)(v5 + 34) = self->_viewedInPlacecard;
  *(_WORD *)(v5 + 36) |= 0x800u;
  flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_22:
  *(_BYTE *)(v5 + 33) = self->_viewedDetailsFromPlacecard;
  *(_WORD *)(v5 + 36) |= 0x400u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 27) = self->_isAsync;
    *(_WORD *)(v5 + 36) |= 0x10u;
  }
LABEL_9:
  v8 = -[NSString copyWithZone:](self->_appId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v8;

  v10 = (__int16)self->_flags;
  if ((v10 & 1) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_muid;
    *(_WORD *)(v6 + 36) |= 1u;
    v10 = (__int16)self->_flags;
    if ((v10 & 4) == 0)
    {
LABEL_11:
      if ((v10 & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_26;
    }
  }
  else if ((v10 & 4) == 0)
  {
    goto LABEL_11;
  }
  *(_BYTE *)(v6 + 25) = self->_called;
  *(_WORD *)(v6 + 36) |= 4u;
  v10 = (__int16)self->_flags;
  if ((v10 & 0x20) == 0)
  {
LABEL_12:
    if ((v10 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *(_BYTE *)(v6 + 28) = self->_routed;
  *(_WORD *)(v6 + 36) |= 0x20u;
  v10 = (__int16)self->_flags;
  if ((v10 & 0x100) == 0)
  {
LABEL_13:
    if ((v10 & 0x80) == 0)
      goto LABEL_14;
LABEL_28:
    *(_BYTE *)(v6 + 30) = self->_tappedCancelReservation;
    *(_WORD *)(v6 + 36) |= 0x80u;
    if ((*(_WORD *)&self->_flags & 0x40) == 0)
      return (id)v6;
    goto LABEL_15;
  }
LABEL_27:
  *(_BYTE *)(v6 + 31) = self->_tappedChangeReservation;
  *(_WORD *)(v6 + 36) |= 0x100u;
  v10 = (__int16)self->_flags;
  if ((v10 & 0x80) != 0)
    goto LABEL_28;
LABEL_14:
  if ((v10 & 0x40) != 0)
  {
LABEL_15:
    *(_BYTE *)(v6 + 29) = self->_shared;
    *(_WORD *)(v6 + 36) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSString *appId;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_101;
  -[GEOBookedTable readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 18);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0)
      goto LABEL_101;
    if (self->_bookedUsingMaps)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_101;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_101;
    if (self->_cancelled)
    {
      if (!*((_BYTE *)v4 + 26))
        goto LABEL_101;
    }
    else if (*((_BYTE *)v4 + 26))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_101;
  }
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x1000) == 0)
      goto LABEL_101;
    if (self->_viewedInProactiveTray)
    {
      if (!*((_BYTE *)v4 + 35))
        goto LABEL_101;
    }
    else if (*((_BYTE *)v4 + 35))
    {
      goto LABEL_101;
    }
  }
  else if ((*((_WORD *)v4 + 18) & 0x1000) != 0)
  {
    goto LABEL_101;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x200) == 0)
      goto LABEL_101;
    if (self->_tappedProactiveTrayItem)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_101;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_101;
    }
  }
  else if ((*((_WORD *)v4 + 18) & 0x200) != 0)
  {
    goto LABEL_101;
  }
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x800) == 0)
      goto LABEL_101;
    if (self->_viewedInPlacecard)
    {
      if (!*((_BYTE *)v4 + 34))
        goto LABEL_101;
    }
    else if (*((_BYTE *)v4 + 34))
    {
      goto LABEL_101;
    }
  }
  else if ((*((_WORD *)v4 + 18) & 0x800) != 0)
  {
    goto LABEL_101;
  }
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x400) == 0)
      goto LABEL_101;
    if (self->_viewedDetailsFromPlacecard)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_101;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_101;
    }
  }
  else if ((*((_WORD *)v4 + 18) & 0x400) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0)
      goto LABEL_101;
    if (self->_isAsync)
    {
      if (!*((_BYTE *)v4 + 27))
        goto LABEL_101;
    }
    else if (*((_BYTE *)v4 + 27))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_101;
  }
  appId = self->_appId;
  if ((unint64_t)appId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](appId, "isEqual:"))
      goto LABEL_101;
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 18);
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_muid != *((_QWORD *)v4 + 2))
      goto LABEL_101;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_101;
    if (self->_called)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_101;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0)
      goto LABEL_101;
    if (self->_routed)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_101;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0)
      goto LABEL_101;
    if (self->_tappedChangeReservation)
    {
      if (!*((_BYTE *)v4 + 31))
        goto LABEL_101;
    }
    else if (*((_BYTE *)v4 + 31))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0)
      goto LABEL_101;
    if (self->_tappedCancelReservation)
    {
      if (!*((_BYTE *)v4 + 30))
        goto LABEL_101;
    }
    else if (*((_BYTE *)v4 + 30))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) != 0)
    {
      if (self->_shared)
      {
        if (!*((_BYTE *)v4 + 29))
          goto LABEL_101;
      }
      else if (*((_BYTE *)v4 + 29))
      {
        goto LABEL_101;
      }
      v8 = 1;
      goto LABEL_102;
    }
LABEL_101:
    v8 = 0;
    goto LABEL_102;
  }
  v8 = (v6 & 0x40) == 0;
LABEL_102:

  return v8;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  -[GEOBookedTable readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v4 = 2654435761 * self->_bookedUsingMaps;
    if ((flags & 8) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_cancelled;
      if ((*(_WORD *)&self->_flags & 0x1000) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v4 = 0;
    if ((flags & 8) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_viewedInProactiveTray;
    if ((*(_WORD *)&self->_flags & 0x200) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v6 = 0;
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_tappedProactiveTrayItem;
    if ((*(_WORD *)&self->_flags & 0x800) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v7 = 0;
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_viewedInPlacecard;
    if ((*(_WORD *)&self->_flags & 0x400) != 0)
      goto LABEL_7;
LABEL_14:
    v9 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v8 = 0;
  if ((*(_WORD *)&self->_flags & 0x400) == 0)
    goto LABEL_14;
LABEL_7:
  v9 = 2654435761 * self->_viewedDetailsFromPlacecard;
  if ((flags & 0x10) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_isAsync;
    goto LABEL_16;
  }
LABEL_15:
  v10 = 0;
LABEL_16:
  v11 = -[NSString hash](self->_appId, "hash");
  v12 = (__int16)self->_flags;
  if ((v12 & 1) != 0)
  {
    v13 = 2654435761u * self->_muid;
    if ((v12 & 4) != 0)
    {
LABEL_18:
      v14 = 2654435761 * self->_called;
      if ((v12 & 0x20) != 0)
        goto LABEL_19;
      goto LABEL_25;
    }
  }
  else
  {
    v13 = 0;
    if ((v12 & 4) != 0)
      goto LABEL_18;
  }
  v14 = 0;
  if ((v12 & 0x20) != 0)
  {
LABEL_19:
    v15 = 2654435761 * self->_routed;
    if ((*(_WORD *)&self->_flags & 0x100) != 0)
      goto LABEL_20;
    goto LABEL_26;
  }
LABEL_25:
  v15 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_20:
    v16 = 2654435761 * self->_tappedChangeReservation;
    if ((v12 & 0x80) != 0)
      goto LABEL_21;
LABEL_27:
    v17 = 0;
    if ((v12 & 0x40) != 0)
      goto LABEL_22;
LABEL_28:
    v18 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11;
  }
LABEL_26:
  v16 = 0;
  if ((v12 & 0x80) == 0)
    goto LABEL_27;
LABEL_21:
  v17 = 2654435761 * self->_tappedCancelReservation;
  if ((v12 & 0x40) == 0)
    goto LABEL_28;
LABEL_22:
  v18 = 2654435761 * self->_shared;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  __int16 v5;
  __int16 v6;
  BOOL *v7;

  v7 = (BOOL *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  v5 = *((_WORD *)v7 + 18);
  if ((v5 & 2) != 0)
  {
    self->_bookedUsingMaps = v7[24];
    *(_WORD *)&self->_flags |= 2u;
    v5 = *((_WORD *)v7 + 18);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_cancelled = v7[26];
  *(_WORD *)&self->_flags |= 8u;
  v5 = *((_WORD *)v7 + 18);
  if ((v5 & 0x1000) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  self->_viewedInProactiveTray = v7[35];
  *(_WORD *)&self->_flags |= 0x1000u;
  v5 = *((_WORD *)v7 + 18);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  self->_tappedProactiveTrayItem = v7[32];
  *(_WORD *)&self->_flags |= 0x200u;
  v5 = *((_WORD *)v7 + 18);
  if ((v5 & 0x800) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  self->_viewedInPlacecard = v7[34];
  *(_WORD *)&self->_flags |= 0x800u;
  v5 = *((_WORD *)v7 + 18);
  if ((v5 & 0x400) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_24:
  self->_viewedDetailsFromPlacecard = v7[33];
  *(_WORD *)&self->_flags |= 0x400u;
  if ((*((_WORD *)v7 + 18) & 0x10) != 0)
  {
LABEL_8:
    self->_isAsync = v7[27];
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_9:
  if (*((_QWORD *)v7 + 1))
  {
    -[GEOBookedTable setAppId:](self, "setAppId:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 18);
  if ((v6 & 1) != 0)
  {
    self->_muid = *((_QWORD *)v4 + 2);
    *(_WORD *)&self->_flags |= 1u;
    v6 = *((_WORD *)v4 + 18);
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 0x20) == 0)
        goto LABEL_14;
      goto LABEL_28;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_called = v4[25];
  *(_WORD *)&self->_flags |= 4u;
  v6 = *((_WORD *)v4 + 18);
  if ((v6 & 0x20) == 0)
  {
LABEL_14:
    if ((v6 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_28:
  self->_routed = v4[28];
  *(_WORD *)&self->_flags |= 0x20u;
  v6 = *((_WORD *)v4 + 18);
  if ((v6 & 0x100) == 0)
  {
LABEL_15:
    if ((v6 & 0x80) == 0)
      goto LABEL_16;
LABEL_30:
    self->_tappedCancelReservation = v4[30];
    *(_WORD *)&self->_flags |= 0x80u;
    if ((*((_WORD *)v4 + 18) & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_29:
  self->_tappedChangeReservation = v4[31];
  *(_WORD *)&self->_flags |= 0x100u;
  v6 = *((_WORD *)v4 + 18);
  if ((v6 & 0x80) != 0)
    goto LABEL_30;
LABEL_16:
  if ((v6 & 0x40) != 0)
  {
LABEL_17:
    self->_shared = v4[29];
    *(_WORD *)&self->_flags |= 0x40u;
  }
LABEL_18:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appId, 0);
}

@end
