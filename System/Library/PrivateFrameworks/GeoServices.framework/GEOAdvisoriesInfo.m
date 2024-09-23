@implementation GEOAdvisoriesInfo

- (GEOAdvisoriesInfo)init
{
  GEOAdvisoriesInfo *v2;
  GEOAdvisoriesInfo *v3;
  GEOAdvisoriesInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAdvisoriesInfo;
  v2 = -[GEOAdvisoriesInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAdvisoriesInfo)initWithData:(id)a3
{
  GEOAdvisoriesInfo *v3;
  GEOAdvisoriesInfo *v4;
  GEOAdvisoriesInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAdvisoriesInfo;
  v3 = -[GEOAdvisoriesInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readNoticeAdvisorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoriesInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNoticeAdvisorys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)noticeAdvisorys
{
  -[GEOAdvisoriesInfo _readNoticeAdvisorys]((uint64_t)self);
  return self->_noticeAdvisorys;
}

- (void)setNoticeAdvisorys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *noticeAdvisorys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  noticeAdvisorys = self->_noticeAdvisorys;
  self->_noticeAdvisorys = v4;

}

- (void)clearNoticeAdvisorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_noticeAdvisorys, "removeAllObjects");
}

- (void)addNoticeAdvisory:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOAdvisoriesInfo _readNoticeAdvisorys]((uint64_t)self);
  -[GEOAdvisoriesInfo _addNoFlagsNoticeAdvisory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsNoticeAdvisory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)noticeAdvisorysCount
{
  -[GEOAdvisoriesInfo _readNoticeAdvisorys]((uint64_t)self);
  return -[NSMutableArray count](self->_noticeAdvisorys, "count");
}

- (id)noticeAdvisoryAtIndex:(unint64_t)a3
{
  -[GEOAdvisoriesInfo _readNoticeAdvisorys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_noticeAdvisorys, "objectAtIndex:", a3);
}

+ (Class)noticeAdvisoryType
{
  return (Class)objc_opt_class();
}

- (void)_readClickableAdvisory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoriesInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClickableAdvisory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasClickableAdvisory
{
  -[GEOAdvisoriesInfo _readClickableAdvisory]((uint64_t)self);
  return self->_clickableAdvisory != 0;
}

- (GEOClickableAdvisory)clickableAdvisory
{
  -[GEOAdvisoriesInfo _readClickableAdvisory]((uint64_t)self);
  return self->_clickableAdvisory;
}

- (void)setClickableAdvisory:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_clickableAdvisory, a3);
}

- (void)_readTollAdvisory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoriesInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTollAdvisory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTollAdvisory
{
  -[GEOAdvisoriesInfo _readTollAdvisory]((uint64_t)self);
  return self->_tollAdvisory != 0;
}

- (GEOAdvisoryNotice)tollAdvisory
{
  -[GEOAdvisoriesInfo _readTollAdvisory]((uint64_t)self);
  return self->_tollAdvisory;
}

- (void)setTollAdvisory:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_tollAdvisory, a3);
}

- (void)_readEvAdvisory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoriesInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvAdvisory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEvAdvisory
{
  -[GEOAdvisoriesInfo _readEvAdvisory]((uint64_t)self);
  return self->_evAdvisory != 0;
}

- (GEOAdvisoryNotice)evAdvisory
{
  -[GEOAdvisoriesInfo _readEvAdvisory]((uint64_t)self);
  return self->_evAdvisory;
}

- (void)setEvAdvisory:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_evAdvisory, a3);
}

- (void)_readIncidentAdvisorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoriesInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentAdvisorys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)incidentAdvisorys
{
  -[GEOAdvisoriesInfo _readIncidentAdvisorys]((uint64_t)self);
  return self->_incidentAdvisorys;
}

- (void)setIncidentAdvisorys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *incidentAdvisorys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  incidentAdvisorys = self->_incidentAdvisorys;
  self->_incidentAdvisorys = v4;

}

- (void)clearIncidentAdvisorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_incidentAdvisorys, "removeAllObjects");
}

- (void)addIncidentAdvisory:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOAdvisoriesInfo _readIncidentAdvisorys]((uint64_t)self);
  -[GEOAdvisoriesInfo _addNoFlagsIncidentAdvisory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsIncidentAdvisory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)incidentAdvisorysCount
{
  -[GEOAdvisoriesInfo _readIncidentAdvisorys]((uint64_t)self);
  return -[NSMutableArray count](self->_incidentAdvisorys, "count");
}

- (id)incidentAdvisoryAtIndex:(unint64_t)a3
{
  -[GEOAdvisoriesInfo _readIncidentAdvisorys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_incidentAdvisorys, "objectAtIndex:", a3);
}

+ (Class)incidentAdvisoryType
{
  return (Class)objc_opt_class();
}

- (void)_readGenericAdvisorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoriesInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGenericAdvisorys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)genericAdvisorys
{
  -[GEOAdvisoriesInfo _readGenericAdvisorys]((uint64_t)self);
  return self->_genericAdvisorys;
}

- (void)setGenericAdvisorys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *genericAdvisorys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  genericAdvisorys = self->_genericAdvisorys;
  self->_genericAdvisorys = v4;

}

- (void)clearGenericAdvisorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_genericAdvisorys, "removeAllObjects");
}

- (void)addGenericAdvisory:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOAdvisoriesInfo _readGenericAdvisorys]((uint64_t)self);
  -[GEOAdvisoriesInfo _addNoFlagsGenericAdvisory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsGenericAdvisory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)genericAdvisorysCount
{
  -[GEOAdvisoriesInfo _readGenericAdvisorys]((uint64_t)self);
  return -[NSMutableArray count](self->_genericAdvisorys, "count");
}

- (id)genericAdvisoryAtIndex:(unint64_t)a3
{
  -[GEOAdvisoriesInfo _readGenericAdvisorys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_genericAdvisorys, "objectAtIndex:", a3);
}

+ (Class)genericAdvisoryType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOAdvisoriesInfo;
  -[GEOAdvisoriesInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAdvisoriesInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAdvisoriesInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v51[4];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v6 = *(id *)(a1 + 56);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v62 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("noticeAdvisory");
    else
      v13 = CFSTR("notice_advisory");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  objc_msgSend((id)a1, "clickableAdvisory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("clickableAdvisory");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("clickable_advisory");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  objc_msgSend((id)a1, "tollAdvisory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("tollAdvisory");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("toll_advisory");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  objc_msgSend((id)a1, "evAdvisory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v22, "jsonRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("evAdvisory");
    }
    else
    {
      objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("ev_advisory");
    }
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v27 = *(id *)(a1 + 48);
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v58 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v32, "jsonRepresentation");
          else
            objc_msgSend(v32, "dictionaryRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v33);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v29);
    }

    if (a2)
      v34 = CFSTR("incidentAdvisory");
    else
      v34 = CFSTR("incident_advisory");
    objc_msgSend(v4, "setObject:forKey:", v26, v34);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v36 = *(id *)(a1 + 40);
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v54 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v41, "jsonRepresentation");
          else
            objc_msgSend(v41, "dictionaryRepresentation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v42);

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
      }
      while (v38);
    }

    if (a2)
      v43 = CFSTR("genericAdvisory");
    else
      v43 = CFSTR("generic_advisory");
    objc_msgSend(v4, "setObject:forKey:", v35, v43);

  }
  v44 = *(void **)(a1 + 16);
  if (v44)
  {
    objc_msgSend(v44, "dictionaryRepresentation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v45, "count"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __47__GEOAdvisoriesInfo__dictionaryRepresentation___block_invoke;
      v51[3] = &unk_1E1C00600;
      v48 = v47;
      v52 = v48;
      objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", v51);
      v49 = v48;

      v46 = v49;
    }
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAdvisoriesInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOAdvisoriesInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAdvisoriesInfo)initWithDictionary:(id)a3
{
  return (GEOAdvisoriesInfo *)-[GEOAdvisoriesInfo _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOAdvisoryNotice *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOClickableAdvisory *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  GEOAdvisoryNotice *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  GEOAdvisoryNotice *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  GEOAdvisoryNotice *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  uint64_t v50;
  GEOAdvisoryNotice *v51;
  uint64_t v52;
  void *v53;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("noticeAdvisory");
      else
        v6 = CFSTR("notice_advisory");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v55 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v65 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOAdvisoryNotice alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOAdvisoryNotice initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOAdvisoryNotice initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addNoticeAdvisory:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
          }
          while (v10);
        }

        v5 = v55;
      }

      if (a3)
        v17 = CFSTR("clickableAdvisory");
      else
        v17 = CFSTR("clickable_advisory");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = [GEOClickableAdvisory alloc];
        if ((a3 & 1) != 0)
          v20 = -[GEOClickableAdvisory initWithJSON:](v19, "initWithJSON:", v18);
        else
          v20 = -[GEOClickableAdvisory initWithDictionary:](v19, "initWithDictionary:", v18);
        v21 = (void *)v20;
        objc_msgSend(a1, "setClickableAdvisory:", v20);

      }
      if (a3)
        v22 = CFSTR("tollAdvisory");
      else
        v22 = CFSTR("toll_advisory");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = [GEOAdvisoryNotice alloc];
        if ((a3 & 1) != 0)
          v25 = -[GEOAdvisoryNotice initWithJSON:](v24, "initWithJSON:", v23);
        else
          v25 = -[GEOAdvisoryNotice initWithDictionary:](v24, "initWithDictionary:", v23);
        v26 = (void *)v25;
        objc_msgSend(a1, "setTollAdvisory:", v25);

      }
      if (a3)
        v27 = CFSTR("evAdvisory");
      else
        v27 = CFSTR("ev_advisory");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = [GEOAdvisoryNotice alloc];
        if ((a3 & 1) != 0)
          v30 = -[GEOAdvisoryNotice initWithJSON:](v29, "initWithJSON:", v28);
        else
          v30 = -[GEOAdvisoryNotice initWithDictionary:](v29, "initWithDictionary:", v28);
        v31 = (void *)v30;
        objc_msgSend(a1, "setEvAdvisory:", v30);

      }
      if (a3)
        v32 = CFSTR("incidentAdvisory");
      else
        v32 = CFSTR("incident_advisory");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v34 = v33;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v61;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v61 != v37)
                objc_enumerationMutation(v34);
              v39 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v40 = [GEOAdvisoryNotice alloc];
                if ((a3 & 1) != 0)
                  v41 = -[GEOAdvisoryNotice initWithJSON:](v40, "initWithJSON:", v39);
                else
                  v41 = -[GEOAdvisoryNotice initWithDictionary:](v40, "initWithDictionary:", v39);
                v42 = (void *)v41;
                objc_msgSend(a1, "addIncidentAdvisory:", v41);

              }
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
          }
          while (v36);
        }

        v5 = v55;
      }

      if (a3)
        v43 = CFSTR("genericAdvisory");
      else
        v43 = CFSTR("generic_advisory");
      objc_msgSend(v5, "objectForKeyedSubscript:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v45 = v44;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v57;
          do
          {
            for (k = 0; k != v47; ++k)
            {
              if (*(_QWORD *)v57 != v48)
                objc_enumerationMutation(v45);
              v50 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v51 = [GEOAdvisoryNotice alloc];
                if ((a3 & 1) != 0)
                  v52 = -[GEOAdvisoryNotice initWithJSON:](v51, "initWithJSON:", v50);
                else
                  v52 = -[GEOAdvisoryNotice initWithDictionary:](v51, "initWithDictionary:", v50);
                v53 = (void *)v52;
                objc_msgSend(a1, "addGenericAdvisory:", v52);

              }
            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
          }
          while (v47);
        }

        v5 = v55;
      }

    }
  }

  return a1;
}

- (GEOAdvisoriesInfo)initWithJSON:(id)a3
{
  return (GEOAdvisoriesInfo *)-[GEOAdvisoriesInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_159;
    else
      v8 = (int *)&readAll__nonRecursiveTag_160;
    GEOAdvisoriesInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOAdvisoriesInfoCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAdvisoriesInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAdvisoriesInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAdvisoriesInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAdvisoriesInfo readAll:](self, "readAll:", 0);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_noticeAdvisorys;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    if (self->_clickableAdvisory)
      PBDataWriterWriteSubmessage();
    if (self->_tollAdvisory)
      PBDataWriterWriteSubmessage();
    if (self->_evAdvisory)
      PBDataWriterWriteSubmessage();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_incidentAdvisorys;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_genericAdvisorys;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  -[GEOAdvisoriesInfo _readEvAdvisory]((uint64_t)self);
  if (!-[GEOAdvisoryNotice hasGreenTeaWithValue:](self->_evAdvisory, "hasGreenTeaWithValue:", v3))
  {
    -[GEOAdvisoriesInfo _readGenericAdvisorys]((uint64_t)self);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v5 = self->_genericAdvisorys;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      -[GEOAdvisoriesInfo _readIncidentAdvisorys]((uint64_t)self);
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v5 = self->_incidentAdvisorys;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
LABEL_12:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3) & 1) != 0)
            break;
          if (v11 == ++v13)
          {
            v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
            if (v11)
              goto LABEL_12;
            goto LABEL_18;
          }
        }
      }
      else
      {
LABEL_18:

        -[GEOAdvisoriesInfo _readNoticeAdvisorys]((uint64_t)self);
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v5 = self->_noticeAdvisorys;
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
        if (!v14)
        {
LABEL_26:

          -[GEOAdvisoriesInfo _readTollAdvisory]((uint64_t)self);
          return -[GEOAdvisoryNotice hasGreenTeaWithValue:](self->_tollAdvisory, "hasGreenTeaWithValue:", v3);
        }
        v15 = v14;
        v16 = *(_QWORD *)v20;
LABEL_20:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17), "hasGreenTeaWithValue:", v3, (_QWORD)v19) & 1) != 0)
            break;
          if (v15 == ++v17)
          {
            v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
            if (v15)
              goto LABEL_20;
            goto LABEL_26;
          }
        }
      }
    }

  }
  return 1;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  id *v16;

  v16 = (id *)a3;
  -[GEOAdvisoriesInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 18) = self->_readerMarkPos;
  *((_DWORD *)v16 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOAdvisoriesInfo noticeAdvisorysCount](self, "noticeAdvisorysCount"))
  {
    objc_msgSend(v16, "clearNoticeAdvisorys");
    v4 = -[GEOAdvisoriesInfo noticeAdvisorysCount](self, "noticeAdvisorysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOAdvisoriesInfo noticeAdvisoryAtIndex:](self, "noticeAdvisoryAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addNoticeAdvisory:", v7);

      }
    }
  }
  if (self->_clickableAdvisory)
    objc_msgSend(v16, "setClickableAdvisory:");
  if (self->_tollAdvisory)
    objc_msgSend(v16, "setTollAdvisory:");
  if (self->_evAdvisory)
    objc_msgSend(v16, "setEvAdvisory:");
  if (-[GEOAdvisoriesInfo incidentAdvisorysCount](self, "incidentAdvisorysCount"))
  {
    objc_msgSend(v16, "clearIncidentAdvisorys");
    v8 = -[GEOAdvisoriesInfo incidentAdvisorysCount](self, "incidentAdvisorysCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOAdvisoriesInfo incidentAdvisoryAtIndex:](self, "incidentAdvisoryAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addIncidentAdvisory:", v11);

      }
    }
  }
  if (-[GEOAdvisoriesInfo genericAdvisorysCount](self, "genericAdvisorysCount"))
  {
    objc_msgSend(v16, "clearGenericAdvisorys");
    v12 = -[GEOAdvisoriesInfo genericAdvisorysCount](self, "genericAdvisorysCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOAdvisoriesInfo genericAdvisoryAtIndex:](self, "genericAdvisoryAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addGenericAdvisory:", v15);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOAdvisoriesInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOAdvisoriesInfo readAll:](self, "readAll:", 0);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = self->_noticeAdvisorys;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v39;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNoticeAdvisory:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v9);
  }

  v13 = -[GEOClickableAdvisory copyWithZone:](self->_clickableAdvisory, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[GEOAdvisoryNotice copyWithZone:](self->_tollAdvisory, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v15;

  v17 = -[GEOAdvisoryNotice copyWithZone:](self->_evAdvisory, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v17;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = self->_incidentAdvisorys;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v35;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIncidentAdvisory:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v20);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v24 = self->_genericAdvisorys;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v31;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v24);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v27), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend((id)v5, "addGenericAdvisory:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v25);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *noticeAdvisorys;
  GEOClickableAdvisory *clickableAdvisory;
  GEOAdvisoryNotice *tollAdvisory;
  GEOAdvisoryNotice *evAdvisory;
  NSMutableArray *incidentAdvisorys;
  NSMutableArray *genericAdvisorys;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOAdvisoriesInfo readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         noticeAdvisorys = self->_noticeAdvisorys,
         !((unint64_t)noticeAdvisorys | v4[7]))
     || -[NSMutableArray isEqual:](noticeAdvisorys, "isEqual:"))
    && ((clickableAdvisory = self->_clickableAdvisory, !((unint64_t)clickableAdvisory | v4[3]))
     || -[GEOClickableAdvisory isEqual:](clickableAdvisory, "isEqual:"))
    && ((tollAdvisory = self->_tollAdvisory, !((unint64_t)tollAdvisory | v4[8]))
     || -[GEOAdvisoryNotice isEqual:](tollAdvisory, "isEqual:"))
    && ((evAdvisory = self->_evAdvisory, !((unint64_t)evAdvisory | v4[4]))
     || -[GEOAdvisoryNotice isEqual:](evAdvisory, "isEqual:"))
    && ((incidentAdvisorys = self->_incidentAdvisorys, !((unint64_t)incidentAdvisorys | v4[6]))
     || -[NSMutableArray isEqual:](incidentAdvisorys, "isEqual:")))
  {
    genericAdvisorys = self->_genericAdvisorys;
    if ((unint64_t)genericAdvisorys | v4[5])
      v11 = -[NSMutableArray isEqual:](genericAdvisorys, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  -[GEOAdvisoriesInfo readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_noticeAdvisorys, "hash");
  v4 = -[GEOClickableAdvisory hash](self->_clickableAdvisory, "hash") ^ v3;
  v5 = -[GEOAdvisoryNotice hash](self->_tollAdvisory, "hash");
  v6 = v4 ^ v5 ^ -[GEOAdvisoryNotice hash](self->_evAdvisory, "hash");
  v7 = -[NSMutableArray hash](self->_incidentAdvisorys, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_genericAdvisorys, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOClickableAdvisory *clickableAdvisory;
  id v11;
  GEOAdvisoryNotice *tollAdvisory;
  id v13;
  GEOAdvisoryNotice *evAdvisory;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v4[7];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        -[GEOAdvisoriesInfo addNoticeAdvisory:](self, "addNoticeAdvisory:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v7);
  }

  clickableAdvisory = self->_clickableAdvisory;
  v11 = v4[3];
  if (clickableAdvisory)
  {
    if (v11)
      -[GEOClickableAdvisory mergeFrom:](clickableAdvisory, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOAdvisoriesInfo setClickableAdvisory:](self, "setClickableAdvisory:");
  }
  tollAdvisory = self->_tollAdvisory;
  v13 = v4[8];
  if (tollAdvisory)
  {
    if (v13)
      -[GEOAdvisoryNotice mergeFrom:](tollAdvisory, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOAdvisoriesInfo setTollAdvisory:](self, "setTollAdvisory:");
  }
  evAdvisory = self->_evAdvisory;
  v15 = v4[4];
  if (evAdvisory)
  {
    if (v15)
      -[GEOAdvisoryNotice mergeFrom:](evAdvisory, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEOAdvisoriesInfo setEvAdvisory:](self, "setEvAdvisory:");
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = v4[6];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        -[GEOAdvisoriesInfo addIncidentAdvisory:](self, "addIncidentAdvisory:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v18);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v4[5];
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        -[GEOAdvisoriesInfo addGenericAdvisory:](self, "addGenericAdvisory:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k), (_QWORD)v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v23);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOAdvisoriesInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_163);
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOAdvisoriesInfo readAll:](self, "readAll:", 0);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = self->_noticeAdvisorys;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

    -[GEOClickableAdvisory clearUnknownFields:](self->_clickableAdvisory, "clearUnknownFields:", 1);
    -[GEOAdvisoryNotice clearUnknownFields:](self->_tollAdvisory, "clearUnknownFields:", 1);
    -[GEOAdvisoryNotice clearUnknownFields:](self->_evAdvisory, "clearUnknownFields:", 1);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = self->_incidentAdvisorys;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v14);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = self->_genericAdvisorys;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "clearUnknownFields:", 1, (_QWORD)v22);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v19);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tollAdvisory, 0);
  objc_storeStrong((id *)&self->_noticeAdvisorys, 0);
  objc_storeStrong((id *)&self->_incidentAdvisorys, 0);
  objc_storeStrong((id *)&self->_genericAdvisorys, 0);
  objc_storeStrong((id *)&self->_evAdvisory, 0);
  objc_storeStrong((id *)&self->_clickableAdvisory, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
