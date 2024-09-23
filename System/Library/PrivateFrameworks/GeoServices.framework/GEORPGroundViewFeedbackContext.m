@implementation GEORPGroundViewFeedbackContext

- (GEORPGroundViewFeedbackContext)init
{
  GEORPGroundViewFeedbackContext *v2;
  GEORPGroundViewFeedbackContext *v3;
  GEORPGroundViewFeedbackContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPGroundViewFeedbackContext;
  v2 = -[GEORPGroundViewFeedbackContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPGroundViewFeedbackContext)initWithData:(id)a3
{
  GEORPGroundViewFeedbackContext *v3;
  GEORPGroundViewFeedbackContext *v4;
  GEORPGroundViewFeedbackContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPGroundViewFeedbackContext;
  v3 = -[GEORPGroundViewFeedbackContext initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPGroundViewFeedbackContext;
  -[GEORPGroundViewFeedbackContext dealloc](&v3, sel_dealloc);
}

- (void)_readViewState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPGroundViewFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasViewState
{
  -[GEORPGroundViewFeedbackContext _readViewState]((uint64_t)self);
  return self->_viewState != 0;
}

- (GEOPDMuninViewState)viewState
{
  -[GEORPGroundViewFeedbackContext _readViewState]((uint64_t)self);
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_viewState, a3);
}

- (unsigned)metadataTileBuildId
{
  return self->_metadataTileBuildId;
}

- (void)setMetadataTileBuildId:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_metadataTileBuildId = a3;
}

- (void)setHasMetadataTileBuildId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasMetadataTileBuildId
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readOnscreenImageResources
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPGroundViewFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOnscreenImageResources_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)onscreenImageResources
{
  -[GEORPGroundViewFeedbackContext _readOnscreenImageResources]((uint64_t)self);
  return self->_onscreenImageResources;
}

- (void)setOnscreenImageResources:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *onscreenImageResources;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  onscreenImageResources = self->_onscreenImageResources;
  self->_onscreenImageResources = v4;

}

- (void)clearOnscreenImageResources
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_onscreenImageResources, "removeAllObjects");
}

- (void)addOnscreenImageResource:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPGroundViewFeedbackContext _readOnscreenImageResources]((uint64_t)self);
  -[GEORPGroundViewFeedbackContext _addNoFlagsOnscreenImageResource:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsOnscreenImageResource:(uint64_t)a1
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

- (unint64_t)onscreenImageResourcesCount
{
  -[GEORPGroundViewFeedbackContext _readOnscreenImageResources]((uint64_t)self);
  return -[NSMutableArray count](self->_onscreenImageResources, "count");
}

- (id)onscreenImageResourceAtIndex:(unint64_t)a3
{
  -[GEORPGroundViewFeedbackContext _readOnscreenImageResources]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_onscreenImageResources, "objectAtIndex:", a3);
}

+ (Class)onscreenImageResourceType
{
  return (Class)objc_opt_class();
}

- (void)_readVisiblePlaceMuids
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPGroundViewFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVisiblePlaceMuids_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (unint64_t)visiblePlaceMuidsCount
{
  -[GEORPGroundViewFeedbackContext _readVisiblePlaceMuids]((uint64_t)self);
  return self->_visiblePlaceMuids.count;
}

- (unint64_t)visiblePlaceMuids
{
  -[GEORPGroundViewFeedbackContext _readVisiblePlaceMuids]((uint64_t)self);
  return self->_visiblePlaceMuids.list;
}

- (void)clearVisiblePlaceMuids
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  PBRepeatedUInt64Clear();
}

- (void)addVisiblePlaceMuid:(unint64_t)a3
{
  -[GEORPGroundViewFeedbackContext _readVisiblePlaceMuids]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (unint64_t)visiblePlaceMuidAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_visiblePlaceMuids;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPGroundViewFeedbackContext _readVisiblePlaceMuids]((uint64_t)self);
  p_visiblePlaceMuids = &self->_visiblePlaceMuids;
  count = self->_visiblePlaceMuids.count;
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
  return p_visiblePlaceMuids->list[a3];
}

- (void)setVisiblePlaceMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  PBRepeatedUInt64Set();
}

- (unint64_t)imdataId
{
  return self->_imdataId;
}

- (void)setImdataId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_imdataId = a3;
}

- (void)setHasImdataId:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasImdataId
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readImageId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPGroundViewFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImageId_tags_2189);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasImageId
{
  -[GEORPGroundViewFeedbackContext _readImageId]((uint64_t)self);
  return self->_imageId != 0;
}

- (NSString)imageId
{
  -[GEORPGroundViewFeedbackContext _readImageId]((uint64_t)self);
  return self->_imageId;
}

- (void)setImageId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_imageId, a3);
}

- (void)_readVisibleFeatureHandles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPGroundViewFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVisibleFeatureHandles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)visibleFeatureHandles
{
  -[GEORPGroundViewFeedbackContext _readVisibleFeatureHandles]((uint64_t)self);
  return self->_visibleFeatureHandles;
}

- (void)setVisibleFeatureHandles:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *visibleFeatureHandles;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  visibleFeatureHandles = self->_visibleFeatureHandles;
  self->_visibleFeatureHandles = v4;

}

- (void)clearVisibleFeatureHandles
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_visibleFeatureHandles, "removeAllObjects");
}

- (void)addVisibleFeatureHandle:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPGroundViewFeedbackContext _readVisibleFeatureHandles]((uint64_t)self);
  -[GEORPGroundViewFeedbackContext _addNoFlagsVisibleFeatureHandle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsVisibleFeatureHandle:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)visibleFeatureHandlesCount
{
  -[GEORPGroundViewFeedbackContext _readVisibleFeatureHandles]((uint64_t)self);
  return -[NSMutableArray count](self->_visibleFeatureHandles, "count");
}

- (id)visibleFeatureHandleAtIndex:(unint64_t)a3
{
  -[GEORPGroundViewFeedbackContext _readVisibleFeatureHandles]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_visibleFeatureHandles, "objectAtIndex:", a3);
}

+ (Class)visibleFeatureHandleType
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
  v8.super_class = (Class)GEORPGroundViewFeedbackContext;
  -[GEORPGroundViewFeedbackContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPGroundViewFeedbackContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPGroundViewFeedbackContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
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
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
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
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v42[4];
  id v43;
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
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "viewState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("viewState");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("view_state");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if ((*(_WORD *)(a1 + 104) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 100));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("metadataTileBuildId");
    else
      v10 = CFSTR("metadata_tile_build_id");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v12 = *(id *)(a1 + 64);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v49 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("onscreenImageResource");
    else
      v19 = CFSTR("onscreen_image_resource");
    objc_msgSend(v4, "setObject:forKey:", v11, v19);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt64NSArray();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("visiblePlaceMuid");
    else
      v21 = CFSTR("visible_place_muid");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  if ((*(_WORD *)(a1 + 104) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("imdataId");
    else
      v23 = CFSTR("imdata_id");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  objc_msgSend((id)a1, "imageId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if (a2)
      v25 = CFSTR("imageId");
    else
      v25 = CFSTR("image_id");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);
  }

  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v27 = *(id *)(a1 + 80);
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v45 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v32, "jsonRepresentation");
          else
            objc_msgSend(v32, "dictionaryRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v33);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v29);
    }

    if (a2)
      v34 = CFSTR("visibleFeatureHandle");
    else
      v34 = CFSTR("visible_feature_handle");
    objc_msgSend(v4, "setObject:forKey:", v26, v34);

  }
  v35 = *(void **)(a1 + 16);
  if (v35)
  {
    objc_msgSend(v35, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __60__GEORPGroundViewFeedbackContext__dictionaryRepresentation___block_invoke;
      v42[3] = &unk_1E1C00600;
      v39 = v38;
      v43 = v39;
      objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v42);
      v40 = v39;

      v37 = v40;
    }
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPGroundViewFeedbackContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEORPGroundViewFeedbackContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPGroundViewFeedbackContext)initWithDictionary:(id)a3
{
  return (GEORPGroundViewFeedbackContext *)-[GEORPGroundViewFeedbackContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPDMuninViewState *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  GEORPGroundViewImageResource *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  GEORPFeatureHandle *v45;
  uint64_t v46;
  void *v47;
  void *v49;
  id v50;
  __int128 v51;
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
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("viewState");
      else
        v6 = CFSTR("view_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOPDMuninViewState alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOPDMuninViewState initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOPDMuninViewState initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setViewState:", v9);

      }
      if (a3)
        v11 = CFSTR("metadataTileBuildId");
      else
        v11 = CFSTR("metadata_tile_build_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMetadataTileBuildId:", objc_msgSend(v12, "unsignedIntValue"));

      if (a3)
        v13 = CFSTR("onscreenImageResource");
      else
        v13 = CFSTR("onscreen_image_resource");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v50 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v49 = v14;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v60 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = [GEORPGroundViewImageResource alloc];
                if ((a3 & 1) != 0)
                  v22 = -[GEORPGroundViewImageResource initWithJSON:](v21, "initWithJSON:", v20);
                else
                  v22 = -[GEORPGroundViewImageResource initWithDictionary:](v21, "initWithDictionary:", v20);
                v23 = (void *)v22;
                objc_msgSend(a1, "addOnscreenImageResource:", v22, v49);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
          }
          while (v17);
        }

        v14 = v49;
      }

      if (a3)
        v24 = CFSTR("visiblePlaceMuid");
      else
        v24 = CFSTR("visible_place_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24, v49);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v56 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addVisiblePlaceMuid:", objc_msgSend(v31, "unsignedLongLongValue"));
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
          }
          while (v28);
        }

        v5 = v50;
      }

      if (a3)
        v32 = CFSTR("imdataId");
      else
        v32 = CFSTR("imdata_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setImdataId:", objc_msgSend(v33, "unsignedLongLongValue"));

      if (a3)
        v34 = CFSTR("imageId");
      else
        v34 = CFSTR("image_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = (void *)objc_msgSend(v35, "copy");
        objc_msgSend(a1, "setImageId:", v36);

      }
      if (a3)
        v37 = CFSTR("visibleFeatureHandle");
      else
        v37 = CFSTR("visible_feature_handle");
      objc_msgSend(v5, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v39 = v38;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v52;
          do
          {
            for (k = 0; k != v41; ++k)
            {
              if (*(_QWORD *)v52 != v42)
                objc_enumerationMutation(v39);
              v44 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v45 = [GEORPFeatureHandle alloc];
                if ((a3 & 1) != 0)
                  v46 = -[GEORPFeatureHandle initWithJSON:](v45, "initWithJSON:", v44);
                else
                  v46 = -[GEORPFeatureHandle initWithDictionary:](v45, "initWithDictionary:", v44);
                v47 = (void *)v46;
                objc_msgSend(a1, "addVisibleFeatureHandle:", v46);

              }
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
          }
          while (v41);
        }

        v5 = v50;
      }

    }
  }

  return a1;
}

- (GEORPGroundViewFeedbackContext)initWithJSON:(id)a3
{
  return (GEORPGroundViewFeedbackContext *)-[GEORPGroundViewFeedbackContext _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2216;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2217;
    GEORPGroundViewFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPGroundViewFeedbackContextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPGroundViewFeedbackContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPGroundViewFeedbackContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  PBDataReader *v15;
  void *v16;
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
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPGroundViewFeedbackContextIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPGroundViewFeedbackContext readAll:](self, "readAll:", 0);
    if (self->_viewState)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_onscreenImageResources;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    if (self->_visiblePlaceMuids.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v10;
      }
      while (v10 < self->_visiblePlaceMuids.count);
    }
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_imageId)
      PBDataWriterWriteStringField();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_visibleFeatureHandles;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }

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
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  void *v14;
  id *v15;

  v15 = (id *)a3;
  -[GEORPGroundViewFeedbackContext readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 22) = self->_readerMarkPos;
  *((_DWORD *)v15 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_viewState)
    objc_msgSend(v15, "setViewState:");
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v15 + 25) = self->_metadataTileBuildId;
    *((_WORD *)v15 + 52) |= 2u;
  }
  if (-[GEORPGroundViewFeedbackContext onscreenImageResourcesCount](self, "onscreenImageResourcesCount"))
  {
    objc_msgSend(v15, "clearOnscreenImageResources");
    v4 = -[GEORPGroundViewFeedbackContext onscreenImageResourcesCount](self, "onscreenImageResourcesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPGroundViewFeedbackContext onscreenImageResourceAtIndex:](self, "onscreenImageResourceAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addOnscreenImageResource:", v7);

      }
    }
  }
  if (-[GEORPGroundViewFeedbackContext visiblePlaceMuidsCount](self, "visiblePlaceMuidsCount"))
  {
    objc_msgSend(v15, "clearVisiblePlaceMuids");
    v8 = -[GEORPGroundViewFeedbackContext visiblePlaceMuidsCount](self, "visiblePlaceMuidsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v15, "addVisiblePlaceMuid:", -[GEORPGroundViewFeedbackContext visiblePlaceMuidAtIndex:](self, "visiblePlaceMuidAtIndex:", j));
    }
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v15[7] = (id)self->_imdataId;
    *((_WORD *)v15 + 52) |= 1u;
  }
  if (self->_imageId)
    objc_msgSend(v15, "setImageId:");
  if (-[GEORPGroundViewFeedbackContext visibleFeatureHandlesCount](self, "visibleFeatureHandlesCount"))
  {
    objc_msgSend(v15, "clearVisibleFeatureHandles");
    v11 = -[GEORPGroundViewFeedbackContext visibleFeatureHandlesCount](self, "visibleFeatureHandlesCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
      {
        -[GEORPGroundViewFeedbackContext visibleFeatureHandleAtIndex:](self, "visibleFeatureHandleAtIndex:", k);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addVisibleFeatureHandle:", v14);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  PBUnknownFields *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPGroundViewFeedbackContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPGroundViewFeedbackContext readAll:](self, "readAll:", 0);
  v9 = -[GEOPDMuninViewState copyWithZone:](self->_viewState, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_metadataTileBuildId;
    *(_WORD *)(v5 + 104) |= 2u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = self->_onscreenImageResources;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addOnscreenImageResource:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v12);
  }

  PBRepeatedUInt64Copy();
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_imdataId;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  v16 = -[NSString copyWithZone:](self->_imageId, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_visibleFeatureHandles;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v5, "addVisibleFeatureHandle:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }

  v23 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v23;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDMuninViewState *viewState;
  __int16 v6;
  NSMutableArray *onscreenImageResources;
  __int16 v8;
  NSString *imageId;
  NSMutableArray *visibleFeatureHandles;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEORPGroundViewFeedbackContext readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  viewState = self->_viewState;
  if ((unint64_t)viewState | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDMuninViewState isEqual:](viewState, "isEqual:"))
      goto LABEL_21;
  }
  v6 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_metadataTileBuildId != *((_DWORD *)v4 + 25))
      goto LABEL_21;
  }
  else if ((v6 & 2) != 0)
  {
LABEL_21:
    v11 = 0;
    goto LABEL_22;
  }
  onscreenImageResources = self->_onscreenImageResources;
  if ((unint64_t)onscreenImageResources | *((_QWORD *)v4 + 8)
    && !-[NSMutableArray isEqual:](onscreenImageResources, "isEqual:")
    || !PBRepeatedUInt64IsEqual())
  {
    goto LABEL_21;
  }
  v8 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_imdataId != *((_QWORD *)v4 + 7))
      goto LABEL_21;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_21;
  }
  imageId = self->_imageId;
  if ((unint64_t)imageId | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](imageId, "isEqual:"))
    goto LABEL_21;
  visibleFeatureHandles = self->_visibleFeatureHandles;
  if ((unint64_t)visibleFeatureHandles | *((_QWORD *)v4 + 10))
    v11 = -[NSMutableArray isEqual:](visibleFeatureHandles, "isEqual:");
  else
    v11 = 1;
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;

  -[GEORPGroundViewFeedbackContext readAll:](self, "readAll:", 1);
  v3 = -[GEOPDMuninViewState hash](self->_viewState, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v4 = 2654435761 * self->_metadataTileBuildId;
  else
    v4 = 0;
  v5 = -[NSMutableArray hash](self->_onscreenImageResources, "hash");
  v6 = PBRepeatedUInt64Hash();
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v7 = 2654435761u * self->_imdataId;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSString hash](self->_imageId, "hash");
  return v8 ^ v9 ^ -[NSMutableArray hash](self->_visibleFeatureHandles, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOPDMuninViewState *viewState;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  viewState = self->_viewState;
  v6 = *((_QWORD *)v4 + 9);
  if (viewState)
  {
    if (v6)
      -[GEOPDMuninViewState mergeFrom:](viewState, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPGroundViewFeedbackContext setViewState:](self, "setViewState:");
  }
  if ((*((_WORD *)v4 + 52) & 2) != 0)
  {
    self->_metadataTileBuildId = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 2u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = *((id *)v4 + 8);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        -[GEORPGroundViewFeedbackContext addOnscreenImageResource:](self, "addOnscreenImageResource:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v12 = objc_msgSend(v4, "visiblePlaceMuidsCount");
  if (v12)
  {
    v13 = v12;
    for (j = 0; j != v13; ++j)
      -[GEORPGroundViewFeedbackContext addVisiblePlaceMuid:](self, "addVisiblePlaceMuid:", objc_msgSend(v4, "visiblePlaceMuidAtIndex:", j));
  }
  if ((*((_WORD *)v4 + 52) & 1) != 0)
  {
    self->_imdataId = *((_QWORD *)v4 + 7);
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
    -[GEORPGroundViewFeedbackContext setImageId:](self, "setImageId:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = *((id *)v4 + 10);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[GEORPGroundViewFeedbackContext addVisibleFeatureHandle:](self, "addVisibleFeatureHandle:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPGroundViewFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2220);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x104u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPGroundViewFeedbackContext readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_onscreenImageResources;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleFeatureHandles, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_onscreenImageResources, 0);
  objc_storeStrong((id *)&self->_imageId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
