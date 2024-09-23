@implementation GEODirectionsFeedback

- (GEODirectionsFeedback)init
{
  GEODirectionsFeedback *v2;
  GEODirectionsFeedback *v3;
  GEODirectionsFeedback *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEODirectionsFeedback;
  v2 = -[GEODirectionsFeedback init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEODirectionsFeedback)initWithData:(id)a3
{
  GEODirectionsFeedback *v3;
  GEODirectionsFeedback *v4;
  GEODirectionsFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEODirectionsFeedback;
  v3 = -[GEODirectionsFeedback initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionResponseID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionResponseID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDirectionResponseID
{
  -[GEODirectionsFeedback _readDirectionResponseID]((uint64_t)self);
  return self->_directionResponseID != 0;
}

- (NSData)directionResponseID
{
  -[GEODirectionsFeedback _readDirectionResponseID]((uint64_t)self);
  return self->_directionResponseID;
}

- (void)setDirectionResponseID:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_directionResponseID, a3);
}

- (void)_readStepFeedbacks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStepFeedbacks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)stepFeedbacks
{
  -[GEODirectionsFeedback _readStepFeedbacks]((uint64_t)self);
  return self->_stepFeedbacks;
}

- (void)setStepFeedbacks:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *stepFeedbacks;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  stepFeedbacks = self->_stepFeedbacks;
  self->_stepFeedbacks = v4;

}

- (void)clearStepFeedbacks
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_stepFeedbacks, "removeAllObjects");
}

- (void)addStepFeedback:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsFeedback _readStepFeedbacks]((uint64_t)self);
  -[GEODirectionsFeedback _addNoFlagsStepFeedback:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsStepFeedback:(uint64_t)a1
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

- (unint64_t)stepFeedbacksCount
{
  -[GEODirectionsFeedback _readStepFeedbacks]((uint64_t)self);
  return -[NSMutableArray count](self->_stepFeedbacks, "count");
}

- (id)stepFeedbackAtIndex:(unint64_t)a3
{
  -[GEODirectionsFeedback _readStepFeedbacks]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_stepFeedbacks, "objectAtIndex:", a3);
}

+ (Class)stepFeedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficRerouteFeedbacks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficRerouteFeedbacks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)trafficRerouteFeedbacks
{
  -[GEODirectionsFeedback _readTrafficRerouteFeedbacks]((uint64_t)self);
  return self->_trafficRerouteFeedbacks;
}

- (void)setTrafficRerouteFeedbacks:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficRerouteFeedbacks;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  trafficRerouteFeedbacks = self->_trafficRerouteFeedbacks;
  self->_trafficRerouteFeedbacks = v4;

}

- (void)clearTrafficRerouteFeedbacks
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_trafficRerouteFeedbacks, "removeAllObjects");
}

- (void)addTrafficRerouteFeedback:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsFeedback _readTrafficRerouteFeedbacks]((uint64_t)self);
  -[GEODirectionsFeedback _addNoFlagsTrafficRerouteFeedback:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsTrafficRerouteFeedback:(uint64_t)a1
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

- (unint64_t)trafficRerouteFeedbacksCount
{
  -[GEODirectionsFeedback _readTrafficRerouteFeedbacks]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficRerouteFeedbacks, "count");
}

- (id)trafficRerouteFeedbackAtIndex:(unint64_t)a3
{
  -[GEODirectionsFeedback _readTrafficRerouteFeedbacks]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficRerouteFeedbacks, "objectAtIndex:", a3);
}

+ (Class)trafficRerouteFeedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readAlightNotificationFeedbacks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlightNotificationFeedbacks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)alightNotificationFeedbacks
{
  -[GEODirectionsFeedback _readAlightNotificationFeedbacks]((uint64_t)self);
  return self->_alightNotificationFeedbacks;
}

- (void)setAlightNotificationFeedbacks:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *alightNotificationFeedbacks;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  alightNotificationFeedbacks = self->_alightNotificationFeedbacks;
  self->_alightNotificationFeedbacks = v4;

}

- (void)clearAlightNotificationFeedbacks
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_alightNotificationFeedbacks, "removeAllObjects");
}

- (void)addAlightNotificationFeedback:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsFeedback _readAlightNotificationFeedbacks]((uint64_t)self);
  -[GEODirectionsFeedback _addNoFlagsAlightNotificationFeedback:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsAlightNotificationFeedback:(uint64_t)a1
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

- (unint64_t)alightNotificationFeedbacksCount
{
  -[GEODirectionsFeedback _readAlightNotificationFeedbacks]((uint64_t)self);
  return -[NSMutableArray count](self->_alightNotificationFeedbacks, "count");
}

- (id)alightNotificationFeedbackAtIndex:(unint64_t)a3
{
  -[GEODirectionsFeedback _readAlightNotificationFeedbacks]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_alightNotificationFeedbacks, "objectAtIndex:", a3);
}

+ (Class)alightNotificationFeedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readGuidanceFeedbacks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidanceFeedbacks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)guidanceFeedbacks
{
  -[GEODirectionsFeedback _readGuidanceFeedbacks]((uint64_t)self);
  return self->_guidanceFeedbacks;
}

- (void)setGuidanceFeedbacks:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *guidanceFeedbacks;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  guidanceFeedbacks = self->_guidanceFeedbacks;
  self->_guidanceFeedbacks = v4;

}

- (void)clearGuidanceFeedbacks
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_guidanceFeedbacks, "removeAllObjects");
}

- (void)addGuidanceFeedback:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsFeedback _readGuidanceFeedbacks]((uint64_t)self);
  -[GEODirectionsFeedback _addNoFlagsGuidanceFeedback:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsGuidanceFeedback:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)guidanceFeedbacksCount
{
  -[GEODirectionsFeedback _readGuidanceFeedbacks]((uint64_t)self);
  return -[NSMutableArray count](self->_guidanceFeedbacks, "count");
}

- (id)guidanceFeedbackAtIndex:(unint64_t)a3
{
  -[GEODirectionsFeedback _readGuidanceFeedbacks]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_guidanceFeedbacks, "objectAtIndex:", a3);
}

+ (Class)guidanceFeedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readModalitys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModalitys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)modalitys
{
  -[GEODirectionsFeedback _readModalitys]((uint64_t)self);
  return self->_modalitys;
}

- (void)setModalitys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *modalitys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  modalitys = self->_modalitys;
  self->_modalitys = v4;

}

- (void)clearModalitys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_modalitys, "removeAllObjects");
}

- (void)addModality:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsFeedback _readModalitys]((uint64_t)self);
  -[GEODirectionsFeedback _addNoFlagsModality:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsModality:(uint64_t)a1
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

- (unint64_t)modalitysCount
{
  -[GEODirectionsFeedback _readModalitys]((uint64_t)self);
  return -[NSMutableArray count](self->_modalitys, "count");
}

- (id)modalityAtIndex:(unint64_t)a3
{
  -[GEODirectionsFeedback _readModalitys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_modalitys, "objectAtIndex:", a3);
}

+ (Class)modalityType
{
  return (Class)objc_opt_class();
}

- (BOOL)isCarplayConnected
{
  return self->_isCarplayConnected;
}

- (void)setIsCarplayConnected:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_isCarplayConnected = a3;
}

- (void)setHasIsCarplayConnected:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasIsCarplayConnected
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
  v8.super_class = (Class)GEODirectionsFeedback;
  -[GEODirectionsFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODirectionsFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODirectionsFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t n;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  __int128 v52;
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
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "directionResponseID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("directionResponseID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("directionResponseID"));
    }
  }

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v9 = *(id *)(a1 + 48);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v69 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("stepFeedback"));
  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v17 = *(id *)(a1 + 56);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v65 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("trafficRerouteFeedback"));
  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v25 = *(id *)(a1 + 16);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v61 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v30, "jsonRepresentation");
          else
            objc_msgSend(v30, "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v31);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
      }
      while (v27);
    }

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("alightNotificationFeedback"));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v33 = *(id *)(a1 + 32);
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v57;
      do
      {
        for (m = 0; m != v35; ++m)
        {
          if (*(_QWORD *)v57 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v38, "jsonRepresentation");
          else
            objc_msgSend(v38, "dictionaryRepresentation");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v39);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
      }
      while (v35);
    }

    if (a2)
      v40 = CFSTR("guidanceFeedback");
    else
      v40 = CFSTR("guidance_feedback");
    objc_msgSend(v4, "setObject:forKey:", v32, v40);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v42 = *(id *)(a1 + 40);
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v53;
      do
      {
        for (n = 0; n != v44; ++n)
        {
          if (*(_QWORD *)v53 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v47, "jsonRepresentation");
          else
            objc_msgSend(v47, "dictionaryRepresentation", (_QWORD)v52);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v48, (_QWORD)v52);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
      }
      while (v44);
    }

    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("modality"));
  }
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 76));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v50 = CFSTR("isCarplayConnected");
    else
      v50 = CFSTR("is_carplay_connected");
    objc_msgSend(v4, "setObject:forKey:", v49, v50, (_QWORD)v52);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEODirectionsFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEODirectionsFeedback)initWithDictionary:(id)a3
{
  return (GEODirectionsFeedback *)-[GEODirectionsFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  GEOStepFeedback *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  GEOTrafficRerouteFeedback *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  GEOAlightNotificationFeedback *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  uint64_t v45;
  GEOGuidanceEventFeedback *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  uint64_t v55;
  GEOModality *v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("directionResponseID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
        objc_msgSend(a1, "setDirectionResponseID:", v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stepFeedback"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v62 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v80;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v80 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = [GEOStepFeedback alloc];
                if ((a3 & 1) != 0)
                  v16 = -[GEOStepFeedback initWithJSON:](v15, "initWithJSON:", v14);
                else
                  v16 = -[GEOStepFeedback initWithDictionary:](v15, "initWithDictionary:", v14);
                v17 = (void *)v16;
                objc_msgSend(a1, "addStepFeedback:", v16);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
          }
          while (v11);
        }

        v5 = v62;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficRerouteFeedback"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v76;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v76 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = [GEOTrafficRerouteFeedback alloc];
                if ((a3 & 1) != 0)
                  v26 = -[GEOTrafficRerouteFeedback initWithJSON:](v25, "initWithJSON:", v24);
                else
                  v26 = -[GEOTrafficRerouteFeedback initWithDictionary:](v25, "initWithDictionary:", v24);
                v27 = (void *)v26;
                objc_msgSend(a1, "addTrafficRerouteFeedback:", v26);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
          }
          while (v21);
        }

        v5 = v62;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alightNotificationFeedback"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v72;
          do
          {
            for (k = 0; k != v31; ++k)
            {
              if (*(_QWORD *)v72 != v32)
                objc_enumerationMutation(v29);
              v34 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v35 = [GEOAlightNotificationFeedback alloc];
                if ((a3 & 1) != 0)
                  v36 = -[GEOAlightNotificationFeedback initWithJSON:](v35, "initWithJSON:", v34);
                else
                  v36 = -[GEOAlightNotificationFeedback initWithDictionary:](v35, "initWithDictionary:", v34);
                v37 = (void *)v36;
                objc_msgSend(a1, "addAlightNotificationFeedback:", v36);

              }
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
          }
          while (v31);
        }

        v5 = v62;
      }

      if (a3)
        v38 = CFSTR("guidanceFeedback");
      else
        v38 = CFSTR("guidance_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v40 = v39;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v68;
          do
          {
            for (m = 0; m != v42; ++m)
            {
              if (*(_QWORD *)v68 != v43)
                objc_enumerationMutation(v40);
              v45 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v46 = [GEOGuidanceEventFeedback alloc];
                if ((a3 & 1) != 0)
                  v47 = -[GEOGuidanceEventFeedback initWithJSON:](v46, "initWithJSON:", v45);
                else
                  v47 = -[GEOGuidanceEventFeedback initWithDictionary:](v46, "initWithDictionary:", v45);
                v48 = (void *)v47;
                objc_msgSend(a1, "addGuidanceFeedback:", v47);

              }
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
          }
          while (v42);
        }

        v5 = v62;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modality"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v50 = v49;
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v64;
          do
          {
            for (n = 0; n != v52; ++n)
            {
              if (*(_QWORD *)v64 != v53)
                objc_enumerationMutation(v50);
              v55 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * n);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v56 = [GEOModality alloc];
                if ((a3 & 1) != 0)
                  v57 = -[GEOModality initWithJSON:](v56, "initWithJSON:", v55);
                else
                  v57 = -[GEOModality initWithDictionary:](v56, "initWithDictionary:", v55);
                v58 = (void *)v57;
                objc_msgSend(a1, "addModality:", v57);

              }
            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
          }
          while (v52);
        }

        v5 = v62;
      }

      if (a3)
        v59 = CFSTR("isCarplayConnected");
      else
        v59 = CFSTR("is_carplay_connected");
      objc_msgSend(v5, "objectForKeyedSubscript:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsCarplayConnected:", objc_msgSend(v60, "BOOLValue"));

    }
  }

  return a1;
}

- (GEODirectionsFeedback)initWithJSON:(id)a3
{
  return (GEODirectionsFeedback *)-[GEODirectionsFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_38;
    else
      v8 = (int *)&readAll__nonRecursiveTag_38;
    GEODirectionsFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEODirectionsFeedbackCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEODirectionsFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODirectionsFeedbackReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  PBDataReader *v26;
  void *v27;
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
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 1u))
  {
    v26 = self->_reader;
    objc_sync_enter(v26);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v27);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v26);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEODirectionsFeedback readAll:](self, "readAll:", 0);
    if (self->_directionResponseID)
      PBDataWriterWriteDataField();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v6 = self->_stepFeedbacks;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v45;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v45 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v7);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v10 = self->_trafficRerouteFeedbacks;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v41;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      }
      while (v11);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = self->_alightNotificationFeedbacks;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v37;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v15);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = self->_guidanceFeedbacks;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v33;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
      }
      while (v19);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = self->_modalitys;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v48, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v29;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v22);
          PBDataWriterWriteSubmessage();
          ++v25;
        }
        while (v23 != v25);
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v48, 16);
      }
      while (v23);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsFeedback _readTrafficRerouteFeedbacks]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_trafficRerouteFeedbacks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
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
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  id *v24;

  v24 = (id *)a3;
  -[GEODirectionsFeedback readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v24 + 1, self->_reader);
  *((_DWORD *)v24 + 16) = self->_readerMarkPos;
  *((_DWORD *)v24 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_directionResponseID)
    objc_msgSend(v24, "setDirectionResponseID:");
  if (-[GEODirectionsFeedback stepFeedbacksCount](self, "stepFeedbacksCount"))
  {
    objc_msgSend(v24, "clearStepFeedbacks");
    v4 = -[GEODirectionsFeedback stepFeedbacksCount](self, "stepFeedbacksCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEODirectionsFeedback stepFeedbackAtIndex:](self, "stepFeedbackAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addStepFeedback:", v7);

      }
    }
  }
  if (-[GEODirectionsFeedback trafficRerouteFeedbacksCount](self, "trafficRerouteFeedbacksCount"))
  {
    objc_msgSend(v24, "clearTrafficRerouteFeedbacks");
    v8 = -[GEODirectionsFeedback trafficRerouteFeedbacksCount](self, "trafficRerouteFeedbacksCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEODirectionsFeedback trafficRerouteFeedbackAtIndex:](self, "trafficRerouteFeedbackAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addTrafficRerouteFeedback:", v11);

      }
    }
  }
  if (-[GEODirectionsFeedback alightNotificationFeedbacksCount](self, "alightNotificationFeedbacksCount"))
  {
    objc_msgSend(v24, "clearAlightNotificationFeedbacks");
    v12 = -[GEODirectionsFeedback alightNotificationFeedbacksCount](self, "alightNotificationFeedbacksCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEODirectionsFeedback alightNotificationFeedbackAtIndex:](self, "alightNotificationFeedbackAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addAlightNotificationFeedback:", v15);

      }
    }
  }
  if (-[GEODirectionsFeedback guidanceFeedbacksCount](self, "guidanceFeedbacksCount"))
  {
    objc_msgSend(v24, "clearGuidanceFeedbacks");
    v16 = -[GEODirectionsFeedback guidanceFeedbacksCount](self, "guidanceFeedbacksCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEODirectionsFeedback guidanceFeedbackAtIndex:](self, "guidanceFeedbackAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addGuidanceFeedback:", v19);

      }
    }
  }
  if (-[GEODirectionsFeedback modalitysCount](self, "modalitysCount"))
  {
    objc_msgSend(v24, "clearModalitys");
    v20 = -[GEODirectionsFeedback modalitysCount](self, "modalitysCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[GEODirectionsFeedback modalityAtIndex:](self, "modalityAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addModality:", v23);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v24 + 76) = self->_isCarplayConnected;
    *((_BYTE *)v24 + 80) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
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
      GEODirectionsFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEODirectionsFeedback readAll:](self, "readAll:", 0);
  v9 = -[NSData copyWithZone:](self->_directionResponseID, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v11 = self->_stepFeedbacks;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v54 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStepFeedback:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v12);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v16 = self->_trafficRerouteFeedbacks;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v50 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTrafficRerouteFeedback:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v17);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v21 = self->_alightNotificationFeedbacks;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v46 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAlightNotificationFeedback:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    }
    while (v22);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v26 = self->_guidanceFeedbacks;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v42;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v26);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addGuidanceFeedback:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    }
    while (v27);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v31 = self->_modalitys;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v38;
    do
    {
      for (n = 0; n != v32; ++n)
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(v31);
        v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v37);
        objc_msgSend((id)v5, "addModality:", v35);

      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
    }
    while (v32);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 76) = self->_isCarplayConnected;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *directionResponseID;
  NSMutableArray *stepFeedbacks;
  NSMutableArray *trafficRerouteFeedbacks;
  NSMutableArray *alightNotificationFeedbacks;
  NSMutableArray *guidanceFeedbacks;
  NSMutableArray *modalitys;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEODirectionsFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  directionResponseID = self->_directionResponseID;
  if ((unint64_t)directionResponseID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](directionResponseID, "isEqual:"))
      goto LABEL_16;
  }
  stepFeedbacks = self->_stepFeedbacks;
  if ((unint64_t)stepFeedbacks | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](stepFeedbacks, "isEqual:"))
      goto LABEL_16;
  }
  trafficRerouteFeedbacks = self->_trafficRerouteFeedbacks;
  if ((unint64_t)trafficRerouteFeedbacks | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](trafficRerouteFeedbacks, "isEqual:"))
      goto LABEL_16;
  }
  alightNotificationFeedbacks = self->_alightNotificationFeedbacks;
  if ((unint64_t)alightNotificationFeedbacks | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](alightNotificationFeedbacks, "isEqual:"))
      goto LABEL_16;
  }
  guidanceFeedbacks = self->_guidanceFeedbacks;
  if ((unint64_t)guidanceFeedbacks | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](guidanceFeedbacks, "isEqual:"))
      goto LABEL_16;
  }
  modalitys = self->_modalitys;
  if ((unint64_t)modalitys | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](modalitys, "isEqual:"))
      goto LABEL_16;
  }
  v11 = (*((_BYTE *)v4 + 80) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0)
    {
LABEL_16:
      v11 = 0;
      goto LABEL_17;
    }
    if (self->_isCarplayConnected)
    {
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_16;
    }
    else if (*((_BYTE *)v4 + 76))
    {
      goto LABEL_16;
    }
    v11 = 1;
  }
LABEL_17:

  return v11;
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

  -[GEODirectionsFeedback readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_directionResponseID, "hash");
  v4 = -[NSMutableArray hash](self->_stepFeedbacks, "hash");
  v5 = -[NSMutableArray hash](self->_trafficRerouteFeedbacks, "hash");
  v6 = -[NSMutableArray hash](self->_alightNotificationFeedbacks, "hash");
  v7 = -[NSMutableArray hash](self->_guidanceFeedbacks, "hash");
  v8 = -[NSMutableArray hash](self->_modalitys, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v9 = 2654435761 * self->_isCarplayConnected;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
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
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 3))
    -[GEODirectionsFeedback setDirectionResponseID:](self, "setDirectionResponseID:");
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = *((id *)v4 + 6);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        -[GEODirectionsFeedback addStepFeedback:](self, "addStepFeedback:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = *((id *)v4 + 7);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        -[GEODirectionsFeedback addTrafficRerouteFeedback:](self, "addTrafficRerouteFeedback:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = *((id *)v4 + 2);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        -[GEODirectionsFeedback addAlightNotificationFeedback:](self, "addAlightNotificationFeedback:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = *((id *)v4 + 4);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        -[GEODirectionsFeedback addGuidanceFeedback:](self, "addGuidanceFeedback:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = *((id *)v4 + 5);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        -[GEODirectionsFeedback addModality:](self, "addModality:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * n), (_QWORD)v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    self->_isCarplayConnected = *((_BYTE *)v4 + 76);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficRerouteFeedbacks, 0);
  objc_storeStrong((id *)&self->_stepFeedbacks, 0);
  objc_storeStrong((id *)&self->_modalitys, 0);
  objc_storeStrong((id *)&self->_guidanceFeedbacks, 0);
  objc_storeStrong((id *)&self->_directionResponseID, 0);
  objc_storeStrong((id *)&self->_alightNotificationFeedbacks, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
