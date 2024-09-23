@implementation GEORoutePlanningInfo

- (GEORoutePlanningInfo)init
{
  GEORoutePlanningInfo *v2;
  GEORoutePlanningInfo *v3;
  GEORoutePlanningInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORoutePlanningInfo;
  v2 = -[GEORoutePlanningInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORoutePlanningInfo)initWithData:(id)a3
{
  GEORoutePlanningInfo *v3;
  GEORoutePlanningInfo *v4;
  GEORoutePlanningInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORoutePlanningInfo;
  v3 = -[GEORoutePlanningInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRoutePlanningDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutePlanningDescription_tags_5430);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasRoutePlanningDescription
{
  -[GEORoutePlanningInfo _readRoutePlanningDescription]((uint64_t)self);
  return self->_routePlanningDescription != 0;
}

- (GEORouteInformation)routePlanningDescription
{
  -[GEORoutePlanningInfo _readRoutePlanningDescription]((uint64_t)self);
  return self->_routePlanningDescription;
}

- (void)setRoutePlanningDescription:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_routePlanningDescription, a3);
}

- (void)_readLabelDetailText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabelDetailText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasLabelDetailText
{
  -[GEORoutePlanningInfo _readLabelDetailText]((uint64_t)self);
  return self->_labelDetailText != 0;
}

- (GEOFormattedString)labelDetailText
{
  -[GEORoutePlanningInfo _readLabelDetailText]((uint64_t)self);
  return self->_labelDetailText;
}

- (void)setLabelDetailText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_labelDetailText, a3);
}

- (void)_readLabelArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabelArtwork_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasLabelArtwork
{
  -[GEORoutePlanningInfo _readLabelArtwork]((uint64_t)self);
  return self->_labelArtwork != 0;
}

- (GEOPBTransitArtwork)labelArtwork
{
  -[GEORoutePlanningInfo _readLabelArtwork]((uint64_t)self);
  return self->_labelArtwork;
}

- (void)setLabelArtwork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_labelArtwork, a3);
}

- (void)_readLabelAction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabelAction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasLabelAction
{
  -[GEORoutePlanningInfo _readLabelAction]((uint64_t)self);
  return self->_labelAction != 0;
}

- (GEOLabelAction)labelAction
{
  -[GEORoutePlanningInfo _readLabelAction]((uint64_t)self);
  return self->_labelAction;
}

- (void)setLabelAction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  objc_storeStrong((id *)&self->_labelAction, a3);
}

- (void)_readInfrastructureDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInfrastructureDescription_tags_5431);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasInfrastructureDescription
{
  -[GEORoutePlanningInfo _readInfrastructureDescription]((uint64_t)self);
  return self->_infrastructureDescription != 0;
}

- (GEOFormattedString)infrastructureDescription
{
  -[GEORoutePlanningInfo _readInfrastructureDescription]((uint64_t)self);
  return self->_infrastructureDescription;
}

- (void)setInfrastructureDescription:(id)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  objc_storeStrong((id *)&self->_infrastructureDescription, a3);
}

- (void)_readAdvisoriesInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdvisoriesInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasAdvisoriesInfo
{
  -[GEORoutePlanningInfo _readAdvisoriesInfo]((uint64_t)self);
  return self->_advisoriesInfo != 0;
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  -[GEORoutePlanningInfo _readAdvisoriesInfo]((uint64_t)self);
  return self->_advisoriesInfo;
}

- (void)setAdvisoriesInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  objc_storeStrong((id *)&self->_advisoriesInfo, a3);
}

- (void)_readTrafficDescriptionText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficDescriptionText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTrafficDescriptionText
{
  -[GEORoutePlanningInfo _readTrafficDescriptionText]((uint64_t)self);
  return self->_trafficDescriptionText != 0;
}

- (GEOFormattedString)trafficDescriptionText
{
  -[GEORoutePlanningInfo _readTrafficDescriptionText]((uint64_t)self);
  return self->_trafficDescriptionText;
}

- (void)setTrafficDescriptionText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_trafficDescriptionText, a3);
}

- (void)_readTrafficDescriptionArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficDescriptionArtwork_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTrafficDescriptionArtwork
{
  -[GEORoutePlanningInfo _readTrafficDescriptionArtwork]((uint64_t)self);
  return self->_trafficDescriptionArtwork != 0;
}

- (GEOPBTransitArtwork)trafficDescriptionArtwork
{
  -[GEORoutePlanningInfo _readTrafficDescriptionArtwork]((uint64_t)self);
  return self->_trafficDescriptionArtwork;
}

- (void)setTrafficDescriptionArtwork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_trafficDescriptionArtwork, a3);
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
  v8.super_class = (Class)GEORoutePlanningInfo;
  -[GEORoutePlanningInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORoutePlanningInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoutePlanningInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v44[4];
  id v45;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "routePlanningDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("routePlanningDescription");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("route_planning_description");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "labelDetailText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("labelDetailText");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("label_detail_text");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(a1, "labelArtwork");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("labelArtwork");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("label_artwork");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend(a1, "labelAction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("labelAction");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("label_action");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  objc_msgSend(a1, "infrastructureDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("infrastructureDescription");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("infrastructure_description");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  objc_msgSend(a1, "advisoriesInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("advisoriesInfo");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("advisories_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  objc_msgSend(a1, "trafficDescriptionText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "jsonRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("trafficDescriptionText");
    }
    else
    {
      objc_msgSend(v29, "dictionaryRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("traffic_description_text");
    }
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  objc_msgSend(a1, "trafficDescriptionArtwork");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "jsonRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("trafficDescriptionArtwork");
    }
    else
    {
      objc_msgSend(v33, "dictionaryRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("traffic_description_artwork");
    }
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  v37 = (void *)a1[2];
  if (v37)
  {
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __50__GEORoutePlanningInfo__dictionaryRepresentation___block_invoke;
      v44[3] = &unk_1E1C00600;
      v41 = v40;
      v45 = v41;
      objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v44);
      v42 = v41;

      v39 = v42;
    }
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORoutePlanningInfo _dictionaryRepresentation:](self, 1);
}

void __50__GEORoutePlanningInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORoutePlanningInfo)initWithDictionary:(id)a3
{
  return (GEORoutePlanningInfo *)-[GEORoutePlanningInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORouteInformation *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  GEOFormattedString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  GEOPBTransitArtwork *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEOLabelAction *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEOFormattedString *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  GEOAdvisoriesInfo *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  GEOFormattedString *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  GEOPBTransitArtwork *v42;
  uint64_t v43;
  void *v44;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("routePlanningDescription");
      else
        v6 = CFSTR("route_planning_description");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORouteInformation alloc];
        if (v8)
          v9 = (void *)-[GEORouteInformation _initWithDictionary:isJSON:](v8, v7, a3);
        else
          v9 = 0;
        objc_msgSend(a1, "setRoutePlanningDescription:", v9);

      }
      if (a3)
        v10 = CFSTR("labelDetailText");
      else
        v10 = CFSTR("label_detail_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOFormattedString initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOFormattedString initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setLabelDetailText:", v13);

      }
      if (a3)
        v15 = CFSTR("labelArtwork");
      else
        v15 = CFSTR("label_artwork");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v18 = -[GEOPBTransitArtwork initWithJSON:](v17, "initWithJSON:", v16);
        else
          v18 = -[GEOPBTransitArtwork initWithDictionary:](v17, "initWithDictionary:", v16);
        v19 = (void *)v18;
        objc_msgSend(a1, "setLabelArtwork:", v18);

      }
      if (a3)
        v20 = CFSTR("labelAction");
      else
        v20 = CFSTR("label_action");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = [GEOLabelAction alloc];
        if ((a3 & 1) != 0)
          v23 = -[GEOLabelAction initWithJSON:](v22, "initWithJSON:", v21);
        else
          v23 = -[GEOLabelAction initWithDictionary:](v22, "initWithDictionary:", v21);
        v24 = (void *)v23;
        objc_msgSend(a1, "setLabelAction:", v23);

      }
      if (a3)
        v25 = CFSTR("infrastructureDescription");
      else
        v25 = CFSTR("infrastructure_description");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v28 = -[GEOFormattedString initWithJSON:](v27, "initWithJSON:", v26);
        else
          v28 = -[GEOFormattedString initWithDictionary:](v27, "initWithDictionary:", v26);
        v29 = (void *)v28;
        objc_msgSend(a1, "setInfrastructureDescription:", v28);

      }
      if (a3)
        v30 = CFSTR("advisoriesInfo");
      else
        v30 = CFSTR("advisories_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = [GEOAdvisoriesInfo alloc];
        if ((a3 & 1) != 0)
          v33 = -[GEOAdvisoriesInfo initWithJSON:](v32, "initWithJSON:", v31);
        else
          v33 = -[GEOAdvisoriesInfo initWithDictionary:](v32, "initWithDictionary:", v31);
        v34 = (void *)v33;
        objc_msgSend(a1, "setAdvisoriesInfo:", v33);

      }
      if (a3)
        v35 = CFSTR("trafficDescriptionText");
      else
        v35 = CFSTR("traffic_description_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v38 = -[GEOFormattedString initWithJSON:](v37, "initWithJSON:", v36);
        else
          v38 = -[GEOFormattedString initWithDictionary:](v37, "initWithDictionary:", v36);
        v39 = (void *)v38;
        objc_msgSend(a1, "setTrafficDescriptionText:", v38);

      }
      if (a3)
        v40 = CFSTR("trafficDescriptionArtwork");
      else
        v40 = CFSTR("traffic_description_artwork");
      objc_msgSend(v5, "objectForKeyedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v43 = -[GEOPBTransitArtwork initWithJSON:](v42, "initWithJSON:", v41);
        else
          v43 = -[GEOPBTransitArtwork initWithDictionary:](v42, "initWithDictionary:", v41);
        v44 = (void *)v43;
        objc_msgSend(a1, "setTrafficDescriptionArtwork:", v43);

      }
    }
  }

  return a1;
}

- (GEORoutePlanningInfo)initWithJSON:(id)a3
{
  return (GEORoutePlanningInfo *)-[GEORoutePlanningInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_5458;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5459;
    GEORoutePlanningInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORoutePlanningInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoutePlanningInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoutePlanningInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORoutePlanningInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORoutePlanningInfo readAll:](self, "readAll:", 0);
    if (self->_routePlanningDescription)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_labelDetailText)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_labelArtwork)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_labelAction)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_infrastructureDescription)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_advisoriesInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_trafficDescriptionText)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_trafficDescriptionArtwork)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORoutePlanningInfo _readAdvisoriesInfo]((uint64_t)self);
  return -[GEOAdvisoriesInfo hasGreenTeaWithValue:](self->_advisoriesInfo, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORoutePlanningInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 22) = self->_readerMarkPos;
  *((_DWORD *)v5 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routePlanningDescription)
    objc_msgSend(v5, "setRoutePlanningDescription:");
  if (self->_labelDetailText)
    objc_msgSend(v5, "setLabelDetailText:");
  v4 = v5;
  if (self->_labelArtwork)
  {
    objc_msgSend(v5, "setLabelArtwork:");
    v4 = v5;
  }
  if (self->_labelAction)
  {
    objc_msgSend(v5, "setLabelAction:");
    v4 = v5;
  }
  if (self->_infrastructureDescription)
  {
    objc_msgSend(v5, "setInfrastructureDescription:");
    v4 = v5;
  }
  if (self->_advisoriesInfo)
  {
    objc_msgSend(v5, "setAdvisoriesInfo:");
    v4 = v5;
  }
  if (self->_trafficDescriptionText)
  {
    objc_msgSend(v5, "setTrafficDescriptionText:");
    v4 = v5;
  }
  if (self->_trafficDescriptionArtwork)
  {
    objc_msgSend(v5, "setTrafficDescriptionArtwork:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORoutePlanningInfo readAll:](self, "readAll:", 0);
    v8 = -[GEORouteInformation copyWithZone:](self->_routePlanningDescription, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v8;

    v10 = -[GEOFormattedString copyWithZone:](self->_labelDetailText, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v10;

    v12 = -[GEOPBTransitArtwork copyWithZone:](self->_labelArtwork, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v12;

    v14 = -[GEOLabelAction copyWithZone:](self->_labelAction, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v14;

    v16 = -[GEOFormattedString copyWithZone:](self->_infrastructureDescription, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v16;

    v18 = -[GEOAdvisoriesInfo copyWithZone:](self->_advisoriesInfo, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v18;

    v20 = -[GEOFormattedString copyWithZone:](self->_trafficDescriptionText, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v20;

    v22 = -[GEOPBTransitArtwork copyWithZone:](self->_trafficDescriptionArtwork, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v22;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORoutePlanningInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORouteInformation *routePlanningDescription;
  GEOFormattedString *labelDetailText;
  GEOPBTransitArtwork *labelArtwork;
  GEOLabelAction *labelAction;
  GEOFormattedString *infrastructureDescription;
  GEOAdvisoriesInfo *advisoriesInfo;
  GEOFormattedString *trafficDescriptionText;
  GEOPBTransitArtwork *trafficDescriptionArtwork;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEORoutePlanningInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  routePlanningDescription = self->_routePlanningDescription;
  if ((unint64_t)routePlanningDescription | v4[8])
  {
    if (!-[GEORouteInformation isEqual:](routePlanningDescription, "isEqual:"))
      goto LABEL_18;
  }
  if (((labelDetailText = self->_labelDetailText, !((unint64_t)labelDetailText | v4[7]))
     || -[GEOFormattedString isEqual:](labelDetailText, "isEqual:"))
    && ((labelArtwork = self->_labelArtwork, !((unint64_t)labelArtwork | v4[6]))
     || -[GEOPBTransitArtwork isEqual:](labelArtwork, "isEqual:"))
    && ((labelAction = self->_labelAction, !((unint64_t)labelAction | v4[5]))
     || -[GEOLabelAction isEqual:](labelAction, "isEqual:"))
    && ((infrastructureDescription = self->_infrastructureDescription,
         !((unint64_t)infrastructureDescription | v4[4]))
     || -[GEOFormattedString isEqual:](infrastructureDescription, "isEqual:"))
    && ((advisoriesInfo = self->_advisoriesInfo, !((unint64_t)advisoriesInfo | v4[3]))
     || -[GEOAdvisoriesInfo isEqual:](advisoriesInfo, "isEqual:"))
    && ((trafficDescriptionText = self->_trafficDescriptionText, !((unint64_t)trafficDescriptionText | v4[10]))
     || -[GEOFormattedString isEqual:](trafficDescriptionText, "isEqual:")))
  {
    trafficDescriptionArtwork = self->_trafficDescriptionArtwork;
    if ((unint64_t)trafficDescriptionArtwork | v4[9])
      v13 = -[GEOPBTransitArtwork isEqual:](trafficDescriptionArtwork, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
LABEL_18:
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  -[GEORoutePlanningInfo readAll:](self, "readAll:", 1);
  v3 = -[GEORouteInformation hash](self->_routePlanningDescription, "hash");
  v4 = -[GEOFormattedString hash](self->_labelDetailText, "hash") ^ v3;
  v5 = -[GEOPBTransitArtwork hash](self->_labelArtwork, "hash");
  v6 = v4 ^ v5 ^ -[GEOLabelAction hash](self->_labelAction, "hash");
  v7 = -[GEOFormattedString hash](self->_infrastructureDescription, "hash");
  v8 = v7 ^ -[GEOAdvisoriesInfo hash](self->_advisoriesInfo, "hash");
  v9 = v6 ^ v8 ^ -[GEOFormattedString hash](self->_trafficDescriptionText, "hash");
  return v9 ^ -[GEOPBTransitArtwork hash](self->_trafficDescriptionArtwork, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEORouteInformation *routePlanningDescription;
  void *v5;
  GEOFormattedString *labelDetailText;
  uint64_t v7;
  GEOPBTransitArtwork *labelArtwork;
  uint64_t v9;
  GEOLabelAction *labelAction;
  uint64_t v11;
  GEOFormattedString *infrastructureDescription;
  uint64_t v13;
  GEOAdvisoriesInfo *advisoriesInfo;
  uint64_t v15;
  GEOFormattedString *trafficDescriptionText;
  uint64_t v17;
  GEOPBTransitArtwork *trafficDescriptionArtwork;
  uint64_t v19;
  _QWORD *v20;

  v20 = a3;
  objc_msgSend(v20, "readAll:", 0);
  routePlanningDescription = self->_routePlanningDescription;
  v5 = (void *)v20[8];
  if (routePlanningDescription)
  {
    if (v5)
      -[GEORouteInformation mergeFrom:](routePlanningDescription, v5);
  }
  else if (v5)
  {
    -[GEORoutePlanningInfo setRoutePlanningDescription:](self, "setRoutePlanningDescription:", v20[8]);
  }
  labelDetailText = self->_labelDetailText;
  v7 = v20[7];
  if (labelDetailText)
  {
    if (v7)
      -[GEOFormattedString mergeFrom:](labelDetailText, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORoutePlanningInfo setLabelDetailText:](self, "setLabelDetailText:");
  }
  labelArtwork = self->_labelArtwork;
  v9 = v20[6];
  if (labelArtwork)
  {
    if (v9)
      -[GEOPBTransitArtwork mergeFrom:](labelArtwork, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORoutePlanningInfo setLabelArtwork:](self, "setLabelArtwork:");
  }
  labelAction = self->_labelAction;
  v11 = v20[5];
  if (labelAction)
  {
    if (v11)
      -[GEOLabelAction mergeFrom:](labelAction, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORoutePlanningInfo setLabelAction:](self, "setLabelAction:");
  }
  infrastructureDescription = self->_infrastructureDescription;
  v13 = v20[4];
  if (infrastructureDescription)
  {
    if (v13)
      -[GEOFormattedString mergeFrom:](infrastructureDescription, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORoutePlanningInfo setInfrastructureDescription:](self, "setInfrastructureDescription:");
  }
  advisoriesInfo = self->_advisoriesInfo;
  v15 = v20[3];
  if (advisoriesInfo)
  {
    if (v15)
      -[GEOAdvisoriesInfo mergeFrom:](advisoriesInfo, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEORoutePlanningInfo setAdvisoriesInfo:](self, "setAdvisoriesInfo:");
  }
  trafficDescriptionText = self->_trafficDescriptionText;
  v17 = v20[10];
  if (trafficDescriptionText)
  {
    if (v17)
      -[GEOFormattedString mergeFrom:](trafficDescriptionText, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEORoutePlanningInfo setTrafficDescriptionText:](self, "setTrafficDescriptionText:");
  }
  trafficDescriptionArtwork = self->_trafficDescriptionArtwork;
  v19 = v20[9];
  if (trafficDescriptionArtwork)
  {
    if (v19)
      -[GEOPBTransitArtwork mergeFrom:](trafficDescriptionArtwork, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEORoutePlanningInfo setTrafficDescriptionArtwork:](self, "setTrafficDescriptionArtwork:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORoutePlanningInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5462);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x201u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORoutePlanningInfo readAll:](self, "readAll:", 0);
    -[GEORouteInformation clearUnknownFields:]((uint64_t)self->_routePlanningDescription);
    -[GEOFormattedString clearUnknownFields:](self->_labelDetailText, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_labelArtwork, "clearUnknownFields:", 1);
    -[GEOLabelAction clearUnknownFields:](self->_labelAction, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_infrastructureDescription, "clearUnknownFields:", 1);
    -[GEOAdvisoriesInfo clearUnknownFields:](self->_advisoriesInfo, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_trafficDescriptionText, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_trafficDescriptionArtwork, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficDescriptionText, 0);
  objc_storeStrong((id *)&self->_trafficDescriptionArtwork, 0);
  objc_storeStrong((id *)&self->_routePlanningDescription, 0);
  objc_storeStrong((id *)&self->_labelDetailText, 0);
  objc_storeStrong((id *)&self->_labelArtwork, 0);
  objc_storeStrong((id *)&self->_labelAction, 0);
  objc_storeStrong((id *)&self->_infrastructureDescription, 0);
  objc_storeStrong((id *)&self->_advisoriesInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
