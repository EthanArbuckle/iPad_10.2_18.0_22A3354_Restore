@implementation GEOPDViewportFrame

- (GEOPDViewportFrame)init
{
  GEOPDViewportFrame *v2;
  GEOPDViewportFrame *v3;
  GEOPDViewportFrame *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDViewportFrame;
  v2 = -[GEOPDViewportFrame init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDViewportFrame)initWithData:(id)a3
{
  GEOPDViewportFrame *v3;
  GEOPDViewportFrame *v4;
  GEOPDViewportFrame *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDViewportFrame;
  v3 = -[GEOPDViewportFrame initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTargetPoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDViewportFrameReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTargetPoint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)targetPoint
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDViewportFrame _readTargetPoint]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setTargetPoint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 64) |= 0x10u;
  *(_BYTE *)(a1 + 64) |= 0x40u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readViewTargetBounds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 64) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDViewportFrameReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewTargetBounds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)viewTargetBounds
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDViewportFrame _readViewTargetBounds]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setViewTargetBounds:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 64) |= 0x20u;
  *(_BYTE *)(a1 + 64) |= 0x40u;
  objc_storeStrong((id *)(a1 + 32), a2);

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
  v8.super_class = (Class)GEOPDViewportFrame;
  -[GEOPDViewportFrame description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDViewportFrame dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDViewportFrame _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  double v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;

  if (!a1)
    return 0;
  -[GEOPDViewportFrame readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDViewportFrame targetPoint]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("targetPoint");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("target_point");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  v10 = *(_BYTE *)(a1 + 64);
  if ((v10 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
      goto LABEL_9;
LABEL_15:
    LODWORD(v9) = *(_DWORD *)(a1 + 60);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("pitch"));

    if ((*(_BYTE *)(a1 + 64) & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  LODWORD(v9) = *(_DWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("heading"));

  v10 = *(_BYTE *)(a1 + 64);
  if ((v10 & 4) != 0)
    goto LABEL_15;
LABEL_9:
  if ((v10 & 1) != 0)
  {
LABEL_10:
    LODWORD(v9) = *(_DWORD *)(a1 + 52);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("distance"));

  }
LABEL_11:
  -[GEOPDViewportFrame viewTargetBounds]((id *)a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("viewTargetBounds");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("view_target_bounds");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  v18 = *(void **)(a1 + 16);
  if (v18)
  {
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __48__GEOPDViewportFrame__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v22 = v21;
      v26 = v22;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);
      v23 = v22;

      v20 = v23;
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDViewportFrame _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_7324;
      else
        v6 = (int *)&readAll__nonRecursiveTag_7325;
      GEOPDViewportFrameReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 24), "readAll:", 1);
      -[GEOPDBoundingCube readAll:](*(_QWORD *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __48__GEOPDViewportFrame__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDViewportFrameReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDViewportFrameIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_16;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDViewportFrame readAll:]((uint64_t)self, 0);
  if (self->_targetPoint)
    PBDataWriterWriteSubmessage();
  flags = (char)self->_flags;
  v6 = v9;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
LABEL_13:
    PBDataWriterWriteFloatField();
    v6 = v9;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteFloatField();
  v6 = v9;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_13;
LABEL_7:
  if ((flags & 1) != 0)
  {
LABEL_8:
    PBDataWriterWriteFloatField();
    v6 = v9;
  }
LABEL_9:
  if (self->_viewTargetBounds)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  char flags;
  id v12;
  void *v13;
  PBUnknownFields *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDViewportFrame readAll:]((uint64_t)self, 0);
    v9 = -[GEOPDGeographicCoordinate copyWithZone:](self->_targetPoint, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v9;

    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      *(float *)(v5 + 56) = self->_heading;
      *(_BYTE *)(v5 + 64) |= 2u;
      flags = (char)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0)
        {
LABEL_9:
          v12 = -[GEOPDBoundingCube copyWithZone:](self->_viewTargetBounds, "copyWithZone:", a3);
          v13 = *(void **)(v5 + 32);
          *(_QWORD *)(v5 + 32) = v12;

          v14 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v14;
          goto LABEL_10;
        }
LABEL_8:
        *(float *)(v5 + 52) = self->_distance;
        *(_BYTE *)(v5 + 64) |= 1u;
        goto LABEL_9;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(float *)(v5 + 60) = self->_pitch;
    *(_BYTE *)(v5 + 64) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
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
  GEOPDViewportFrameReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDGeographicCoordinate *targetPoint;
  GEOPDBoundingCube *viewTargetBounds;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOPDViewportFrame readAll:]((uint64_t)self, 1);
  -[GEOPDViewportFrame readAll:]((uint64_t)v4, 1);
  targetPoint = self->_targetPoint;
  if ((unint64_t)targetPoint | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDGeographicCoordinate isEqual:](targetPoint, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_heading != *((float *)v4 + 14))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_pitch != *((float *)v4 + 15))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_distance != *((float *)v4 + 13))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_21;
  }
  viewTargetBounds = self->_viewTargetBounds;
  if ((unint64_t)viewTargetBounds | *((_QWORD *)v4 + 4))
    v7 = -[GEOPDBoundingCube isEqual:](viewTargetBounds, "isEqual:");
  else
    v7 = 1;
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  char flags;
  unint64_t v5;
  float heading;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  float pitch;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  float distance;
  double v17;
  long double v18;
  double v19;

  -[GEOPDViewportFrame readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDGeographicCoordinate hash](self->_targetPoint, "hash");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    heading = self->_heading;
    v7 = heading;
    if (heading < 0.0)
      v7 = -heading;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((flags & 4) != 0)
  {
    pitch = self->_pitch;
    v12 = pitch;
    if (pitch < 0.0)
      v12 = -pitch;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((flags & 1) != 0)
  {
    distance = self->_distance;
    v17 = distance;
    if (distance < 0.0)
      v17 = -distance;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ -[GEOPDBoundingCube hash](self->_viewTargetBounds, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewTargetBounds, 0);
  objc_storeStrong((id *)&self->_targetPoint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
