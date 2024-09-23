@implementation GEORPFeedbackRouteStep

- (GEORPFeedbackRouteStep)init
{
  GEORPFeedbackRouteStep *v2;
  GEORPFeedbackRouteStep *v3;
  GEORPFeedbackRouteStep *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackRouteStep;
  v2 = -[GEORPFeedbackRouteStep init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackRouteStep)initWithData:(id)a3
{
  GEORPFeedbackRouteStep *v3;
  GEORPFeedbackRouteStep *v4;
  GEORPFeedbackRouteStep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackRouteStep;
  v3 = -[GEORPFeedbackRouteStep initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)directionsResponseWaypointIndex
{
  return self->_directionsResponseWaypointIndex;
}

- (void)setDirectionsResponseWaypointIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_directionsResponseWaypointIndex = a3;
}

- (void)setHasDirectionsResponseWaypointIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasDirectionsResponseWaypointIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)routeLegIndex
{
  return self->_routeLegIndex;
}

- (void)setRouteLegIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_routeLegIndex = a3;
}

- (void)setHasRouteLegIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRouteLegIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)stepId
{
  return self->_stepId;
}

- (void)setStepId:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  self->_stepId = a3;
}

- (void)setHasStepId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 36;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasStepId
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readRouteStepImageId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRouteStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteStepImageId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasRouteStepImageId
{
  -[GEORPFeedbackRouteStep _readRouteStepImageId]((uint64_t)self);
  return self->_routeStepImageId != 0;
}

- (NSString)routeStepImageId
{
  -[GEORPFeedbackRouteStep _readRouteStepImageId]((uint64_t)self);
  return self->_routeStepImageId;
}

- (void)setRouteStepImageId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_routeStepImageId, a3);
}

- (void)_readUserPhotoId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 56) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRouteStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserPhotoId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasUserPhotoId
{
  -[GEORPFeedbackRouteStep _readUserPhotoId]((uint64_t)self);
  return self->_userPhotoId != 0;
}

- (NSString)userPhotoId
{
  -[GEORPFeedbackRouteStep _readUserPhotoId]((uint64_t)self);
  return self->_userPhotoId;
}

- (void)setUserPhotoId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_userPhotoId, a3);
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
  v8.super_class = (Class)GEORPFeedbackRouteStep;
  -[GEORPFeedbackRouteStep description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackRouteStep dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackRouteStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 56) & 2) == 0)
      goto LABEL_4;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("routeLegIndex");
    else
      v16 = CFSTR("route_leg_index");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
      goto LABEL_9;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 44));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v14 = CFSTR("directionsResponseWaypointIndex");
  else
    v14 = CFSTR("directions_response_waypoint_index");
  objc_msgSend(v4, "setObject:forKey:", v13, v14);

  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 2) != 0)
    goto LABEL_25;
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("stepId");
    else
      v7 = CFSTR("step_id");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_9:
  objc_msgSend((id)a1, "routeStepImageId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("routeStepImageId");
    else
      v9 = CFSTR("route_step_image_id");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  objc_msgSend((id)a1, "userPhotoId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("userPhotoId");
    else
      v11 = CFSTR("user_photo_id");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackRouteStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackRouteStep)initWithDictionary:(id)a3
{
  return (GEORPFeedbackRouteStep *)-[GEORPFeedbackRouteStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("directionsResponseWaypointIndex");
      else
        v6 = CFSTR("directions_response_waypoint_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDirectionsResponseWaypointIndex:", objc_msgSend(v7, "intValue"));

      if (a3)
        v8 = CFSTR("routeLegIndex");
      else
        v8 = CFSTR("route_leg_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRouteLegIndex:", objc_msgSend(v9, "intValue"));

      if (a3)
        v10 = CFSTR("stepId");
      else
        v10 = CFSTR("step_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStepId:", objc_msgSend(v11, "unsignedIntValue"));

      if (a3)
        v12 = CFSTR("routeStepImageId");
      else
        v12 = CFSTR("route_step_image_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setRouteStepImageId:", v14);

      }
      if (a3)
        v15 = CFSTR("userPhotoId");
      else
        v15 = CFSTR("user_photo_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(a1, "setUserPhotoId:", v17);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackRouteStep)initWithJSON:(id)a3
{
  return (GEORPFeedbackRouteStep *)-[GEORPFeedbackRouteStep _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_722;
    else
      v8 = (int *)&readAll__nonRecursiveTag_723;
    GEORPFeedbackRouteStepReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackRouteStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackRouteStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 0x38) == 0)
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
      goto LABEL_15;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackRouteStep readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
LABEL_12:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_12;
LABEL_5:
  if ((flags & 4) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_routeStepImageId)
    PBDataWriterWriteStringField();
  if (self->_userPhotoId)
    PBDataWriterWriteStringField();
LABEL_15:

}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEORPFeedbackRouteStep readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 8) = self->_readerMarkPos;
  *((_DWORD *)v6 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_directionsResponseWaypointIndex;
    *((_BYTE *)v6 + 56) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 12) = self->_routeLegIndex;
  *((_BYTE *)v6 + 56) |= 2u;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v6 + 13) = self->_stepId;
    *((_BYTE *)v6 + 56) |= 4u;
  }
LABEL_5:
  if (self->_routeStepImageId)
  {
    objc_msgSend(v6, "setRouteStepImageId:");
    v4 = v6;
  }
  if (self->_userPhotoId)
  {
    objc_msgSend(v6, "setUserPhotoId:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackRouteStep readAll:](self, "readAll:", 0);
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      *(_DWORD *)(v5 + 44) = self->_directionsResponseWaypointIndex;
      *(_BYTE *)(v5 + 56) |= 1u;
      flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_7:
        if ((flags & 4) == 0)
        {
LABEL_9:
          v10 = -[NSString copyWithZone:](self->_routeStepImageId, "copyWithZone:", a3);
          v11 = *(void **)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v10;

          v12 = -[NSString copyWithZone:](self->_userPhotoId, "copyWithZone:", a3);
          v8 = *(id *)(v5 + 24);
          *(_QWORD *)(v5 + 24) = v12;
          goto LABEL_10;
        }
LABEL_8:
        *(_DWORD *)(v5 + 52) = self->_stepId;
        *(_BYTE *)(v5 + 56) |= 4u;
        goto LABEL_9;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 48) = self->_routeLegIndex;
    *(_BYTE *)(v5 + 56) |= 2u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackRouteStepReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *routeStepImageId;
  NSString *userPhotoId;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEORPFeedbackRouteStep readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_directionsResponseWaypointIndex != *((_DWORD *)v4 + 11))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_routeLegIndex != *((_DWORD *)v4 + 12))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_stepId != *((_DWORD *)v4 + 13))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_21;
  }
  routeStepImageId = self->_routeStepImageId;
  if ((unint64_t)routeStepImageId | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](routeStepImageId, "isEqual:"))
  {
    goto LABEL_21;
  }
  userPhotoId = self->_userPhotoId;
  if ((unint64_t)userPhotoId | *((_QWORD *)v4 + 3))
    v7 = -[NSString isEqual:](userPhotoId, "isEqual:");
  else
    v7 = 1;
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  -[GEORPFeedbackRouteStep readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_directionsResponseWaypointIndex;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_routeLegIndex;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_stepId;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_routeStepImageId, "hash");
  return v6 ^ -[NSString hash](self->_userPhotoId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  v5 = *((_BYTE *)v6 + 56);
  if ((v5 & 1) != 0)
  {
    self->_directionsResponseWaypointIndex = *((_DWORD *)v6 + 11);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v6 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v6 + 56) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_routeLegIndex = *((_DWORD *)v6 + 12);
  *(_BYTE *)&self->_flags |= 2u;
  if ((*((_BYTE *)v6 + 56) & 4) != 0)
  {
LABEL_4:
    self->_stepId = *((_DWORD *)v6 + 13);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_5:
  if (*((_QWORD *)v6 + 2))
  {
    -[GEORPFeedbackRouteStep setRouteStepImageId:](self, "setRouteStepImageId:");
    v4 = v6;
  }
  if (v4[3])
  {
    -[GEORPFeedbackRouteStep setUserPhotoId:](self, "setUserPhotoId:");
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPhotoId, 0);
  objc_storeStrong((id *)&self->_routeStepImageId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
