@implementation GEOPDPhotoPosition

- (GEOPDOrientedTilePosition)tilePosition
{
  -[GEOPDPhotoPosition _readTilePosition]((uint64_t)self);
  return self->_tilePosition;
}

- (GEOPDRigMetrics)rigMetrics
{
  -[GEOPDPhotoPosition _readRigMetrics]((uint64_t)self);
  return self->_rigMetrics;
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
      v8 = (int *)&readAll__recursiveTag_435;
    else
      v8 = (int *)&readAll__nonRecursiveTag_436;
    GEOPDPhotoPositionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDPhotoPositionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (GEOPDOrientedPosition)position
{
  -[GEOPDPhotoPosition _readPosition]((uint64_t)self);
  return self->_position;
}

- (GEOPDGeographicCoordinate)positionGeo
{
  -[GEOPDPhotoPosition _readPositionGeo]((uint64_t)self);
  return self->_positionGeo;
}

- (GEOTileCoordinate)parentTile
{
  -[GEOPDPhotoPosition _readParentTile]((uint64_t)self);
  return self->_parentTile;
}

- (GEOPDPhotoPosition)init
{
  GEOPDPhotoPosition *v2;
  GEOPDPhotoPosition *v3;
  GEOPDPhotoPosition *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPhotoPosition;
  v2 = -[GEOPDPhotoPosition init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPhotoPosition _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (GEOPDGroundDataBuild)build
{
  -[GEOPDPhotoPosition _readBuild]((uint64_t)self);
  return self->_build;
}

- (void)_readTilePosition
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTilePosition_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (void)_readRigMetrics
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRigMetrics_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (void)_readPosition
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPosition_tags_389);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (void)_readPositionGeo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPositionGeo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (void)_readParentTile
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readParentTile_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (void)_readBuild
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBuild_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  __int16 v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 132) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("imdataId");
    else
      v6 = CFSTR("imdata_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v8 = *(id *)(a1 + 48);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v48 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation", (_QWORD)v47);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14, (_QWORD)v47);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("cameraMetadata");
    else
      v15 = CFSTR("camera_metadata");
    objc_msgSend(v4, "setObject:forKey:", v7, v15, (_QWORD)v47);

  }
  objc_msgSend((id)a1, "position");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v16, "jsonRepresentation");
    else
      objc_msgSend(v16, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("position"));

  }
  v19 = *(_WORD *)(a1 + 132);
  if ((v19 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 128));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("revision"));

    v19 = *(_WORD *)(a1 + 132);
  }
  if ((v19 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("imageryTimestamp");
    else
      v22 = CFSTR("imagery_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  objc_msgSend((id)a1, "positionGeo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("positionGeo");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("position_geo");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  if ((*(_WORD *)(a1 + 132) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 124));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("buildTableIndex");
    else
      v28 = CFSTR("build_table_index");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  objc_msgSend((id)a1, "build");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v29, "jsonRepresentation");
    else
      objc_msgSend(v29, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("build"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt32NSArray();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v33 = CFSTR("cameraMetadataIndex");
    else
      v33 = CFSTR("camera_metadata_index");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  objc_msgSend((id)a1, "tilePosition");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v34, "jsonRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("tilePosition");
    }
    else
    {
      objc_msgSend(v34, "dictionaryRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("tile_position");
    }
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  objc_msgSend((id)a1, "parentTile");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v38, "jsonRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("parentTile");
    }
    else
    {
      objc_msgSend(v38, "dictionaryRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("parent_tile");
    }
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

  }
  objc_msgSend((id)a1, "rigMetrics");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v42, "jsonRepresentation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = CFSTR("rigMetrics");
    }
    else
    {
      objc_msgSend(v42, "dictionaryRepresentation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = CFSTR("rig_metrics");
    }
    objc_msgSend(v4, "setObject:forKey:", v44, v45);

  }
  return v4;
}

- (GEOPDPhotoPosition)initWithData:(id)a3
{
  GEOPDPhotoPosition *v3;
  GEOPDPhotoPosition *v4;
  GEOPDPhotoPosition *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPhotoPosition;
  v3 = -[GEOPDPhotoPosition initWithData:](&v7, sel_initWithData_, a3);
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPDPhotoPosition;
  -[GEOPDPhotoPosition dealloc](&v3, sel_dealloc);
}

- (unint64_t)imdataId
{
  return self->_imdataId;
}

- (void)setImdataId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_imdataId = a3;
}

- (void)setHasImdataId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4098;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasImdataId
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readCameraMetadatas
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCameraMetadatas_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)cameraMetadatas
{
  -[GEOPDPhotoPosition _readCameraMetadatas]((uint64_t)self);
  return self->_cameraMetadatas;
}

- (void)setCameraMetadatas:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *cameraMetadatas;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  cameraMetadatas = self->_cameraMetadatas;
  self->_cameraMetadatas = v4;

}

- (void)clearCameraMetadatas
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  -[NSMutableArray removeAllObjects](self->_cameraMetadatas, "removeAllObjects");
}

- (void)addCameraMetadata:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPhotoPosition _readCameraMetadatas]((uint64_t)self);
  -[GEOPDPhotoPosition _addNoFlagsCameraMetadata:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsCameraMetadata:(uint64_t)a1
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

- (unint64_t)cameraMetadatasCount
{
  -[GEOPDPhotoPosition _readCameraMetadatas]((uint64_t)self);
  return -[NSMutableArray count](self->_cameraMetadatas, "count");
}

- (id)cameraMetadataAtIndex:(unint64_t)a3
{
  -[GEOPDPhotoPosition _readCameraMetadatas]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_cameraMetadatas, "objectAtIndex:", a3);
}

+ (Class)cameraMetadataType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPosition
{
  -[GEOPDPhotoPosition _readPosition]((uint64_t)self);
  return self->_position != 0;
}

- (void)setPosition:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (int)revision
{
  return self->_revision;
}

- (void)setRevision:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_revision = a3;
}

- (void)setHasRevision:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4104;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasRevision
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)imageryTimestamp
{
  return self->_imageryTimestamp;
}

- (void)setImageryTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_imageryTimestamp = a3;
}

- (void)setHasImageryTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasImageryTimestamp
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)hasPositionGeo
{
  -[GEOPDPhotoPosition _readPositionGeo]((uint64_t)self);
  return self->_positionGeo != 0;
}

- (void)setPositionGeo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_positionGeo, a3);
}

- (unsigned)buildTableIndex
{
  return self->_buildTableIndex;
}

- (void)setBuildTableIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_buildTableIndex = a3;
}

- (void)setHasBuildTableIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4100;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasBuildTableIndex
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)hasBuild
{
  -[GEOPDPhotoPosition _readBuild]((uint64_t)self);
  return self->_build != 0;
}

- (void)setBuild:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  objc_storeStrong((id *)&self->_build, a3);
}

- (void)_readCameraMetadataIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCameraMetadataIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)cameraMetadataIndexsCount
{
  -[GEOPDPhotoPosition _readCameraMetadataIndexs]((uint64_t)self);
  return self->_cameraMetadataIndexs.count;
}

- (unsigned)cameraMetadataIndexs
{
  -[GEOPDPhotoPosition _readCameraMetadataIndexs]((uint64_t)self);
  return self->_cameraMetadataIndexs.list;
}

- (void)clearCameraMetadataIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedUInt32Clear();
}

- (void)addCameraMetadataIndex:(unsigned int)a3
{
  -[GEOPDPhotoPosition _readCameraMetadataIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (unsigned)cameraMetadataIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_cameraMetadataIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDPhotoPosition _readCameraMetadataIndexs]((uint64_t)self);
  p_cameraMetadataIndexs = &self->_cameraMetadataIndexs;
  count = self->_cameraMetadataIndexs.count;
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
  return p_cameraMetadataIndexs->list[a3];
}

- (void)setCameraMetadataIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedUInt32Set();
}

- (BOOL)hasTilePosition
{
  -[GEOPDPhotoPosition _readTilePosition]((uint64_t)self);
  return self->_tilePosition != 0;
}

- (void)setTilePosition:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_tilePosition, a3);
}

- (BOOL)hasParentTile
{
  -[GEOPDPhotoPosition _readParentTile]((uint64_t)self);
  return self->_parentTile != 0;
}

- (void)setParentTile:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_parentTile, a3);
}

- (BOOL)hasRigMetrics
{
  -[GEOPDPhotoPosition _readRigMetrics]((uint64_t)self);
  return self->_rigMetrics != 0;
}

- (void)setRigMetrics:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_rigMetrics, a3);
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
  v8.super_class = (Class)GEOPDPhotoPosition;
  -[GEOPDPhotoPosition description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPhotoPosition dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDPhotoPosition _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPhotoPosition)initWithDictionary:(id)a3
{
  return (GEOPDPhotoPosition *)-[GEOPDPhotoPosition _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  GEOPDCameraMetadata *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  GEOPDOrientedPosition *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  GEOPDGeographicCoordinate *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  GEOPDGroundDataBuild *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  const __CFString *v44;
  void *v45;
  GEOPDOrientedTilePosition *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  GEOTileCoordinate *v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  GEOPDRigMetrics *v56;
  id v57;
  const __CFString *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  void *v67;
  id v68;
  id v69;
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
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("imdataId");
      else
        v6 = CFSTR("imdata_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setImdataId:", objc_msgSend(v7, "unsignedLongLongValue"));

      if (a3)
        v8 = CFSTR("cameraMetadata");
      else
        v8 = CFSTR("camera_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v69 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v67 = v9;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v75;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v75 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = [GEOPDCameraMetadata alloc];
                if (v16)
                  v17 = (void *)-[GEOPDCameraMetadata _initWithDictionary:isJSON:](v16, v15, a3);
                else
                  v17 = 0;
                objc_msgSend(a1, "addCameraMetadata:", v17);

              }
              ++v14;
            }
            while (v12 != v14);
            v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
            v12 = v18;
          }
          while (v18);
        }

        v9 = v67;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("position"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOPDOrientedPosition alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEOPDOrientedPosition initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEOPDOrientedPosition initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(a1, "setPosition:", v21);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("revision"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRevision:", objc_msgSend(v23, "intValue"));

      if (a3)
        v24 = CFSTR("imageryTimestamp");
      else
        v24 = CFSTR("imagery_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setImageryTimestamp:", objc_msgSend(v25, "unsignedLongLongValue"));

      if (a3)
        v26 = CFSTR("positionGeo");
      else
        v26 = CFSTR("position_geo");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = [GEOPDGeographicCoordinate alloc];
        if ((a3 & 1) != 0)
          v29 = -[GEOPDGeographicCoordinate initWithJSON:](v28, "initWithJSON:", v27);
        else
          v29 = -[GEOPDGeographicCoordinate initWithDictionary:](v28, "initWithDictionary:", v27);
        v30 = (void *)v29;
        objc_msgSend(a1, "setPositionGeo:", v29);

      }
      if (a3)
        v31 = CFSTR("buildTableIndex");
      else
        v31 = CFSTR("build_table_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBuildTableIndex:", objc_msgSend(v32, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("build"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = [GEOPDGroundDataBuild alloc];
        if (v34)
          v35 = (void *)-[GEOPDGroundDataBuild _initWithDictionary:isJSON:](v34, v33, a3);
        else
          v35 = 0;
        objc_msgSend(a1, "setBuild:", v35);

      }
      if (a3)
        v36 = CFSTR("cameraMetadataIndex");
      else
        v36 = CFSTR("camera_metadata_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v38 = v37;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v71;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v71 != v41)
                objc_enumerationMutation(v38);
              v43 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addCameraMetadataIndex:", objc_msgSend(v43, "unsignedIntValue"));
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
          }
          while (v40);
        }

        v5 = v69;
      }

      if (a3)
        v44 = CFSTR("tilePosition");
      else
        v44 = CFSTR("tile_position");
      objc_msgSend(v5, "objectForKeyedSubscript:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = [GEOPDOrientedTilePosition alloc];
        if ((a3 & 1) != 0)
          v47 = -[GEOPDOrientedTilePosition initWithJSON:](v46, "initWithJSON:", v45);
        else
          v47 = -[GEOPDOrientedTilePosition initWithDictionary:](v46, "initWithDictionary:", v45);
        v48 = (void *)v47;
        objc_msgSend(a1, "setTilePosition:", v47);

      }
      if (a3)
        v49 = CFSTR("parentTile");
      else
        v49 = CFSTR("parent_tile");
      objc_msgSend(v5, "objectForKeyedSubscript:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v51 = [GEOTileCoordinate alloc];
        if ((a3 & 1) != 0)
          v52 = -[GEOTileCoordinate initWithJSON:](v51, "initWithJSON:", v50);
        else
          v52 = -[GEOTileCoordinate initWithDictionary:](v51, "initWithDictionary:", v50);
        v53 = (void *)v52;
        objc_msgSend(a1, "setParentTile:", v52);

      }
      if (a3)
        v54 = CFSTR("rigMetrics");
      else
        v54 = CFSTR("rig_metrics");
      objc_msgSend(v5, "objectForKeyedSubscript:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v56 = [GEOPDRigMetrics alloc];
        if (v56)
        {
          v57 = v55;
          v56 = -[GEOPDRigMetrics init](v56, "init");
          if (v56)
          {
            if (a3)
              v58 = CFSTR("occlusionScore");
            else
              v58 = CFSTR("occlusion_score");
            objc_msgSend(v57, "objectForKeyedSubscript:", v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v68 = v57;
              v80 = 0u;
              v81 = 0u;
              v78 = 0u;
              v79 = 0u;
              v60 = v59;
              v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
              if (v61)
              {
                v62 = v61;
                v63 = *(_QWORD *)v79;
                do
                {
                  for (j = 0; j != v62; ++j)
                  {
                    if (*(_QWORD *)v79 != v63)
                      objc_enumerationMutation(v60);
                    v65 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v65, "unsignedIntValue");
                      PBRepeatedUInt32Add();
                    }
                  }
                  v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
                }
                while (v62);
              }

              v57 = v68;
              v5 = v69;
            }

          }
        }
        objc_msgSend(a1, "setRigMetrics:", v56);

      }
    }
  }

  return a1;
}

- (GEOPDPhotoPosition)initWithJSON:(id)a3
{
  return (GEOPDPhotoPosition *)-[GEOPDPhotoPosition _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPhotoPositionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPhotoPositionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 flags;
  unint64_t v11;
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
  if (self->_reader && (_GEOPDPhotoPositionIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDPhotoPosition readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint64Field();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_cameraMetadatas;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    if (self->_position)
      PBDataWriterWriteSubmessage();
    flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_positionGeo)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_build)
      PBDataWriterWriteSubmessage();
    if (self->_cameraMetadataIndexs.count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v11;
      }
      while (v11 < self->_cameraMetadataIndexs.count);
    }
    if (self->_tilePosition)
      PBDataWriterWriteSubmessage();
    if (self->_parentTile)
      PBDataWriterWriteSubmessage();
    if (self->_rigMetrics)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  __int16 flags;
  id *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  id *v13;
  id *v14;

  v14 = (id *)a3;
  -[GEOPDPhotoPosition readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v14 + 1, self->_reader);
  *((_DWORD *)v14 + 28) = self->_readerMarkPos;
  *((_DWORD *)v14 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v14[8] = (id)self->_imdataId;
    *((_WORD *)v14 + 66) |= 2u;
  }
  if (-[GEOPDPhotoPosition cameraMetadatasCount](self, "cameraMetadatasCount"))
  {
    objc_msgSend(v14, "clearCameraMetadatas");
    v4 = -[GEOPDPhotoPosition cameraMetadatasCount](self, "cameraMetadatasCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPDPhotoPosition cameraMetadataAtIndex:](self, "cameraMetadataAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addCameraMetadata:", v7);

      }
    }
  }
  if (self->_position)
    objc_msgSend(v14, "setPosition:");
  flags = (__int16)self->_flags;
  v9 = v14;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v14 + 32) = self->_revision;
    *((_WORD *)v14 + 66) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v14[7] = (id)self->_imageryTimestamp;
    *((_WORD *)v14 + 66) |= 1u;
  }
  if (self->_positionGeo)
  {
    objc_msgSend(v14, "setPositionGeo:");
    v9 = v14;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v9 + 31) = self->_buildTableIndex;
    *((_WORD *)v9 + 66) |= 4u;
  }
  if (self->_build)
    objc_msgSend(v14, "setBuild:");
  if (-[GEOPDPhotoPosition cameraMetadataIndexsCount](self, "cameraMetadataIndexsCount"))
  {
    objc_msgSend(v14, "clearCameraMetadataIndexs");
    v10 = -[GEOPDPhotoPosition cameraMetadataIndexsCount](self, "cameraMetadataIndexsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(v14, "addCameraMetadataIndex:", -[GEOPDPhotoPosition cameraMetadataIndexAtIndex:](self, "cameraMetadataIndexAtIndex:", j));
    }
  }
  if (self->_tilePosition)
    objc_msgSend(v14, "setTilePosition:");
  v13 = v14;
  if (self->_parentTile)
  {
    objc_msgSend(v14, "setParentTile:");
    v13 = v14;
  }
  if (self->_rigMetrics)
  {
    objc_msgSend(v14, "setRigMetrics:");
    v13 = v14;
  }

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
  __int16 flags;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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
      GEOPDPhotoPositionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPhotoPosition readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_imdataId;
    *(_WORD *)(v5 + 132) |= 2u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = self->_cameraMetadatas;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v5, "addCameraMetadata:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  v14 = -[GEOPDOrientedPosition copyWithZone:](self->_position, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v14;

  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_revision;
    *(_WORD *)(v5 + 132) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_imageryTimestamp;
    *(_WORD *)(v5 + 132) |= 1u;
  }
  v17 = -[GEOPDGeographicCoordinate copyWithZone:](self->_positionGeo, "copyWithZone:", a3, (_QWORD)v27);
  v18 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v17;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_buildTableIndex;
    *(_WORD *)(v5 + 132) |= 4u;
  }
  v19 = -[GEOPDGroundDataBuild copyWithZone:](self->_build, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  PBRepeatedUInt32Copy();
  v21 = -[GEOPDOrientedTilePosition copyWithZone:](self->_tilePosition, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v21;

  v23 = -[GEOTileCoordinate copyWithZone:](self->_parentTile, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v23;

  v25 = -[GEOPDRigMetrics copyWithZone:](self->_rigMetrics, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v25;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSMutableArray *cameraMetadatas;
  GEOPDOrientedPosition *position;
  __int16 flags;
  __int16 v9;
  GEOPDGeographicCoordinate *positionGeo;
  GEOPDGroundDataBuild *build;
  GEOPDOrientedTilePosition *tilePosition;
  GEOTileCoordinate *parentTile;
  GEOPDRigMetrics *rigMetrics;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  -[GEOPDPhotoPosition readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 66);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_imdataId != *((_QWORD *)v4 + 8))
      goto LABEL_38;
  }
  else if ((v5 & 2) != 0)
  {
    goto LABEL_38;
  }
  cameraMetadatas = self->_cameraMetadatas;
  if ((unint64_t)cameraMetadatas | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](cameraMetadatas, "isEqual:"))
  {
    goto LABEL_38;
  }
  position = self->_position;
  if ((unint64_t)position | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOPDOrientedPosition isEqual:](position, "isEqual:"))
      goto LABEL_38;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 66);
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_revision != *((_DWORD *)v4 + 32))
      goto LABEL_38;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_imageryTimestamp != *((_QWORD *)v4 + 7))
      goto LABEL_38;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_38;
  }
  positionGeo = self->_positionGeo;
  if ((unint64_t)positionGeo | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOPDGeographicCoordinate isEqual:](positionGeo, "isEqual:"))
    {
LABEL_38:
      v15 = 0;
      goto LABEL_39;
    }
    flags = (__int16)self->_flags;
    v9 = *((_WORD *)v4 + 66);
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_buildTableIndex != *((_DWORD *)v4 + 31))
      goto LABEL_38;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_38;
  }
  build = self->_build;
  if ((unint64_t)build | *((_QWORD *)v4 + 5) && !-[GEOPDGroundDataBuild isEqual:](build, "isEqual:"))
    goto LABEL_38;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_38;
  tilePosition = self->_tilePosition;
  if ((unint64_t)tilePosition | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOPDOrientedTilePosition isEqual:](tilePosition, "isEqual:"))
      goto LABEL_38;
  }
  parentTile = self->_parentTile;
  if ((unint64_t)parentTile | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOTileCoordinate isEqual:](parentTile, "isEqual:"))
      goto LABEL_38;
  }
  rigMetrics = self->_rigMetrics;
  if ((unint64_t)rigMetrics | *((_QWORD *)v4 + 12))
    v15 = -[GEOPDRigMetrics isEqual:](rigMetrics, "isEqual:");
  else
    v15 = 1;
LABEL_39:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  __int16 flags;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  -[GEOPDPhotoPosition readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v3 = 2654435761u * self->_imdataId;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_cameraMetadatas, "hash");
  v5 = -[GEOPDOrientedPosition hash](self->_position, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v7 = 2654435761 * self->_revision;
    if ((flags & 1) != 0)
      goto LABEL_6;
  }
  else
  {
    v7 = 0;
    if ((flags & 1) != 0)
    {
LABEL_6:
      v8 = 2654435761u * self->_imageryTimestamp;
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:
  v9 = -[GEOPDGeographicCoordinate hash](self->_positionGeo, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v10 = 2654435761 * self->_buildTableIndex;
  else
    v10 = 0;
  v11 = v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[GEOPDGroundDataBuild hash](self->_build, "hash");
  v12 = PBRepeatedUInt32Hash();
  v13 = v12 ^ -[GEOPDOrientedTilePosition hash](self->_tilePosition, "hash");
  v14 = v13 ^ -[GEOTileCoordinate hash](self->_parentTile, "hash");
  return v11 ^ v14 ^ -[GEOPDRigMetrics hash](self->_rigMetrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOPDOrientedPosition *position;
  uint64_t v11;
  __int16 v12;
  GEOPDGeographicCoordinate *positionGeo;
  uint64_t v14;
  GEOPDGroundDataBuild *build;
  void *v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  GEOPDOrientedTilePosition *tilePosition;
  uint64_t v35;
  GEOTileCoordinate *parentTile;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_WORD *)v4 + 66) & 2) != 0)
  {
    self->_imdataId = *((_QWORD *)v4 + 8);
    *(_WORD *)&self->_flags |= 2u;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v5 = *((id *)v4 + 6);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(v5);
        -[GEOPDPhotoPosition addCameraMetadata:](self, "addCameraMetadata:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v7);
  }

  position = self->_position;
  v11 = *((_QWORD *)v4 + 11);
  if (position)
  {
    if (v11)
      -[GEOPDOrientedPosition mergeFrom:](position, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOPDPhotoPosition setPosition:](self, "setPosition:");
  }
  v12 = *((_WORD *)v4 + 66);
  if ((v12 & 8) != 0)
  {
    self->_revision = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_flags |= 8u;
    v12 = *((_WORD *)v4 + 66);
  }
  if ((v12 & 1) != 0)
  {
    self->_imageryTimestamp = *((_QWORD *)v4 + 7);
    *(_WORD *)&self->_flags |= 1u;
  }
  positionGeo = self->_positionGeo;
  v14 = *((_QWORD *)v4 + 10);
  if (positionGeo)
  {
    if (v14)
      -[GEOPDGeographicCoordinate mergeFrom:](positionGeo, "mergeFrom:");
  }
  else if (v14)
  {
    -[GEOPDPhotoPosition setPositionGeo:](self, "setPositionGeo:");
  }
  if ((*((_WORD *)v4 + 66) & 4) != 0)
  {
    self->_buildTableIndex = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_flags |= 4u;
  }
  build = self->_build;
  v16 = (void *)*((_QWORD *)v4 + 5);
  if (build)
  {
    if (!v16)
      goto LABEL_52;
    v17 = v16;
    -[GEOPDGroundDataBuild readAll:]((uint64_t)v17, 0);
    v18 = *((_WORD *)v17 + 54);
    if ((v18 & 0x20) != 0)
    {
      build->_index = *((_DWORD *)v17 + 24);
      *(_WORD *)&build->_flags |= 0x20u;
      v18 = *((_WORD *)v17 + 54);
      if ((v18 & 2) == 0)
      {
LABEL_30:
        if ((v18 & 4) == 0)
          goto LABEL_31;
        goto LABEL_78;
      }
    }
    else if ((v18 & 2) == 0)
    {
      goto LABEL_30;
    }
    build->_buildId = *((_DWORD *)v17 + 20);
    *(_WORD *)&build->_flags |= 2u;
    v18 = *((_WORD *)v17 + 54);
    if ((v18 & 4) == 0)
    {
LABEL_31:
      if ((v18 & 8) == 0)
        goto LABEL_32;
      goto LABEL_79;
    }
LABEL_78:
    build->_dataFormatVersion = *((_DWORD *)v17 + 21);
    *(_WORD *)&build->_flags |= 4u;
    v18 = *((_WORD *)v17 + 54);
    if ((v18 & 8) == 0)
    {
LABEL_32:
      if ((v18 & 0x80) == 0)
        goto LABEL_33;
      goto LABEL_80;
    }
LABEL_79:
    build->_dataOutputVersion = *((_DWORD *)v17 + 22);
    *(_WORD *)&build->_flags |= 8u;
    v18 = *((_WORD *)v17 + 54);
    if ((v18 & 0x80) == 0)
    {
LABEL_33:
      if ((v18 & 0x10) == 0)
      {
LABEL_35:
        -[GEOPDGroundDataBuild _readCapabilitys]((uint64_t)v17);
        v19 = *((_QWORD *)v17 + 3);
        if (v19)
        {
          v20 = 0;
          v47 = *MEMORY[0x1E0C99858];
          do
          {
            -[GEOPDGroundDataBuild _readCapabilitys]((uint64_t)v17);
            v21 = *((_QWORD *)v17 + 3);
            if (v21 <= v20)
            {
              v22 = (void *)MEMORY[0x1E0C99DA0];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v20, v21);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v47, v23, 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "raise");

            }
            -[GEOPDGroundDataBuild addCapability:]((uint64_t)build);
            ++v20;
          }
          while (v19 != v20);
        }
        if ((*((_WORD *)v17 + 54) & 1) != 0)
        {
          build->_bucketId = *((_DWORD *)v17 + 19);
          *(_WORD *)&build->_flags |= 1u;
        }
        -[GEOPDGroundDataBuild _readLodWithTextures]((uint64_t)v17);
        v25 = *((_QWORD *)v17 + 6);
        if (v25)
        {
          v26 = 0;
          v48 = *MEMORY[0x1E0C99858];
          do
          {
            -[GEOPDGroundDataBuild _readLodWithTextures]((uint64_t)v17);
            v27 = *((_QWORD *)v17 + 6);
            if (v27 <= v26)
            {
              v28 = (void *)MEMORY[0x1E0C99DA0];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v26, v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v48, v29, 0);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "raise");

            }
            -[GEOPDGroundDataBuild addLodWithTextures:]((uint64_t)build);
            ++v26;
          }
          while (v25 != v26);
        }
        if ((*((_WORD *)v17 + 54) & 0x40) != 0)
        {
          build->_metricsVersion = *((_DWORD *)v17 + 25);
          *(_WORD *)&build->_flags |= 0x40u;
        }

        goto LABEL_52;
      }
LABEL_34:
      build->_heightAboveGroundM = *((float *)v17 + 23);
      *(_WORD *)&build->_flags |= 0x10u;
      goto LABEL_35;
    }
LABEL_80:
    build->_type = *((_DWORD *)v17 + 26);
    *(_WORD *)&build->_flags |= 0x80u;
    if ((*((_WORD *)v17 + 54) & 0x10) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
  if (v16)
    -[GEOPDPhotoPosition setBuild:](self, "setBuild:");
LABEL_52:
  v31 = objc_msgSend(v4, "cameraMetadataIndexsCount");
  if (v31)
  {
    v32 = v31;
    for (j = 0; j != v32; ++j)
      -[GEOPDPhotoPosition addCameraMetadataIndex:](self, "addCameraMetadataIndex:", objc_msgSend(v4, "cameraMetadataIndexAtIndex:", j));
  }
  tilePosition = self->_tilePosition;
  v35 = *((_QWORD *)v4 + 13);
  if (tilePosition)
  {
    if (v35)
      -[GEOPDOrientedTilePosition mergeFrom:](tilePosition, "mergeFrom:");
  }
  else if (v35)
  {
    -[GEOPDPhotoPosition setTilePosition:](self, "setTilePosition:");
  }
  parentTile = self->_parentTile;
  v37 = *((_QWORD *)v4 + 9);
  if (parentTile)
  {
    if (v37)
      -[GEOTileCoordinate mergeFrom:](parentTile, "mergeFrom:");
  }
  else if (v37)
  {
    -[GEOPDPhotoPosition setParentTile:](self, "setParentTile:");
  }
  v38 = (void *)*((_QWORD *)v4 + 12);
  if (self->_rigMetrics)
  {
    if (v38)
    {
      v39 = v38;
      v40 = v39[2];
      if (v40)
      {
        v41 = 0;
        v42 = *MEMORY[0x1E0C99858];
        do
        {
          v43 = v39[2];
          if (v43 <= v41)
          {
            v44 = (void *)MEMORY[0x1E0C99DA0];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v41, v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "exceptionWithName:reason:userInfo:", v42, v45, 0);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "raise");

          }
          PBRepeatedUInt32Add();
          ++v41;
        }
        while (v40 != v41);
      }

    }
  }
  else if (v38)
  {
    -[GEOPDPhotoPosition setRigMetrics:](self, "setRigMetrics:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilePosition, 0);
  objc_storeStrong((id *)&self->_rigMetrics, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_positionGeo, 0);
  objc_storeStrong((id *)&self->_parentTile, 0);
  objc_storeStrong((id *)&self->_cameraMetadatas, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
