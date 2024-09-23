@implementation GEOPDSSearchAutoRedoThreshold

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSSearchAutoRedoThreshold;
  -[GEOPDSSearchAutoRedoThreshold description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSSearchAutoRedoThreshold dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSearchAutoRedoThreshold _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v11;
  id v12;
  id v13;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 44);
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("numberOfVisiblePoisThreshold");
    else
      v16 = CFSTR("number_of_visible_pois_threshold");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_BYTE *)(a1 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0)
        goto LABEL_5;
LABEL_24:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v20 = CFSTR("zoomInPercentThreshold");
      else
        v20 = CFSTR("zoom_in_percent_threshold");
      objc_msgSend(v4, "setObject:forKey:", v19, v20);

      if ((*(_BYTE *)(a1 + 44) & 1) == 0)
        goto LABEL_10;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)(a1 + 44) & 4) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("zoomOutPercentThreshold");
  else
    v18 = CFSTR("zoom_out_percent_threshold");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v5 = *(_BYTE *)(a1 + 44);
  if ((v5 & 2) != 0)
    goto LABEL_24;
LABEL_5:
  if ((v5 & 1) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("panDeltaThresholdInMeters");
    else
      v7 = CFSTR("pan_delta_threshold_in_meters");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_10:
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __59__GEOPDSSearchAutoRedoThreshold__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v12 = v11;
      v22 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v21);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSSearchAutoRedoThreshold _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOPDSSearchAutoRedoThreshold__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;

  v5 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("numberOfVisiblePoisThreshold");
      else
        v6 = CFSTR("number_of_visible_pois_threshold");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend(v7, "unsignedIntValue");
        *(_BYTE *)(a1 + 44) |= 8u;
        *(_DWORD *)(a1 + 40) = v8;
      }

      if (a3)
        v9 = CFSTR("zoomOutPercentThreshold");
      else
        v9 = CFSTR("zoom_out_percent_threshold");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "doubleValue");
        *(_BYTE *)(a1 + 44) |= 4u;
        *(_QWORD *)(a1 + 32) = v11;
      }

      if (a3)
        v12 = CFSTR("zoomInPercentThreshold");
      else
        v12 = CFSTR("zoom_in_percent_threshold");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "doubleValue");
        *(_BYTE *)(a1 + 44) |= 2u;
        *(_QWORD *)(a1 + 24) = v14;
      }

      if (a3)
        v15 = CFSTR("panDeltaThresholdInMeters");
      else
        v15 = CFSTR("pan_delta_threshold_in_meters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v16, "doubleValue");
        *(_BYTE *)(a1 + 44) |= 1u;
        *(_QWORD *)(a1 + 16) = v17;
      }

    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSearchAutoRedoThresholdReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 1) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField();
LABEL_6:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v4 + 40) = self->_numberOfVisiblePoisThreshold;
    *(_BYTE *)(v4 + 44) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(double *)(v4 + 24) = self->_zoomInPercentThreshold;
      *(_BYTE *)(v4 + 44) |= 2u;
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 32) = self->_zoomOutPercentThreshold;
  *(_BYTE *)(v4 + 44) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 1) != 0)
  {
LABEL_5:
    *(double *)(v4 + 16) = self->_panDeltaThresholdInMeters;
    *(_BYTE *)(v4 + 44) |= 1u;
  }
LABEL_6:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_numberOfVisiblePoisThreshold != *((_DWORD *)v4 + 10))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_zoomOutPercentThreshold != *((double *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_zoomInPercentThreshold != *((double *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_panDeltaThresholdInMeters != *((double *)v4 + 2))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  uint64_t v4;
  double zoomOutPercentThreshold;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double zoomInPercentThreshold;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double panDeltaThresholdInMeters;
  double v17;
  long double v18;
  double v19;

  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v4 = 2654435761 * self->_numberOfVisiblePoisThreshold;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_8;
LABEL_3:
  zoomOutPercentThreshold = self->_zoomOutPercentThreshold;
  v6 = -zoomOutPercentThreshold;
  if (zoomOutPercentThreshold >= 0.0)
    v6 = self->_zoomOutPercentThreshold;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((flags & 2) != 0)
  {
    zoomInPercentThreshold = self->_zoomInPercentThreshold;
    v12 = -zoomInPercentThreshold;
    if (zoomInPercentThreshold >= 0.0)
      v12 = self->_zoomInPercentThreshold;
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
    panDeltaThresholdInMeters = self->_panDeltaThresholdInMeters;
    v17 = -panDeltaThresholdInMeters;
    if (panDeltaThresholdInMeters >= 0.0)
      v17 = self->_panDeltaThresholdInMeters;
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
  return v9 ^ v4 ^ v10 ^ v15;
}

- (void)mergeFrom:(uint64_t)a1
{
  _BYTE *v3;
  char v4;

  v3 = a2;
  if (!a1)
    goto LABEL_7;
  v4 = v3[44];
  if ((v4 & 8) != 0)
  {
    *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 10);
    *(_BYTE *)(a1 + 44) |= 8u;
    v4 = v3[44];
    if ((v4 & 4) == 0)
    {
LABEL_4:
      if ((v4 & 2) == 0)
        goto LABEL_5;
LABEL_10:
      *(_QWORD *)(a1 + 24) = *((_QWORD *)v3 + 3);
      *(_BYTE *)(a1 + 44) |= 2u;
      if ((v3[44] & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((v3[44] & 4) == 0)
  {
    goto LABEL_4;
  }
  *(_QWORD *)(a1 + 32) = *((_QWORD *)v3 + 4);
  *(_BYTE *)(a1 + 44) |= 4u;
  v4 = v3[44];
  if ((v4 & 2) != 0)
    goto LABEL_10;
LABEL_5:
  if ((v4 & 1) != 0)
  {
LABEL_6:
    *(_QWORD *)(a1 + 16) = *((_QWORD *)v3 + 2);
    *(_BYTE *)(a1 + 44) |= 1u;
  }
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
