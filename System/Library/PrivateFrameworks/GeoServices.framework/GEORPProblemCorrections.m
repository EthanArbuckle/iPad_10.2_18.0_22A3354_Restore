@implementation GEORPProblemCorrections

- (GEORPProblemCorrections)init
{
  GEORPProblemCorrections *v2;
  GEORPProblemCorrections *v3;
  GEORPProblemCorrections *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemCorrections;
  v2 = -[GEORPProblemCorrections init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemCorrections)initWithData:(id)a3
{
  GEORPProblemCorrections *v3;
  GEORPProblemCorrections *v4;
  GEORPProblemCorrections *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemCorrections;
  v3 = -[GEORPProblemCorrections initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCorrectedFields
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedFields_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (NSMutableArray)correctedFields
{
  -[GEORPProblemCorrections _readCorrectedFields]((uint64_t)self);
  return self->_correctedFields;
}

- (void)setCorrectedFields:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *correctedFields;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  correctedFields = self->_correctedFields;
  self->_correctedFields = v4;

}

- (void)clearCorrectedFields
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  -[NSMutableArray removeAllObjects](self->_correctedFields, "removeAllObjects");
}

- (void)addCorrectedField:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPProblemCorrections _readCorrectedFields]((uint64_t)self);
  -[GEORPProblemCorrections _addNoFlagsCorrectedField:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsCorrectedField:(uint64_t)a1
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

- (unint64_t)correctedFieldsCount
{
  -[GEORPProblemCorrections _readCorrectedFields]((uint64_t)self);
  return -[NSMutableArray count](self->_correctedFields, "count");
}

- (id)correctedFieldAtIndex:(unint64_t)a3
{
  -[GEORPProblemCorrections _readCorrectedFields]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_correctedFields, "objectAtIndex:", a3);
}

+ (Class)correctedFieldType
{
  return (Class)objc_opt_class();
}

- (void)_readCorrectedLabel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedLabel_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasCorrectedLabel
{
  -[GEORPProblemCorrections _readCorrectedLabel]((uint64_t)self);
  return self->_correctedLabel != 0;
}

- (GEORPCorrectedLabel)correctedLabel
{
  -[GEORPProblemCorrections _readCorrectedLabel]((uint64_t)self);
  return self->_correctedLabel;
}

- (void)setCorrectedLabel:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  objc_storeStrong((id *)&self->_correctedLabel, a3);
}

- (void)_readCorrectedCoordinate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedCoordinate_tags_2197);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasCorrectedCoordinate
{
  -[GEORPProblemCorrections _readCorrectedCoordinate]((uint64_t)self);
  return self->_correctedCoordinate != 0;
}

- (GEORPCorrectedCoordinate)correctedCoordinate
{
  -[GEORPProblemCorrections _readCorrectedCoordinate]((uint64_t)self);
  return self->_correctedCoordinate;
}

- (void)setCorrectedCoordinate:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  objc_storeStrong((id *)&self->_correctedCoordinate, a3);
}

- (void)_readCorrectedSearch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedSearch_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasCorrectedSearch
{
  -[GEORPProblemCorrections _readCorrectedSearch]((uint64_t)self);
  return self->_correctedSearch != 0;
}

- (GEORPCorrectedSearch)correctedSearch
{
  -[GEORPProblemCorrections _readCorrectedSearch]((uint64_t)self);
  return self->_correctedSearch;
}

- (void)setCorrectedSearch:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_correctedSearch, a3);
}

- (void)_readCorrectedMapLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedMapLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasCorrectedMapLocation
{
  -[GEORPProblemCorrections _readCorrectedMapLocation]((uint64_t)self);
  return self->_correctedMapLocation != 0;
}

- (GEORPMapLocation)correctedMapLocation
{
  -[GEORPProblemCorrections _readCorrectedMapLocation]((uint64_t)self);
  return self->_correctedMapLocation;
}

- (void)setCorrectedMapLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  objc_storeStrong((id *)&self->_correctedMapLocation, a3);
}

- (void)_readComments
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readComments_tags_2198);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasComments
{
  -[GEORPProblemCorrections _readComments]((uint64_t)self);
  return self->_comments != 0;
}

- (NSString)comments
{
  -[GEORPProblemCorrections _readComments]((uint64_t)self);
  return self->_comments;
}

- (void)setComments:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  objc_storeStrong((id *)&self->_comments, a3);
}

- (void)_readPlaceProblem
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceProblem_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasPlaceProblem
{
  -[GEORPProblemCorrections _readPlaceProblem]((uint64_t)self);
  return self->_placeProblem != 0;
}

- (GEORPPlaceProblem)placeProblem
{
  -[GEORPProblemCorrections _readPlaceProblem]((uint64_t)self);
  return self->_placeProblem;
}

- (void)setPlaceProblem:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_placeProblem, a3);
}

- (void)_readDirectionsProblem
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsProblem_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasDirectionsProblem
{
  -[GEORPProblemCorrections _readDirectionsProblem]((uint64_t)self);
  return self->_directionsProblem != 0;
}

- (GEORPDirectionsProblem)directionsProblem
{
  -[GEORPProblemCorrections _readDirectionsProblem]((uint64_t)self);
  return self->_directionsProblem;
}

- (void)setDirectionsProblem:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_directionsProblem, a3);
}

- (void)_readPhotoWithMetadatas
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoWithMetadatas_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (NSMutableArray)photoWithMetadatas
{
  -[GEORPProblemCorrections _readPhotoWithMetadatas]((uint64_t)self);
  return self->_photoWithMetadatas;
}

- (void)setPhotoWithMetadatas:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *photoWithMetadatas;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  photoWithMetadatas = self->_photoWithMetadatas;
  self->_photoWithMetadatas = v4;

}

- (void)clearPhotoWithMetadatas
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  -[NSMutableArray removeAllObjects](self->_photoWithMetadatas, "removeAllObjects");
}

- (void)addPhotoWithMetadata:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPProblemCorrections _readPhotoWithMetadatas]((uint64_t)self);
  -[GEORPProblemCorrections _addNoFlagsPhotoWithMetadata:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsPhotoWithMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)photoWithMetadatasCount
{
  -[GEORPProblemCorrections _readPhotoWithMetadatas]((uint64_t)self);
  return -[NSMutableArray count](self->_photoWithMetadatas, "count");
}

- (id)photoWithMetadataAtIndex:(unint64_t)a3
{
  -[GEORPProblemCorrections _readPhotoWithMetadatas]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_photoWithMetadatas, "objectAtIndex:", a3);
}

+ (Class)photoWithMetadataType
{
  return (Class)objc_opt_class();
}

- (BOOL)delayed
{
  return self->_delayed;
}

- (void)setDelayed:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_delayed = a3;
}

- (void)setHasDelayed:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasDelayed
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readCorrectedFlags
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedFlags_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (NSMutableArray)correctedFlags
{
  -[GEORPProblemCorrections _readCorrectedFlags]((uint64_t)self);
  return self->_correctedFlags;
}

- (void)setCorrectedFlags:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *correctedFlags;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  correctedFlags = self->_correctedFlags;
  self->_correctedFlags = v4;

}

- (void)clearCorrectedFlags
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  -[NSMutableArray removeAllObjects](self->_correctedFlags, "removeAllObjects");
}

- (void)addCorrectedFlag:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPProblemCorrections _readCorrectedFlags]((uint64_t)self);
  -[GEORPProblemCorrections _addNoFlagsCorrectedFlag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsCorrectedFlag:(uint64_t)a1
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

- (unint64_t)correctedFlagsCount
{
  -[GEORPProblemCorrections _readCorrectedFlags]((uint64_t)self);
  return -[NSMutableArray count](self->_correctedFlags, "count");
}

- (id)correctedFlagAtIndex:(unint64_t)a3
{
  -[GEORPProblemCorrections _readCorrectedFlags]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_correctedFlags, "objectAtIndex:", a3);
}

+ (Class)correctedFlagType
{
  return (Class)objc_opt_class();
}

- (void)_readMerchantLookupCorrections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantLookupCorrections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasMerchantLookupCorrections
{
  -[GEORPProblemCorrections _readMerchantLookupCorrections]((uint64_t)self);
  return self->_merchantLookupCorrections != 0;
}

- (GEORPMerchantLookupCorrections)merchantLookupCorrections
{
  -[GEORPProblemCorrections _readMerchantLookupCorrections]((uint64_t)self);
  return self->_merchantLookupCorrections;
}

- (void)setMerchantLookupCorrections:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_merchantLookupCorrections, a3);
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
  v8.super_class = (Class)GEORPProblemCorrections;
  -[GEORPProblemCorrections description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPProblemCorrections dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
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
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v72 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("correctedField");
    else
      v13 = CFSTR("corrected_field");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  objc_msgSend((id)a1, "correctedLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("correctedLabel");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("corrected_label");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  objc_msgSend((id)a1, "correctedCoordinate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("correctedCoordinate");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("corrected_coordinate");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  objc_msgSend((id)a1, "correctedSearch");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v22, "jsonRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("correctedSearch");
    }
    else
    {
      objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("corrected_search");
    }
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  objc_msgSend((id)a1, "correctedMapLocation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "jsonRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("correctedMapLocation");
    }
    else
    {
      objc_msgSend(v26, "dictionaryRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("corrected_map_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  objc_msgSend((id)a1, "comments");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("comments"));

  objc_msgSend((id)a1, "placeProblem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("placeProblem");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("place_problem");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  objc_msgSend((id)a1, "directionsProblem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("directionsProblem");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("directions_problem");
    }
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

  }
  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v40 = *(id *)(a1 + 88);
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v68 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v45, "jsonRepresentation");
          else
            objc_msgSend(v45, "dictionaryRepresentation");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v46);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v42);
    }

    if (a2)
      v47 = CFSTR("photoWithMetadata");
    else
      v47 = CFSTR("photo_with_metadata");
    objc_msgSend(v4, "setObject:forKey:", v39, v47);

  }
  if ((*(_WORD *)(a1 + 120) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 116));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("delayed"));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v50 = *(id *)(a1 + 40);
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v52; ++k)
        {
          if (*(_QWORD *)v64 != v53)
            objc_enumerationMutation(v50);
          v55 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v55, "jsonRepresentation");
          else
            objc_msgSend(v55, "dictionaryRepresentation", (_QWORD)v63);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v56, (_QWORD)v63);

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v52);
    }

    if (a2)
      v57 = CFSTR("correctedFlag");
    else
      v57 = CFSTR("corrected_flag");
    objc_msgSend(v4, "setObject:forKey:", v49, v57, (_QWORD)v63);

  }
  objc_msgSend((id)a1, "merchantLookupCorrections");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v58)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v58, "jsonRepresentation");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = CFSTR("merchantLookupCorrections");
    }
    else
    {
      objc_msgSend(v58, "dictionaryRepresentation");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = CFSTR("merchant_lookup_corrections");
    }
    objc_msgSend(v4, "setObject:forKey:", v60, v61);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPProblemCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemCorrections)initWithDictionary:(id)a3
{
  return (GEORPProblemCorrections *)-[GEORPProblemCorrections _initWithDictionary:isJSON:](self, a3, 0);
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
  GEORPCorrectedField *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEORPCorrectedLabel *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  GEORPCorrectedCoordinate *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  GEORPCorrectedSearch *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  GEORPMapLocation *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  GEORPPlaceProblem *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  GEORPDirectionsProblem *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  uint64_t v56;
  GEORPPhotoWithMetadata *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  uint64_t v68;
  GEORPCorrectedFlag *v69;
  uint64_t v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  GEORPMerchantLookupCorrections *v74;
  uint64_t v75;
  void *v76;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("correctedField");
      else
        v6 = CFSTR("corrected_field");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v78 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v88;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v88 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEORPCorrectedField alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEORPCorrectedField initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEORPCorrectedField initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addCorrectedField:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
          }
          while (v10);
        }

        v5 = v78;
      }

      if (a3)
        v17 = CFSTR("correctedLabel");
      else
        v17 = CFSTR("corrected_label");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = [GEORPCorrectedLabel alloc];
        if ((a3 & 1) != 0)
          v20 = -[GEORPCorrectedLabel initWithJSON:](v19, "initWithJSON:", v18);
        else
          v20 = -[GEORPCorrectedLabel initWithDictionary:](v19, "initWithDictionary:", v18);
        v21 = (void *)v20;
        objc_msgSend(a1, "setCorrectedLabel:", v20);

      }
      if (a3)
        v22 = CFSTR("correctedCoordinate");
      else
        v22 = CFSTR("corrected_coordinate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = [GEORPCorrectedCoordinate alloc];
        if ((a3 & 1) != 0)
          v25 = -[GEORPCorrectedCoordinate initWithJSON:](v24, "initWithJSON:", v23);
        else
          v25 = -[GEORPCorrectedCoordinate initWithDictionary:](v24, "initWithDictionary:", v23);
        v26 = (void *)v25;
        objc_msgSend(a1, "setCorrectedCoordinate:", v25);

      }
      if (a3)
        v27 = CFSTR("correctedSearch");
      else
        v27 = CFSTR("corrected_search");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = [GEORPCorrectedSearch alloc];
        if ((a3 & 1) != 0)
          v30 = -[GEORPCorrectedSearch initWithJSON:](v29, "initWithJSON:", v28);
        else
          v30 = -[GEORPCorrectedSearch initWithDictionary:](v29, "initWithDictionary:", v28);
        v31 = (void *)v30;
        objc_msgSend(a1, "setCorrectedSearch:", v30);

      }
      if (a3)
        v32 = CFSTR("correctedMapLocation");
      else
        v32 = CFSTR("corrected_map_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = [GEORPMapLocation alloc];
        if ((a3 & 1) != 0)
          v35 = -[GEORPMapLocation initWithJSON:](v34, "initWithJSON:", v33);
        else
          v35 = -[GEORPMapLocation initWithDictionary:](v34, "initWithDictionary:", v33);
        v36 = (void *)v35;
        objc_msgSend(a1, "setCorrectedMapLocation:", v35);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("comments"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = (void *)objc_msgSend(v37, "copy");
        objc_msgSend(a1, "setComments:", v38);

      }
      if (a3)
        v39 = CFSTR("placeProblem");
      else
        v39 = CFSTR("place_problem");
      objc_msgSend(v5, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = [GEORPPlaceProblem alloc];
        if ((a3 & 1) != 0)
          v42 = -[GEORPPlaceProblem initWithJSON:](v41, "initWithJSON:", v40);
        else
          v42 = -[GEORPPlaceProblem initWithDictionary:](v41, "initWithDictionary:", v40);
        v43 = (void *)v42;
        objc_msgSend(a1, "setPlaceProblem:", v42);

      }
      if (a3)
        v44 = CFSTR("directionsProblem");
      else
        v44 = CFSTR("directions_problem");
      objc_msgSend(v5, "objectForKeyedSubscript:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = [GEORPDirectionsProblem alloc];
        if ((a3 & 1) != 0)
          v47 = -[GEORPDirectionsProblem initWithJSON:](v46, "initWithJSON:", v45);
        else
          v47 = -[GEORPDirectionsProblem initWithDictionary:](v46, "initWithDictionary:", v45);
        v48 = (void *)v47;
        objc_msgSend(a1, "setDirectionsProblem:", v47);

      }
      if (a3)
        v49 = CFSTR("photoWithMetadata");
      else
        v49 = CFSTR("photo_with_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v51 = v50;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v84;
          do
          {
            for (j = 0; j != v53; ++j)
            {
              if (*(_QWORD *)v84 != v54)
                objc_enumerationMutation(v51);
              v56 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v57 = [GEORPPhotoWithMetadata alloc];
                if ((a3 & 1) != 0)
                  v58 = -[GEORPPhotoWithMetadata initWithJSON:](v57, "initWithJSON:", v56);
                else
                  v58 = -[GEORPPhotoWithMetadata initWithDictionary:](v57, "initWithDictionary:", v56);
                v59 = (void *)v58;
                objc_msgSend(a1, "addPhotoWithMetadata:", v58);

              }
            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
          }
          while (v53);
        }

        v5 = v78;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("delayed"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDelayed:", objc_msgSend(v60, "BOOLValue"));

      if (a3)
        v61 = CFSTR("correctedFlag");
      else
        v61 = CFSTR("corrected_flag");
      objc_msgSend(v5, "objectForKeyedSubscript:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v63 = v62;
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v80;
          do
          {
            for (k = 0; k != v65; ++k)
            {
              if (*(_QWORD *)v80 != v66)
                objc_enumerationMutation(v63);
              v68 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v69 = [GEORPCorrectedFlag alloc];
                if ((a3 & 1) != 0)
                  v70 = -[GEORPCorrectedFlag initWithJSON:](v69, "initWithJSON:", v68);
                else
                  v70 = -[GEORPCorrectedFlag initWithDictionary:](v69, "initWithDictionary:", v68);
                v71 = (void *)v70;
                objc_msgSend(a1, "addCorrectedFlag:", v70);

              }
            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
          }
          while (v65);
        }

        v5 = v78;
      }

      if (a3)
        v72 = CFSTR("merchantLookupCorrections");
      else
        v72 = CFSTR("merchant_lookup_corrections");
      objc_msgSend(v5, "objectForKeyedSubscript:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v74 = [GEORPMerchantLookupCorrections alloc];
        if ((a3 & 1) != 0)
          v75 = -[GEORPMerchantLookupCorrections initWithJSON:](v74, "initWithJSON:", v73);
        else
          v75 = -[GEORPMerchantLookupCorrections initWithDictionary:](v74, "initWithDictionary:", v73);
        v76 = (void *)v75;
        objc_msgSend(a1, "setMerchantLookupCorrections:", v75);

      }
    }
  }

  return a1;
}

- (GEORPProblemCorrections)initWithJSON:(id)a3
{
  return (GEORPProblemCorrections *)-[GEORPProblemCorrections _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2244;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2245;
    GEORPProblemCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPProblemCorrectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
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
  if (self->_reader && (_GEORPProblemCorrectionsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPProblemCorrections readAll:](self, "readAll:", 0);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_correctedFields;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    if (self->_correctedLabel)
      PBDataWriterWriteSubmessage();
    if (self->_correctedCoordinate)
      PBDataWriterWriteSubmessage();
    if (self->_correctedSearch)
      PBDataWriterWriteSubmessage();
    if (self->_correctedMapLocation)
      PBDataWriterWriteSubmessage();
    if (self->_comments)
      PBDataWriterWriteStringField();
    if (self->_placeProblem)
      PBDataWriterWriteSubmessage();
    if (self->_directionsProblem)
      PBDataWriterWriteSubmessage();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_photoWithMetadatas;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }

    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_correctedFlags;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v15);
    }

    if (self->_merchantLookupCorrections)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPProblemCorrectionsClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEORPProblemCorrections _readCorrectedCoordinate]((uint64_t)self);
  if (-[GEORPCorrectedCoordinate hasGreenTeaWithValue:](self->_correctedCoordinate, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPProblemCorrections _readCorrectedLabel]((uint64_t)self);
  if (-[GEORPCorrectedLabel hasGreenTeaWithValue:](self->_correctedLabel, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPProblemCorrections _readCorrectedMapLocation]((uint64_t)self);
  if (-[GEORPMapLocation hasGreenTeaWithValue:](self->_correctedMapLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPProblemCorrections _readCorrectedSearch]((uint64_t)self);
  if (-[GEORPCorrectedSearch hasGreenTeaWithValue:](self->_correctedSearch, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPProblemCorrections _readDirectionsProblem]((uint64_t)self);
  if (-[GEORPDirectionsProblem hasGreenTeaWithValue:](self->_directionsProblem, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPProblemCorrections _readPhotoWithMetadatas]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_photoWithMetadatas;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_18;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v9)
        continue;
      break;
    }
  }
  v5 = 0;
LABEL_18:

  return v5;
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
  -[GEORPProblemCorrections readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 26) = self->_readerMarkPos;
  *((_DWORD *)v16 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORPProblemCorrections correctedFieldsCount](self, "correctedFieldsCount"))
  {
    objc_msgSend(v16, "clearCorrectedFields");
    v4 = -[GEORPProblemCorrections correctedFieldsCount](self, "correctedFieldsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPProblemCorrections correctedFieldAtIndex:](self, "correctedFieldAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addCorrectedField:", v7);

      }
    }
  }
  if (self->_correctedLabel)
    objc_msgSend(v16, "setCorrectedLabel:");
  if (self->_correctedCoordinate)
    objc_msgSend(v16, "setCorrectedCoordinate:");
  if (self->_correctedSearch)
    objc_msgSend(v16, "setCorrectedSearch:");
  if (self->_correctedMapLocation)
    objc_msgSend(v16, "setCorrectedMapLocation:");
  if (self->_comments)
    objc_msgSend(v16, "setComments:");
  if (self->_placeProblem)
    objc_msgSend(v16, "setPlaceProblem:");
  if (self->_directionsProblem)
    objc_msgSend(v16, "setDirectionsProblem:");
  if (-[GEORPProblemCorrections photoWithMetadatasCount](self, "photoWithMetadatasCount"))
  {
    objc_msgSend(v16, "clearPhotoWithMetadatas");
    v8 = -[GEORPProblemCorrections photoWithMetadatasCount](self, "photoWithMetadatasCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORPProblemCorrections photoWithMetadataAtIndex:](self, "photoWithMetadataAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addPhotoWithMetadata:", v11);

      }
    }
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v16 + 116) = self->_delayed;
    *((_WORD *)v16 + 60) |= 1u;
  }
  if (-[GEORPProblemCorrections correctedFlagsCount](self, "correctedFlagsCount"))
  {
    objc_msgSend(v16, "clearCorrectedFlags");
    v12 = -[GEORPProblemCorrections correctedFlagsCount](self, "correctedFlagsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEORPProblemCorrections correctedFlagAtIndex:](self, "correctedFlagAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addCorrectedFlag:", v15);

      }
    }
  }
  if (self->_merchantLookupCorrections)
    objc_msgSend(v16, "setMerchantLookupCorrections:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  id v38;
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
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPProblemCorrectionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPProblemCorrections readAll:](self, "readAll:", 0);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v9 = self->_correctedFields;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCorrectedField:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v10);
  }

  v14 = -[GEORPCorrectedLabel copyWithZone:](self->_correctedLabel, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[GEORPCorrectedCoordinate copyWithZone:](self->_correctedCoordinate, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = -[GEORPCorrectedSearch copyWithZone:](self->_correctedSearch, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  v20 = -[GEORPMapLocation copyWithZone:](self->_correctedMapLocation, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v20;

  v22 = -[NSString copyWithZone:](self->_comments, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;

  v24 = -[GEORPPlaceProblem copyWithZone:](self->_placeProblem, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v24;

  v26 = -[GEORPDirectionsProblem copyWithZone:](self->_directionsProblem, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v26;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v28 = self->_photoWithMetadatas;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(v28);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPhotoWithMetadata:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v29);
  }

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 116) = self->_delayed;
    *(_WORD *)(v5 + 120) |= 1u;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v33 = self->_correctedFlags;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v41 != v35)
          objc_enumerationMutation(v33);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v40);
        objc_msgSend((id)v5, "addCorrectedFlag:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v34);
  }

  v38 = -[GEORPMerchantLookupCorrections copyWithZone:](self->_merchantLookupCorrections, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v38;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *correctedFields;
  GEORPCorrectedLabel *correctedLabel;
  GEORPCorrectedCoordinate *correctedCoordinate;
  GEORPCorrectedSearch *correctedSearch;
  GEORPMapLocation *correctedMapLocation;
  NSString *comments;
  GEORPPlaceProblem *placeProblem;
  GEORPDirectionsProblem *directionsProblem;
  NSMutableArray *photoWithMetadatas;
  __int16 v14;
  NSMutableArray *correctedFlags;
  GEORPMerchantLookupCorrections *merchantLookupCorrections;
  char v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[GEORPProblemCorrections readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  correctedFields = self->_correctedFields;
  if ((unint64_t)correctedFields | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](correctedFields, "isEqual:"))
      goto LABEL_32;
  }
  correctedLabel = self->_correctedLabel;
  if ((unint64_t)correctedLabel | *((_QWORD *)v4 + 6))
  {
    if (!-[GEORPCorrectedLabel isEqual:](correctedLabel, "isEqual:"))
      goto LABEL_32;
  }
  correctedCoordinate = self->_correctedCoordinate;
  if ((unint64_t)correctedCoordinate | *((_QWORD *)v4 + 3))
  {
    if (!-[GEORPCorrectedCoordinate isEqual:](correctedCoordinate, "isEqual:"))
      goto LABEL_32;
  }
  correctedSearch = self->_correctedSearch;
  if ((unint64_t)correctedSearch | *((_QWORD *)v4 + 8))
  {
    if (!-[GEORPCorrectedSearch isEqual:](correctedSearch, "isEqual:"))
      goto LABEL_32;
  }
  correctedMapLocation = self->_correctedMapLocation;
  if ((unint64_t)correctedMapLocation | *((_QWORD *)v4 + 7))
  {
    if (!-[GEORPMapLocation isEqual:](correctedMapLocation, "isEqual:"))
      goto LABEL_32;
  }
  comments = self->_comments;
  if ((unint64_t)comments | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](comments, "isEqual:"))
      goto LABEL_32;
  }
  placeProblem = self->_placeProblem;
  if ((unint64_t)placeProblem | *((_QWORD *)v4 + 12))
  {
    if (!-[GEORPPlaceProblem isEqual:](placeProblem, "isEqual:"))
      goto LABEL_32;
  }
  directionsProblem = self->_directionsProblem;
  if ((unint64_t)directionsProblem | *((_QWORD *)v4 + 9))
  {
    if (!-[GEORPDirectionsProblem isEqual:](directionsProblem, "isEqual:"))
      goto LABEL_32;
  }
  photoWithMetadatas = self->_photoWithMetadatas;
  if ((unint64_t)photoWithMetadatas | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](photoWithMetadatas, "isEqual:"))
      goto LABEL_32;
  }
  v14 = *((_WORD *)v4 + 60);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v14 & 1) != 0)
    {
      if (self->_delayed)
      {
        if (!*((_BYTE *)v4 + 116))
          goto LABEL_32;
        goto LABEL_28;
      }
      if (!*((_BYTE *)v4 + 116))
        goto LABEL_28;
    }
LABEL_32:
    v17 = 0;
    goto LABEL_33;
  }
  if ((v14 & 1) != 0)
    goto LABEL_32;
LABEL_28:
  correctedFlags = self->_correctedFlags;
  if ((unint64_t)correctedFlags | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](correctedFlags, "isEqual:"))
  {
    goto LABEL_32;
  }
  merchantLookupCorrections = self->_merchantLookupCorrections;
  if ((unint64_t)merchantLookupCorrections | *((_QWORD *)v4 + 10))
    v17 = -[GEORPMerchantLookupCorrections isEqual:](merchantLookupCorrections, "isEqual:");
  else
    v17 = 1;
LABEL_33:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[GEORPProblemCorrections readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_correctedFields, "hash");
  v4 = -[GEORPCorrectedLabel hash](self->_correctedLabel, "hash");
  v5 = -[GEORPCorrectedCoordinate hash](self->_correctedCoordinate, "hash");
  v6 = -[GEORPCorrectedSearch hash](self->_correctedSearch, "hash");
  v7 = -[GEORPMapLocation hash](self->_correctedMapLocation, "hash");
  v8 = -[NSString hash](self->_comments, "hash");
  v9 = -[GEORPPlaceProblem hash](self->_placeProblem, "hash");
  v10 = -[GEORPDirectionsProblem hash](self->_directionsProblem, "hash");
  v11 = -[NSMutableArray hash](self->_photoWithMetadatas, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v12 = 2654435761 * self->_delayed;
  else
    v12 = 0;
  v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSMutableArray hash](self->_correctedFlags, "hash");
  return v13 ^ -[GEORPMerchantLookupCorrections hash](self->_merchantLookupCorrections, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEORPCorrectedLabel *correctedLabel;
  uint64_t v11;
  GEORPCorrectedCoordinate *correctedCoordinate;
  uint64_t v13;
  GEORPCorrectedSearch *correctedSearch;
  uint64_t v15;
  GEORPMapLocation *correctedMapLocation;
  uint64_t v17;
  GEORPPlaceProblem *placeProblem;
  uint64_t v19;
  GEORPDirectionsProblem *directionsProblem;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  GEORPMerchantLookupCorrections *merchantLookupCorrections;
  uint64_t v33;
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
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(v5);
        -[GEORPProblemCorrections addCorrectedField:](self, "addCorrectedField:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v7);
  }

  correctedLabel = self->_correctedLabel;
  v11 = *((_QWORD *)v4 + 6);
  if (correctedLabel)
  {
    if (v11)
      -[GEORPCorrectedLabel mergeFrom:](correctedLabel, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPProblemCorrections setCorrectedLabel:](self, "setCorrectedLabel:");
  }
  correctedCoordinate = self->_correctedCoordinate;
  v13 = *((_QWORD *)v4 + 3);
  if (correctedCoordinate)
  {
    if (v13)
      -[GEORPCorrectedCoordinate mergeFrom:](correctedCoordinate, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPProblemCorrections setCorrectedCoordinate:](self, "setCorrectedCoordinate:");
  }
  correctedSearch = self->_correctedSearch;
  v15 = *((_QWORD *)v4 + 8);
  if (correctedSearch)
  {
    if (v15)
      -[GEORPCorrectedSearch mergeFrom:](correctedSearch, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEORPProblemCorrections setCorrectedSearch:](self, "setCorrectedSearch:");
  }
  correctedMapLocation = self->_correctedMapLocation;
  v17 = *((_QWORD *)v4 + 7);
  if (correctedMapLocation)
  {
    if (v17)
      -[GEORPMapLocation mergeFrom:](correctedMapLocation, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEORPProblemCorrections setCorrectedMapLocation:](self, "setCorrectedMapLocation:");
  }
  if (*((_QWORD *)v4 + 2))
    -[GEORPProblemCorrections setComments:](self, "setComments:");
  placeProblem = self->_placeProblem;
  v19 = *((_QWORD *)v4 + 12);
  if (placeProblem)
  {
    if (v19)
      -[GEORPPlaceProblem mergeFrom:](placeProblem, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEORPProblemCorrections setPlaceProblem:](self, "setPlaceProblem:");
  }
  directionsProblem = self->_directionsProblem;
  v21 = *((_QWORD *)v4 + 9);
  if (directionsProblem)
  {
    if (v21)
      -[GEORPDirectionsProblem mergeFrom:](directionsProblem, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEORPProblemCorrections setDirectionsProblem:](self, "setDirectionsProblem:");
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v22 = *((id *)v4 + 11);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(v22);
        -[GEORPProblemCorrections addPhotoWithMetadata:](self, "addPhotoWithMetadata:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v24);
  }

  if ((*((_WORD *)v4 + 60) & 1) != 0)
  {
    self->_delayed = *((_BYTE *)v4 + 116);
    *(_WORD *)&self->_flags |= 1u;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = *((id *)v4 + 5);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v27);
        -[GEORPProblemCorrections addCorrectedFlag:](self, "addCorrectedFlag:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k), (_QWORD)v34);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v29);
  }

  merchantLookupCorrections = self->_merchantLookupCorrections;
  v33 = *((_QWORD *)v4 + 10);
  if (merchantLookupCorrections)
  {
    if (v33)
      -[GEORPMerchantLookupCorrections mergeFrom:](merchantLookupCorrections, "mergeFrom:");
  }
  else if (v33)
  {
    -[GEORPProblemCorrections setMerchantLookupCorrections:](self, "setMerchantLookupCorrections:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeProblem, 0);
  objc_storeStrong((id *)&self->_photoWithMetadatas, 0);
  objc_storeStrong((id *)&self->_merchantLookupCorrections, 0);
  objc_storeStrong((id *)&self->_directionsProblem, 0);
  objc_storeStrong((id *)&self->_correctedSearch, 0);
  objc_storeStrong((id *)&self->_correctedMapLocation, 0);
  objc_storeStrong((id *)&self->_correctedLabel, 0);
  objc_storeStrong((id *)&self->_correctedFlags, 0);
  objc_storeStrong((id *)&self->_correctedFields, 0);
  objc_storeStrong((id *)&self->_correctedCoordinate, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
