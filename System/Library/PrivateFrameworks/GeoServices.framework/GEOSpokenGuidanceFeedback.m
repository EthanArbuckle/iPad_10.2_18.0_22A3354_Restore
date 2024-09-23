@implementation GEOSpokenGuidanceFeedback

- (int)spokenGuidanceIndex
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_spokenGuidanceIndex;
  else
    return -1;
}

- (void)setSpokenGuidanceIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_spokenGuidanceIndex = a3;
}

- (void)setHasSpokenGuidanceIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSpokenGuidanceIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)shortPrompt
{
  return self->_shortPrompt;
}

- (void)setShortPrompt:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_shortPrompt = a3;
}

- (void)setHasShortPrompt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasShortPrompt
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)hasTrafficCameraGuidanceFeedback
{
  return self->_trafficCameraGuidanceFeedback != 0;
}

- (GEOTrafficCameraInformation)trafficCameraGuidanceFeedback
{
  return self->_trafficCameraGuidanceFeedback;
}

- (void)setTrafficCameraGuidanceFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_trafficCameraGuidanceFeedback, a3);
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
  v8.super_class = (Class)GEOSpokenGuidanceFeedback;
  -[GEOSpokenGuidanceFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSpokenGuidanceFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSpokenGuidanceFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v11;
  void *v12;
  const __CFString *v13;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v7 = CFSTR("spokenGuidanceIndex");
      else
        v7 = CFSTR("spoken_guidance_index");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

      v5 = *(_BYTE *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("shortPrompt");
      else
        v9 = CFSTR("short_prompt");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

    }
    objc_msgSend((id)a1, "trafficCameraGuidanceFeedback");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v10, "jsonRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("trafficCameraGuidanceFeedback");
      }
      else
      {
        objc_msgSend(v10, "dictionaryRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("traffic_camera_guidance_feedback");
      }
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

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
  return -[GEOSpokenGuidanceFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSpokenGuidanceFeedback)initWithDictionary:(id)a3
{
  return (GEOSpokenGuidanceFeedback *)-[GEOSpokenGuidanceFeedback _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOTrafficCameraInformation *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("spokenGuidanceIndex");
      else
        v6 = CFSTR("spoken_guidance_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSpokenGuidanceIndex:", objc_msgSend(v7, "intValue"));

      if (a3)
        v8 = CFSTR("shortPrompt");
      else
        v8 = CFSTR("short_prompt");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setShortPrompt:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("trafficCameraGuidanceFeedback");
      else
        v10 = CFSTR("traffic_camera_guidance_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOTrafficCameraInformation alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOTrafficCameraInformation initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOTrafficCameraInformation initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setTrafficCameraGuidanceFeedback:", v13);

      }
    }
  }

  return a1;
}

- (GEOSpokenGuidanceFeedback)initWithJSON:(id)a3
{
  return (GEOSpokenGuidanceFeedback *)-[GEOSpokenGuidanceFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSpokenGuidanceFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSpokenGuidanceFeedbackReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_trafficCameraGuidanceFeedback)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOSpokenGuidanceFeedback readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_spokenGuidanceIndex;
    *((_BYTE *)v6 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v6 + 20) = self->_shortPrompt;
    *((_BYTE *)v6 + 24) |= 2u;
  }
  if (self->_trafficCameraGuidanceFeedback)
  {
    objc_msgSend(v6, "setTrafficCameraGuidanceFeedback:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char flags;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_spokenGuidanceIndex;
    *(_BYTE *)(v5 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 20) = self->_shortPrompt;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  v8 = -[GEOTrafficCameraInformation copyWithZone:](self->_trafficCameraGuidanceFeedback, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  GEOTrafficCameraInformation *trafficCameraGuidanceFeedback;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOSpokenGuidanceFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_spokenGuidanceIndex != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0)
      goto LABEL_17;
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  if ((*((_BYTE *)v4 + 24) & 2) == 0)
    goto LABEL_11;
  if (!self->_shortPrompt)
  {
    if (!*((_BYTE *)v4 + 20))
      goto LABEL_17;
    goto LABEL_11;
  }
  if (!*((_BYTE *)v4 + 20))
    goto LABEL_11;
LABEL_17:
  trafficCameraGuidanceFeedback = self->_trafficCameraGuidanceFeedback;
  if ((unint64_t)trafficCameraGuidanceFeedback | *((_QWORD *)v4 + 1))
    v5 = -[GEOTrafficCameraInformation isEqual:](trafficCameraGuidanceFeedback, "isEqual:");
  else
    v5 = 1;
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOSpokenGuidanceFeedback readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_spokenGuidanceIndex;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ -[GEOTrafficCameraInformation hash](self->_trafficCameraGuidanceFeedback, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_shortPrompt;
  return v4 ^ v3 ^ -[GEOTrafficCameraInformation hash](self->_trafficCameraGuidanceFeedback, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  char v5;
  GEOTrafficCameraInformation *trafficCameraGuidanceFeedback;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_BYTE *)v8 + 24);
  if ((v5 & 1) != 0)
  {
    self->_spokenGuidanceIndex = *((_DWORD *)v8 + 4);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v8 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_shortPrompt = *((_BYTE *)v8 + 20);
    *(_BYTE *)&self->_flags |= 2u;
  }
  trafficCameraGuidanceFeedback = self->_trafficCameraGuidanceFeedback;
  v7 = *((_QWORD *)v8 + 1);
  if (trafficCameraGuidanceFeedback)
  {
    if (v7)
    {
      -[GEOTrafficCameraInformation mergeFrom:](trafficCameraGuidanceFeedback, "mergeFrom:");
LABEL_10:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[GEOSpokenGuidanceFeedback setTrafficCameraGuidanceFeedback:](self, "setTrafficCameraGuidanceFeedback:");
    goto LABEL_10;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficCameraGuidanceFeedback, 0);
}

@end
