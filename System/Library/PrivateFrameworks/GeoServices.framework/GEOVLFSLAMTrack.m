@implementation GEOVLFSLAMTrack

- (GEOVLFSLAMTrack)init
{
  GEOVLFSLAMTrack *v2;
  GEOVLFSLAMTrack *v3;
  GEOVLFSLAMTrack *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVLFSLAMTrack;
  v2 = -[GEOVLFSLAMTrack init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFSLAMTrack)initWithData:(id)a3
{
  GEOVLFSLAMTrack *v3;
  GEOVLFSLAMTrack *v4;
  GEOVLFSLAMTrack *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVLFSLAMTrack;
  v3 = -[GEOVLFSLAMTrack initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOVLFSLAMTrack;
  -[GEOVLFSLAMTrack dealloc](&v3, sel_dealloc);
}

- (void)_readPosition
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFSLAMTrackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPosition_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasPosition
{
  -[GEOVLFSLAMTrack _readPosition]((uint64_t)self);
  return self->_position != 0;
}

- (GEOVLFPoint3D)position
{
  -[GEOVLFSLAMTrack _readPosition]((uint64_t)self);
  return self->_position;
}

- (void)setPosition:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (void)_readDescriptors
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFSLAMTrackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDescriptors_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)descriptorsCount
{
  -[GEOVLFSLAMTrack _readDescriptors]((uint64_t)self);
  return self->_descriptors.count;
}

- (unsigned)descriptors
{
  -[GEOVLFSLAMTrack _readDescriptors]((uint64_t)self);
  return self->_descriptors.list;
}

- (void)clearDescriptors
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt32Clear();
}

- (void)addDescriptors:(unsigned int)a3
{
  -[GEOVLFSLAMTrack _readDescriptors]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (unsigned)descriptorsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_descriptors;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFSLAMTrack _readDescriptors]((uint64_t)self);
  p_descriptors = &self->_descriptors;
  count = self->_descriptors.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_descriptors->list[a3];
}

- (void)setDescriptors:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt32Set();
}

- (void)_readObservationImageIndices
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFSLAMTrackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readObservationImageIndices_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)observationImageIndicesCount
{
  -[GEOVLFSLAMTrack _readObservationImageIndices]((uint64_t)self);
  return self->_observationImageIndices.count;
}

- (unsigned)observationImageIndices
{
  -[GEOVLFSLAMTrack _readObservationImageIndices]((uint64_t)self);
  return self->_observationImageIndices.list;
}

- (void)clearObservationImageIndices
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt32Clear();
}

- (void)addObservationImageIndices:(unsigned int)a3
{
  -[GEOVLFSLAMTrack _readObservationImageIndices]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (unsigned)observationImageIndicesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_observationImageIndices;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFSLAMTrack _readObservationImageIndices]((uint64_t)self);
  p_observationImageIndices = &self->_observationImageIndices;
  count = self->_observationImageIndices.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_observationImageIndices->list[a3];
}

- (void)setObservationImageIndices:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt32Set();
}

- (void)_readImagePositions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFSLAMTrackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImagePositions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)imagePositions
{
  -[GEOVLFSLAMTrack _readImagePositions]((uint64_t)self);
  return self->_imagePositions;
}

- (void)setImagePositions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *imagePositions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  imagePositions = self->_imagePositions;
  self->_imagePositions = v4;

}

- (void)clearImagePositions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_imagePositions, "removeAllObjects");
}

- (void)addImagePositions:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOVLFSLAMTrack _readImagePositions]((uint64_t)self);
  -[GEOVLFSLAMTrack _addNoFlagsImagePositions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsImagePositions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)imagePositionsCount
{
  -[GEOVLFSLAMTrack _readImagePositions]((uint64_t)self);
  return -[NSMutableArray count](self->_imagePositions, "count");
}

- (id)imagePositionsAtIndex:(unint64_t)a3
{
  -[GEOVLFSLAMTrack _readImagePositions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_imagePositions, "objectAtIndex:", a3);
}

+ (Class)imagePositionsType
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
  v8.super_class = (Class)GEOVLFSLAMTrack;
  -[GEOVLFSLAMTrack description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFSLAMTrack dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFSLAMTrack _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const __CFString *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "position");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("position"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt32NSArray();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("descriptors"));

  }
  if (*(_QWORD *)(a1 + 48))
  {
    PBRepeatedUInt32NSArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("observationImageIndices");
    else
      v10 = CFSTR("observation_image_indices");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = *(id *)(a1 + 64);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation", (_QWORD)v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18, (_QWORD)v21);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("imagePositions");
    else
      v19 = CFSTR("image_positions");
    objc_msgSend(v4, "setObject:forKey:", v11, v19, (_QWORD)v21);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFSLAMTrack _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFSLAMTrack)initWithDictionary:(id)a3
{
  return (GEOVLFSLAMTrack *)-[GEOVLFSLAMTrack _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOVLFPoint3D *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  GEOVLFImagePosition *v33;
  uint64_t v34;
  void *v35;
  id v37;
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
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("position"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOVLFPoint3D alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOVLFPoint3D initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOVLFPoint3D initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setPosition:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("descriptors"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v37 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v47 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addDescriptors:", objc_msgSend(v16, "unsignedIntValue"));
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
          }
          while (v13);
        }

        v5 = v37;
      }

      if (a3)
        v17 = CFSTR("observationImageIndices");
      else
        v17 = CFSTR("observation_image_indices");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v43 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addObservationImageIndices:", objc_msgSend(v24, "unsignedIntValue"));
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          }
          while (v21);
        }

        v5 = v37;
      }

      if (a3)
        v25 = CFSTR("imagePositions");
      else
        v25 = CFSTR("image_positions");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v39;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v39 != v30)
                objc_enumerationMutation(v27);
              v32 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = [GEOVLFImagePosition alloc];
                if ((a3 & 1) != 0)
                  v34 = -[GEOVLFImagePosition initWithJSON:](v33, "initWithJSON:", v32);
                else
                  v34 = -[GEOVLFImagePosition initWithDictionary:](v33, "initWithDictionary:", v32);
                v35 = (void *)v34;
                objc_msgSend(a1, "addImagePositions:", v34);

              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          }
          while (v29);
        }

        v5 = v37;
      }

    }
  }

  return a1;
}

- (GEOVLFSLAMTrack)initWithJSON:(id)a3
{
  return (GEOVLFSLAMTrack *)-[GEOVLFSLAMTrack _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_10107;
    else
      v8 = (int *)&readAll__nonRecursiveTag_10108;
    GEOVLFSLAMTrackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOVLFSLAMTrackCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFSLAMTrackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFSLAMTrackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  unint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1F) == 0))
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v13);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOVLFSLAMTrack readAll:](self, "readAll:", 0);
    if (self->_position)
      PBDataWriterWriteSubmessage();
    if (self->_descriptors.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_descriptors.count);
    }
    if (self->_observationImageIndices.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_observationImageIndices.count);
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = self->_imagePositions;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          PBDataWriterWriteSubmessage();
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  unint64_t v10;
  unint64_t v11;
  uint64_t k;
  void *v13;
  id *v14;

  v14 = (id *)a3;
  -[GEOVLFSLAMTrack readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v14 + 1, self->_reader);
  *((_DWORD *)v14 + 20) = self->_readerMarkPos;
  *((_DWORD *)v14 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_position)
    objc_msgSend(v14, "setPosition:");
  if (-[GEOVLFSLAMTrack descriptorsCount](self, "descriptorsCount"))
  {
    objc_msgSend(v14, "clearDescriptors");
    v4 = -[GEOVLFSLAMTrack descriptorsCount](self, "descriptorsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v14, "addDescriptors:", -[GEOVLFSLAMTrack descriptorsAtIndex:](self, "descriptorsAtIndex:", i));
    }
  }
  if (-[GEOVLFSLAMTrack observationImageIndicesCount](self, "observationImageIndicesCount"))
  {
    objc_msgSend(v14, "clearObservationImageIndices");
    v7 = -[GEOVLFSLAMTrack observationImageIndicesCount](self, "observationImageIndicesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v14, "addObservationImageIndices:", -[GEOVLFSLAMTrack observationImageIndicesAtIndex:](self, "observationImageIndicesAtIndex:", j));
    }
  }
  if (-[GEOVLFSLAMTrack imagePositionsCount](self, "imagePositionsCount"))
  {
    objc_msgSend(v14, "clearImagePositions");
    v10 = -[GEOVLFSLAMTrack imagePositionsCount](self, "imagePositionsCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
      {
        -[GEOVLFSLAMTrack imagePositionsAtIndex:](self, "imagePositionsAtIndex:", k);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addImagePositions:", v13);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOVLFSLAMTrackReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOVLFSLAMTrack readAll:](self, "readAll:", 0);
  v8 = -[GEOVLFPoint3D copyWithZone:](self->_position, "copyWithZone:", a3);
  v9 = (void *)v5[9];
  v5[9] = v8;

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_imagePositions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend(v5, "addImagePositions:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOVLFPoint3D *position;
  NSMutableArray *imagePositions;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOVLFSLAMTrack readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         position = self->_position,
         !((unint64_t)position | v4[9]))
     || -[GEOVLFPoint3D isEqual:](position, "isEqual:"))
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
  {
    imagePositions = self->_imagePositions;
    if ((unint64_t)imagePositions | v4[8])
      v7 = -[NSMutableArray isEqual:](imagePositions, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOVLFSLAMTrack readAll:](self, "readAll:", 1);
  v3 = -[GEOVLFPoint3D hash](self->_position, "hash");
  v4 = PBRepeatedUInt32Hash();
  v5 = v4 ^ PBRepeatedUInt32Hash() ^ v3;
  return v5 ^ -[NSMutableArray hash](self->_imagePositions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  GEOVLFPoint3D *position;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  position = self->_position;
  v6 = v4[9];
  if (position)
  {
    if (v6)
      -[GEOVLFPoint3D mergeFrom:](position, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOVLFSLAMTrack setPosition:](self, "setPosition:");
  }
  v7 = objc_msgSend(v4, "descriptorsCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[GEOVLFSLAMTrack addDescriptors:](self, "addDescriptors:", objc_msgSend(v4, "descriptorsAtIndex:", i));
  }
  v10 = objc_msgSend(v4, "observationImageIndicesCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[GEOVLFSLAMTrack addObservationImageIndices:](self, "addObservationImageIndices:", objc_msgSend(v4, "observationImageIndicesAtIndex:", j));
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v4[8];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[GEOVLFSLAMTrack addImagePositions:](self, "addImagePositions:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * k), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_imagePositions, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
