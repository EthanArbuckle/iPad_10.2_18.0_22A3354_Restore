@implementation GEOPDCameraMetadata

- (GEOPDCameraMetadata)init
{
  GEOPDCameraMetadata *v2;
  GEOPDCameraMetadata *v3;
  GEOPDCameraMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDCameraMetadata;
  v2 = -[GEOPDCameraMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDCameraMetadata)initWithData:(id)a3
{
  GEOPDCameraMetadata *v3;
  GEOPDCameraMetadata *v4;
  GEOPDCameraMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDCameraMetadata;
  v3 = -[GEOPDCameraMetadata initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPDCameraMetadata;
  -[GEOPDCameraMetadata dealloc](&v3, sel_dealloc);
}

- (void)_readLensProjection
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCameraMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLensProjection_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)lensProjection
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCameraMetadata _readLensProjection]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readPosition
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCameraMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPosition_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)position
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCameraMetadata _readPosition]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readTextureIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCameraMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTextureIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
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
  v8.super_class = (Class)GEOPDCameraMetadata;
  -[GEOPDCameraMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCameraMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCameraMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  -[GEOPDCameraMetadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 80);
  if ((v5 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 80) & 4) == 0)
      goto LABEL_4;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 76));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("imageWidth");
    else
      v15 = CFSTR("image_width");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

    if ((*(_BYTE *)(a1 + 80) & 2) == 0)
      goto LABEL_9;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 68));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("cameraNumber");
  else
    v13 = CFSTR("camera_number");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  v5 = *(_BYTE *)(a1 + 80);
  if ((v5 & 4) != 0)
    goto LABEL_16;
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("imageHeight");
    else
      v7 = CFSTR("image_height");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_9:
  -[GEOPDCameraMetadata lensProjection]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("lensProjection");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("lens_projection");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  -[GEOPDCameraMetadata position]((id *)a1);
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
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt32NSArray();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("textureId");
    else
      v20 = CFSTR("texture_id");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDCameraMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_59;
      else
        v6 = (int *)&readAll__nonRecursiveTag_59;
      GEOPDCameraMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 48), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  GEOPDLensProjection *v18;
  id v19;
  void *v20;
  int v21;
  const __CFString *v22;
  void *v23;
  double v24;
  const __CFString *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  GEOPDLensProjection *v42;
  void *v43;
  GEOPDOrientedPosition *v44;
  GEOPDOrientedPosition *v45;
  GEOPDOrientedPosition *v46;
  GEOPDOrientedPosition *v47;
  const __CFString *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("cameraNumber");
    else
      v7 = CFSTR("camera_number");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "intValue");
      *(_BYTE *)(v6 + 80) |= 0x40u;
      *(_BYTE *)(v6 + 80) |= 1u;
      *(_DWORD *)(v6 + 68) = v9;
    }

    if (a3)
      v10 = CFSTR("imageWidth");
    else
      v10 = CFSTR("image_width");
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v11, "intValue");
      *(_BYTE *)(v6 + 80) |= 0x40u;
      *(_BYTE *)(v6 + 80) |= 4u;
      *(_DWORD *)(v6 + 76) = v12;
    }

    if (a3)
      v13 = CFSTR("imageHeight");
    else
      v13 = CFSTR("image_height");
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "intValue");
      *(_BYTE *)(v6 + 80) |= 0x40u;
      *(_BYTE *)(v6 + 80) |= 2u;
      *(_DWORD *)(v6 + 72) = v15;
    }

    if (a3)
      v16 = CFSTR("lensProjection");
    else
      v16 = CFSTR("lens_projection");
    objc_msgSend(v5, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = [GEOPDLensProjection alloc];
      if (v18)
      {
        v19 = v17;
        v18 = -[GEOPDLensProjection init](v18, "init");
        if (v18)
        {
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("type"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = objc_msgSend(v20, "intValue");
            *(_WORD *)&v18->_flags |= 0x200u;
            v18->_type = v21;
          }

          if (a3)
            v22 = CFSTR("fovS");
          else
            v22 = CFSTR("fov_s");
          objc_msgSend(v19, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v23, "doubleValue");
            *(_WORD *)&v18->_flags |= 8u;
            v18->_fovS = v24;
          }

          if (a3)
            v25 = CFSTR("fovH");
          else
            v25 = CFSTR("fov_h");
          objc_msgSend(v19, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v26, "doubleValue");
            *(_WORD *)&v18->_flags |= 4u;
            v18->_fovH = v27;
          }

          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("k2"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v28, "doubleValue");
            *(_WORD *)&v18->_flags |= 0x10u;
            v18->_k2 = v29;
          }

          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("k3"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v30, "doubleValue");
            *(_WORD *)&v18->_flags |= 0x20u;
            v18->_k3 = v31;
          }

          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("k4"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v32, "doubleValue");
            *(_WORD *)&v18->_flags |= 0x40u;
            v18->_k4 = v33;
          }

          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("cx"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v34, "doubleValue");
            *(_WORD *)&v18->_flags |= 1u;
            v18->_cx = v35;
          }

          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("cy"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v36, "doubleValue");
            *(_WORD *)&v18->_flags |= 2u;
            v18->_cy = v37;
          }

          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("lx"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v38, "doubleValue");
            *(_WORD *)&v18->_flags |= 0x80u;
            v18->_lx = v39;
          }

          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ly"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v40, "doubleValue");
            *(_WORD *)&v18->_flags |= 0x100u;
            v18->_ly = v41;
          }

        }
      }
      v42 = v18;
      *(_BYTE *)(v6 + 80) |= 0x10u;
      *(_BYTE *)(v6 + 80) |= 0x40u;
      objc_storeStrong((id *)(v6 + 40), v18);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("position"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = [GEOPDOrientedPosition alloc];
      if ((a3 & 1) != 0)
        v45 = -[GEOPDOrientedPosition initWithJSON:](v44, "initWithJSON:", v43);
      else
        v45 = -[GEOPDOrientedPosition initWithDictionary:](v44, "initWithDictionary:", v43);
      v46 = v45;
      v47 = v45;
      *(_BYTE *)(v6 + 80) |= 0x20u;
      *(_BYTE *)(v6 + 80) |= 0x40u;
      objc_storeStrong((id *)(v6 + 48), v46);

    }
    if (a3)
      v48 = CFSTR("textureId");
    else
      v48 = CFSTR("texture_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = v49;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v50 = v49;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v59 != v53)
              objc_enumerationMutation(v50);
            v55 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v55, "unsignedIntValue");
              -[GEOPDCameraMetadata _readTextureIds](v6);
              PBRepeatedUInt32Add();
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v6 + 80) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 64));
              *(_BYTE *)(v6 + 80) |= 0x40u;
            }
          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        }
        while (v52);
      }

      v49 = v57;
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDCameraMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  void *v6;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_textureIds;
  unint64_t v8;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x78) == 0))
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "writeData:", v10);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    v6 = v11;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDCameraMetadata readAll:]((uint64_t)self, 0);
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    v6 = v11;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v11;
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v11;
    }
    if (self->_lensProjection)
    {
      PBDataWriterWriteSubmessage();
      v6 = v11;
    }
    if (self->_position)
    {
      PBDataWriterWriteSubmessage();
      v6 = v11;
    }
    p_textureIds = &self->_textureIds;
    if (p_textureIds->count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        v6 = v11;
        ++v8;
      }
      while (v8 < p_textureIds->count);
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDCameraMetadata readAll:]((uint64_t)self, 0);
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      *(_DWORD *)(v5 + 68) = self->_cameraNumber;
      *(_BYTE *)(v5 + 80) |= 1u;
      flags = (char)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 2) == 0)
        {
LABEL_9:
          v10 = -[GEOPDLensProjection copyWithZone:](self->_lensProjection, "copyWithZone:", a3);
          v11 = *(void **)(v5 + 40);
          *(_QWORD *)(v5 + 40) = v10;

          v12 = -[GEOPDOrientedPosition copyWithZone:](self->_position, "copyWithZone:", a3);
          v13 = *(void **)(v5 + 48);
          *(_QWORD *)(v5 + 48) = v12;

          PBRepeatedUInt32Copy();
          return (id)v5;
        }
LABEL_8:
        *(_DWORD *)(v5 + 72) = self->_imageHeight;
        *(_BYTE *)(v5 + 80) |= 2u;
        goto LABEL_9;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 76) = self->_imageWidth;
    *(_BYTE *)(v5 + 80) |= 4u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDCameraMetadataReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDLensProjection *lensProjection;
  GEOPDOrientedPosition *position;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOPDCameraMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDCameraMetadata readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_cameraNumber != *((_DWORD *)v4 + 17))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_22:
    IsEqual = 0;
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_imageWidth != *((_DWORD *)v4 + 19))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_imageHeight != *((_DWORD *)v4 + 18))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_22;
  }
  lensProjection = self->_lensProjection;
  if ((unint64_t)lensProjection | *((_QWORD *)v4 + 5)
    && !-[GEOPDLensProjection isEqual:](lensProjection, "isEqual:"))
  {
    goto LABEL_22;
  }
  position = self->_position;
  if ((unint64_t)position | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDOrientedPosition isEqual:](position, "isEqual:"))
      goto LABEL_22;
  }
  IsEqual = PBRepeatedUInt32IsEqual();
LABEL_23:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[GEOPDCameraMetadata readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_cameraNumber;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_imageWidth;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_imageHeight;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[GEOPDLensProjection hash](self->_lensProjection, "hash");
  v7 = -[GEOPDOrientedPosition hash](self->_position, "hash");
  return v6 ^ v7 ^ PBRepeatedUInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_lensProjection, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
