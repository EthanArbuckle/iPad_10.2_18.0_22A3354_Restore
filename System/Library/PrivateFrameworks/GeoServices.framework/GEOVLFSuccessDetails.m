@implementation GEOVLFSuccessDetails

- (GEOVLFSuccessDetails)init
{
  GEOVLFSuccessDetails *v2;
  GEOVLFSuccessDetails *v3;
  GEOVLFSuccessDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVLFSuccessDetails;
  v2 = -[GEOVLFSuccessDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFSuccessDetails)initWithData:(id)a3
{
  GEOVLFSuccessDetails *v3;
  GEOVLFSuccessDetails *v4;
  GEOVLFSuccessDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVLFSuccessDetails;
  v3 = -[GEOVLFSuccessDetails initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOVLFSuccessDetails;
  -[GEOVLFSuccessDetails dealloc](&v3, sel_dealloc);
}

- (void)_readCorrection
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFSuccessDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrection_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCorrection
{
  -[GEOVLFSuccessDetails _readCorrection]((uint64_t)self);
  return self->_correction != 0;
}

- (GEOVLFCorrection)correction
{
  -[GEOVLFSuccessDetails _readCorrection]((uint64_t)self);
  return self->_correction;
}

- (void)setCorrection:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_correction, a3);
}

- (double)poseConfidence
{
  return self->_poseConfidence;
}

- (void)setPoseConfidence:(double)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  self->_poseConfidence = a3;
}

- (void)setHasPoseConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasPoseConfidence
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readInlierSuccessIndices
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFSuccessDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInlierSuccessIndices_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)inlierSuccessIndicesCount
{
  -[GEOVLFSuccessDetails _readInlierSuccessIndices]((uint64_t)self);
  return self->_inlierSuccessIndices.count;
}

- (unsigned)inlierSuccessIndices
{
  -[GEOVLFSuccessDetails _readInlierSuccessIndices]((uint64_t)self);
  return self->_inlierSuccessIndices.list;
}

- (void)clearInlierSuccessIndices
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt32Clear();
}

- (void)addInlierSuccessIndices:(unsigned int)a3
{
  -[GEOVLFSuccessDetails _readInlierSuccessIndices]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (unsigned)inlierSuccessIndicesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_inlierSuccessIndices;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFSuccessDetails _readInlierSuccessIndices]((uint64_t)self);
  p_inlierSuccessIndices = &self->_inlierSuccessIndices;
  count = self->_inlierSuccessIndices.count;
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
  return p_inlierSuccessIndices->list[a3];
}

- (void)setInlierSuccessIndices:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt32Set();
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
  v8.super_class = (Class)GEOVLFSuccessDetails;
  -[GEOVLFSuccessDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFSuccessDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFSuccessDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "correction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("correction"));

    }
    if ((*(_BYTE *)(a1 + 68) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("poseConfidence");
      else
        v9 = CFSTR("pose_confidence");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

    }
    if (*(_QWORD *)(a1 + 24))
    {
      PBRepeatedUInt32NSArray();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v11 = CFSTR("inlierSuccessIndices");
      else
        v11 = CFSTR("inlier_success_indices");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFSuccessDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFSuccessDetails)initWithDictionary:(id)a3
{
  return (GEOVLFSuccessDetails *)-[GEOVLFSuccessDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOVLFCorrection *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correction"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOVLFCorrection alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOVLFCorrection initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOVLFCorrection initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setCorrection:", v8);

      }
      if (a3)
        v10 = CFSTR("poseConfidence");
      else
        v10 = CFSTR("pose_confidence");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(a1, "setPoseConfidence:");
      }

      if (a3)
        v12 = CFSTR("inlierSuccessIndices");
      else
        v12 = CFSTR("inlier_success_indices");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v22 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addInlierSuccessIndices:", objc_msgSend(v19, "unsignedIntValue", (_QWORD)v21));
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v16);
        }

      }
    }
  }

  return a1;
}

- (GEOVLFSuccessDetails)initWithJSON:(id)a3
{
  return (GEOVLFSuccessDetails *)-[GEOVLFSuccessDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_10160;
    else
      v8 = (int *)&readAll__nonRecursiveTag_10161;
    GEOVLFSuccessDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOVLFCorrection readAll:](self->_correction, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFSuccessDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFSuccessDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_inlierSuccessIndices;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    v5 = v10;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOVLFSuccessDetails readAll:](self, "readAll:", 0);
    if (self->_correction)
      PBDataWriterWriteSubmessage();
    v5 = v10;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      v5 = v10;
    }
    p_inlierSuccessIndices = &self->_inlierSuccessIndices;
    if (p_inlierSuccessIndices->count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        v5 = v10;
        ++v7;
      }
      while (v7 < p_inlierSuccessIndices->count);
    }
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id *v7;

  v7 = (id *)a3;
  -[GEOVLFSuccessDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 14) = self->_readerMarkPos;
  *((_DWORD *)v7 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_correction)
    objc_msgSend(v7, "setCorrection:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v7[6] = *(id *)&self->_poseConfidence;
    *((_BYTE *)v7 + 68) |= 1u;
  }
  if (-[GEOVLFSuccessDetails inlierSuccessIndicesCount](self, "inlierSuccessIndicesCount"))
  {
    objc_msgSend(v7, "clearInlierSuccessIndices");
    v4 = -[GEOVLFSuccessDetails inlierSuccessIndicesCount](self, "inlierSuccessIndicesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addInlierSuccessIndices:", -[GEOVLFSuccessDetails inlierSuccessIndicesAtIndex:](self, "inlierSuccessIndicesAtIndex:", i));
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOVLFSuccessDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOVLFSuccessDetails readAll:](self, "readAll:", 0);
  v9 = -[GEOVLFCorrection copyWithZone:](self->_correction, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 48) = self->_poseConfidence;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  PBRepeatedUInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOVLFCorrection *correction;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOVLFSuccessDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  correction = self->_correction;
  if ((unint64_t)correction | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOVLFCorrection isEqual:](correction, "isEqual:"))
      goto LABEL_10;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_poseConfidence != *((double *)v4 + 6))
      goto LABEL_10;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_10:
    IsEqual = 0;
    goto LABEL_11;
  }
  IsEqual = PBRepeatedUInt32IsEqual();
LABEL_11:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  double poseConfidence;
  double v6;
  long double v7;
  double v8;

  -[GEOVLFSuccessDetails readAll:](self, "readAll:", 1);
  v3 = -[GEOVLFCorrection hash](self->_correction, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    poseConfidence = self->_poseConfidence;
    v6 = -poseConfidence;
    if (poseConfidence >= 0.0)
      v6 = self->_poseConfidence;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ PBRepeatedUInt32Hash() ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOVLFCorrection *correction;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  double *v9;

  v9 = (double *)a3;
  objc_msgSend(v9, "readAll:", 0);
  correction = self->_correction;
  v5 = *((_QWORD *)v9 + 5);
  if (correction)
  {
    if (v5)
      -[GEOVLFCorrection mergeFrom:](correction, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOVLFSuccessDetails setCorrection:](self, "setCorrection:");
  }
  if ((*((_BYTE *)v9 + 68) & 1) != 0)
  {
    self->_poseConfidence = v9[6];
    *(_BYTE *)&self->_flags |= 1u;
  }
  v6 = objc_msgSend(v9, "inlierSuccessIndicesCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[GEOVLFSuccessDetails addInlierSuccessIndices:](self, "addInlierSuccessIndices:", objc_msgSend(v9, "inlierSuccessIndicesAtIndex:", i));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correction, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
