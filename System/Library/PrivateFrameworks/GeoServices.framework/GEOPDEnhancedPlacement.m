@implementation GEOPDEnhancedPlacement

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDEnhancedPlacement;
  -[GEOPDEnhancedPlacement dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  char flags;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_buildingIds.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v7;
      ++v5;
    }
    while (v5 < self->_buildingIds.count);
  }
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_6;
LABEL_10:
    PBDataWriterWriteFloatField();
    v4 = v7;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  v4 = v7;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_10;
LABEL_6:
  if ((flags & 2) != 0)
  {
LABEL_7:
    PBDataWriterWriteFloatField();
    v4 = v7;
  }
LABEL_8:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

+ (GEOPDEnhancedPlacement)enhancedPlacementWithPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__GEOPDEnhancedPlacement_PlaceDataExtras__enhancedPlacementWithPlaceData___block_invoke;
  v6[3] = &unk_1E1C09768;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateComponentOfType:enumerationOptions:usingBlock:", 88, 1, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOPDEnhancedPlacement *)v4;
}

void __74__GEOPDEnhancedPlacement_PlaceDataExtras__enhancedPlacementWithPlaceData___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[GEOPDComponent values](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if (v10 && *(_QWORD *)(v10 + 168))
        {
          -[GEOPDComponentValue enhancedPlacement]((id *)v10);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v13 = *(void **)(v12 + 40);
          *(_QWORD *)(v12 + 40) = v11;

          *a3 = 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (uint64_t)buildingIdAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 24);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(_QWORD *)(*(_QWORD *)(v3 + 16) + 8 * a2);
  }
  return result;
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
  v8.super_class = (Class)GEOPDEnhancedPlacement;
  -[GEOPDEnhancedPlacement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDEnhancedPlacement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDEnhancedPlacement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  double v5;
  void *v6;
  const __CFString *v7;
  char v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt64NSArray();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("buildingId");
    else
      v7 = CFSTR("building_id");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  v8 = *(_BYTE *)(a1 + 56);
  if ((v8 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
      goto LABEL_9;
LABEL_21:
    LODWORD(v5) = *(_DWORD *)(a1 + 52);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("buildingHeight");
    else
      v20 = CFSTR("building_height");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

    if ((*(_BYTE *)(a1 + 56) & 2) == 0)
      goto LABEL_14;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("elevation"));

  v8 = *(_BYTE *)(a1 + 56);
  if ((v8 & 4) != 0)
    goto LABEL_21;
LABEL_9:
  if ((v8 & 2) != 0)
  {
LABEL_10:
    LODWORD(v5) = *(_DWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("buildingFaceAzimuth");
    else
      v10 = CFSTR("building_face_azimuth");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
LABEL_14:
  v11 = *(void **)(a1 + 8);
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __52__GEOPDEnhancedPlacement__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v15 = v14;
      v22 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v21);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDEnhancedPlacement _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOPDEnhancedPlacement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDEnhancedPlacementReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(float *)(v4 + 52) = self->_buildingHeight;
    *(_BYTE *)(v4 + 56) |= 4u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(double *)(v4 + 40) = self->_elevation;
  *(_BYTE *)(v4 + 56) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(float *)(v4 + 48) = self->_buildingFaceAzimuth;
    *(_BYTE *)(v4 + 56) |= 2u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedUInt64IsEqual())
    goto LABEL_17;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_elevation != *((double *)v4 + 5))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v5 = 0;
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_buildingHeight != *((float *)v4 + 13))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_17;
  }
  v5 = (*((_BYTE *)v4 + 56) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_buildingFaceAzimuth != *((float *)v4 + 12))
      goto LABEL_17;
    v5 = 1;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  char flags;
  unint64_t v5;
  double elevation;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  float buildingHeight;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  float buildingFaceAzimuth;
  double v17;
  long double v18;
  double v19;

  v3 = PBRepeatedUInt64Hash();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    elevation = self->_elevation;
    v7 = -elevation;
    if (elevation >= 0.0)
      v7 = self->_elevation;
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
    buildingHeight = self->_buildingHeight;
    v12 = buildingHeight;
    if (buildingHeight < 0.0)
      v12 = -buildingHeight;
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
  if ((flags & 2) != 0)
  {
    buildingFaceAzimuth = self->_buildingFaceAzimuth;
    v17 = buildingFaceAzimuth;
    if (buildingFaceAzimuth < 0.0)
      v17 = -buildingFaceAzimuth;
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
  return v5 ^ v3 ^ v10 ^ v15;
}

@end
