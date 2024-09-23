@implementation GEORPNavigationSettings

- (unint64_t)voiceVolume
{
  return self->_voiceVolume;
}

- (void)setVoiceVolume:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_voiceVolume = a3;
}

- (void)setHasVoiceVolume:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasVoiceVolume
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unint64_t)distanceUnits
{
  return self->_distanceUnits;
}

- (void)setDistanceUnits:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_distanceUnits = a3;
}

- (void)setHasDistanceUnits:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasDistanceUnits
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)pauseSpokenAudio
{
  return self->_pauseSpokenAudio;
}

- (void)setPauseSpokenAudio:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_pauseSpokenAudio = a3;
}

- (void)setHasPauseSpokenAudio:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasPauseSpokenAudio
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (BOOL)muteSpeechOverride
{
  return self->_muteSpeechOverride;
}

- (void)setMuteSpeechOverride:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_muteSpeechOverride = a3;
}

- (void)setHasMuteSpeechOverride:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasMuteSpeechOverride
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (BOOL)speechEnabled
{
  return self->_speechEnabled;
}

- (void)setSpeechEnabled:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_speechEnabled = a3;
}

- (void)setHasSpeechEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasSpeechEnabled
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (unint64_t)maxAlternateRouteCount
{
  return self->_maxAlternateRouteCount;
}

- (void)setMaxAlternateRouteCount:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_maxAlternateRouteCount = a3;
}

- (void)setHasMaxAlternateRouteCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasMaxAlternateRouteCount
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)beepBeforeInstruction
{
  return self->_beepBeforeInstruction;
}

- (void)setBeepBeforeInstruction:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_beepBeforeInstruction = a3;
}

- (void)setHasBeepBeforeInstruction:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasBeepBeforeInstruction
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)hasVoiceLanguage
{
  return self->_voiceLanguage != 0;
}

- (NSString)voiceLanguage
{
  return self->_voiceLanguage;
}

- (void)setVoiceLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_voiceLanguage, a3);
}

- (BOOL)shouldUseGuidanceEventManager
{
  return self->_shouldUseGuidanceEventManager;
}

- (void)setShouldUseGuidanceEventManager:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_shouldUseGuidanceEventManager = a3;
}

- (void)setHasShouldUseGuidanceEventManager:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasShouldUseGuidanceEventManager
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (int)userPreferredTransportType
{
  if ((*(_WORD *)&self->_flags & 8) != 0)
    return self->_userPreferredTransportType;
  else
    return 0;
}

- (void)setUserPreferredTransportType:(int)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_userPreferredTransportType = a3;
}

- (void)setHasUserPreferredTransportType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasUserPreferredTransportType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)userPreferredTransportTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C0EC28[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUserPreferredTransportType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_DRIVING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_TRANSIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_RIDESHARE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_CYCLING")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEORPNavigationSettings;
  -[GEORPNavigationSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPNavigationSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPNavigationSettings _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("voiceVolume");
    else
      v7 = CFSTR("voice_volume");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_WORD *)(a1 + 52);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("distanceUnits");
    else
      v18 = CFSTR("distance_units");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    v5 = *(_WORD *)(a1 + 52);
    if ((v5 & 0x40) == 0)
    {
LABEL_9:
      if ((v5 & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_38;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 46));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("pauseSpokenAudio");
  else
    v20 = CFSTR("pause_spoken_audio");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 45));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v22 = CFSTR("muteSpeechOverride");
  else
    v22 = CFSTR("mute_speech_override");
  objc_msgSend(v4, "setObject:forKey:", v21, v22);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0)
      goto LABEL_12;
LABEL_46:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("maxAlternateRouteCount");
    else
      v26 = CFSTR("max_alternate_route_count");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

    if ((*(_WORD *)(a1 + 52) & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_13;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v24 = CFSTR("speechEnabled");
  else
    v24 = CFSTR("speech_enabled");
  objc_msgSend(v4, "setObject:forKey:", v23, v24);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 2) != 0)
    goto LABEL_46;
LABEL_12:
  if ((v5 & 0x10) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 44));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("beepBeforeInstruction");
    else
      v9 = CFSTR("beep_before_instruction");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
LABEL_17:
  objc_msgSend((id)a1, "voiceLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("voiceLanguage");
    else
      v11 = CFSTR("voice_language");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  v12 = *(_WORD *)(a1 + 52);
  if ((v12 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 47));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("shouldUseGuidanceEventManager");
    else
      v14 = CFSTR("should_use_guidance_event_manager");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

    v12 = *(_WORD *)(a1 + 52);
  }
  if ((v12 & 8) != 0)
  {
    v15 = *(int *)(a1 + 40);
    if (v15 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 40));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E1C0EC28[v15];
    }
    if (a2)
      v27 = CFSTR("userPreferredTransportType");
    else
      v27 = CFSTR("user_preferred_transport_type");
    objc_msgSend(v4, "setObject:forKey:", v16, v27);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPNavigationSettings _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPNavigationSettings)initWithDictionary:(id)a3
{
  return (GEORPNavigationSettings *)-[GEORPNavigationSettings _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("voiceVolume");
      else
        v6 = CFSTR("voice_volume");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setVoiceVolume:", objc_msgSend(v7, "unsignedLongLongValue"));

      if (a3)
        v8 = CFSTR("distanceUnits");
      else
        v8 = CFSTR("distance_units");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDistanceUnits:", objc_msgSend(v9, "unsignedLongLongValue"));

      if (a3)
        v10 = CFSTR("pauseSpokenAudio");
      else
        v10 = CFSTR("pause_spoken_audio");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setPauseSpokenAudio:", objc_msgSend(v11, "BOOLValue"));

      if (a3)
        v12 = CFSTR("muteSpeechOverride");
      else
        v12 = CFSTR("mute_speech_override");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMuteSpeechOverride:", objc_msgSend(v13, "BOOLValue"));

      if (a3)
        v14 = CFSTR("speechEnabled");
      else
        v14 = CFSTR("speech_enabled");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSpeechEnabled:", objc_msgSend(v15, "BOOLValue"));

      if (a3)
        v16 = CFSTR("maxAlternateRouteCount");
      else
        v16 = CFSTR("max_alternate_route_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMaxAlternateRouteCount:", objc_msgSend(v17, "unsignedLongLongValue"));

      if (a3)
        v18 = CFSTR("beepBeforeInstruction");
      else
        v18 = CFSTR("beep_before_instruction");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBeepBeforeInstruction:", objc_msgSend(v19, "BOOLValue"));

      if (a3)
        v20 = CFSTR("voiceLanguage");
      else
        v20 = CFSTR("voice_language");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = (void *)objc_msgSend(v21, "copy");
        objc_msgSend(a1, "setVoiceLanguage:", v22);

      }
      if (a3)
        v23 = CFSTR("shouldUseGuidanceEventManager");
      else
        v23 = CFSTR("should_use_guidance_event_manager");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setShouldUseGuidanceEventManager:", objc_msgSend(v24, "BOOLValue"));

      if (a3)
        v25 = CFSTR("userPreferredTransportType");
      else
        v25 = CFSTR("user_preferred_transport_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = v26;
        if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_NONE")) & 1) != 0)
        {
          v28 = 0;
        }
        else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_DRIVING")) & 1) != 0)
        {
          v28 = 1;
        }
        else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_WALKING")) & 1) != 0)
        {
          v28 = 2;
        }
        else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_TRANSIT")) & 1) != 0)
        {
          v28 = 3;
        }
        else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_RIDESHARE")) & 1) != 0)
        {
          v28 = 4;
        }
        else if (objc_msgSend(v27, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_CYCLING")))
        {
          v28 = 5;
        }
        else
        {
          v28 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_69:

          goto LABEL_70;
        }
        v28 = objc_msgSend(v26, "intValue");
      }
      objc_msgSend(a1, "setUserPreferredTransportType:", v28);
      goto LABEL_69;
    }
  }
LABEL_70:

  return a1;
}

- (GEORPNavigationSettings)initWithJSON:(id)a3
{
  return (GEORPNavigationSettings *)-[GEORPNavigationSettings _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPNavigationSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPNavigationSettingsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  __int16 flags;
  __int16 v5;
  id v6;

  v6 = a3;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  if (self->_voiceLanguage)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_flags;
  if ((v5 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (__int16)self->_flags;
  }
  if ((v5 & 8) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  __int16 flags;
  __int16 v6;
  _QWORD *v7;

  v7 = a3;
  -[GEORPNavigationSettings readAll:](self, "readAll:", 0);
  v4 = v7;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v7[4] = self->_voiceVolume;
    *((_WORD *)v7 + 26) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v7[1] = self->_distanceUnits;
  *((_WORD *)v7 + 26) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)v7 + 46) = self->_pauseSpokenAudio;
  *((_WORD *)v7 + 26) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)v7 + 45) = self->_muteSpeechOverride;
  *((_WORD *)v7 + 26) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)v7 + 48) = self->_speechEnabled;
  *((_WORD *)v7 + 26) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_21:
  v7[2] = self->_maxAlternateRouteCount;
  *((_WORD *)v7 + 26) |= 2u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    *((_BYTE *)v7 + 44) = self->_beepBeforeInstruction;
    *((_WORD *)v7 + 26) |= 0x10u;
  }
LABEL_9:
  if (self->_voiceLanguage)
  {
    objc_msgSend(v7, "setVoiceLanguage:");
    v4 = v7;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 0x80) != 0)
  {
    v4[47] = self->_shouldUseGuidanceEventManager;
    *((_WORD *)v4 + 26) |= 0x80u;
    v6 = (__int16)self->_flags;
  }
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_userPreferredTransportType;
    *((_WORD *)v4 + 26) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 flags;
  uint64_t v8;
  void *v9;
  __int16 v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_voiceVolume;
    *(_WORD *)(v5 + 52) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 8) = self->_distanceUnits;
  *(_WORD *)(v5 + 52) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *(_BYTE *)(v5 + 46) = self->_pauseSpokenAudio;
  *(_WORD *)(v5 + 52) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *(_BYTE *)(v5 + 45) = self->_muteSpeechOverride;
  *(_WORD *)(v5 + 52) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *(_BYTE *)(v5 + 48) = self->_speechEnabled;
  *(_WORD *)(v5 + 52) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_19:
  *(_QWORD *)(v5 + 16) = self->_maxAlternateRouteCount;
  *(_WORD *)(v5 + 52) |= 2u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 44) = self->_beepBeforeInstruction;
    *(_WORD *)(v5 + 52) |= 0x10u;
  }
LABEL_9:
  v8 = -[NSString copyWithZone:](self->_voiceLanguage, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  v10 = (__int16)self->_flags;
  if ((v10 & 0x80) != 0)
  {
    *(_BYTE *)(v6 + 47) = self->_shouldUseGuidanceEventManager;
    *(_WORD *)(v6 + 52) |= 0x80u;
    v10 = (__int16)self->_flags;
  }
  if ((v10 & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_userPreferredTransportType;
    *(_WORD *)(v6 + 52) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSString *voiceLanguage;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_65;
  -[GEORPNavigationSettings readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 26);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_voiceVolume != *((_QWORD *)v4 + 4))
      goto LABEL_65;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_distanceUnits != *((_QWORD *)v4 + 1))
      goto LABEL_65;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0)
      goto LABEL_65;
    if (self->_pauseSpokenAudio)
    {
      if (!*((_BYTE *)v4 + 46))
        goto LABEL_65;
    }
    else if (*((_BYTE *)v4 + 46))
    {
      goto LABEL_65;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0)
      goto LABEL_65;
    if (self->_muteSpeechOverride)
    {
      if (!*((_BYTE *)v4 + 45))
        goto LABEL_65;
    }
    else if (*((_BYTE *)v4 + 45))
    {
      goto LABEL_65;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0)
      goto LABEL_65;
    if (self->_speechEnabled)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_65;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_maxAlternateRouteCount != *((_QWORD *)v4 + 2))
      goto LABEL_65;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0)
      goto LABEL_65;
    if (self->_beepBeforeInstruction)
    {
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_65;
    }
    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_65;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  voiceLanguage = self->_voiceLanguage;
  if ((unint64_t)voiceLanguage | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](voiceLanguage, "isEqual:"))
      goto LABEL_65;
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 26);
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_shouldUseGuidanceEventManager)
      {
        if (!*((_BYTE *)v4 + 47))
          goto LABEL_65;
        goto LABEL_60;
      }
      if (!*((_BYTE *)v4 + 47))
        goto LABEL_60;
    }
LABEL_65:
    v8 = 0;
    goto LABEL_66;
  }
  if ((v6 & 0x80) != 0)
    goto LABEL_65;
LABEL_60:
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_userPreferredTransportType != *((_DWORD *)v4 + 10))
      goto LABEL_65;
    v8 = 1;
  }
  else
  {
    v8 = (v6 & 8) == 0;
  }
LABEL_66:

  return v8;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  -[GEORPNavigationSettings readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v4 = 2654435761u * self->_voiceVolume;
    if ((flags & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_distanceUnits;
      if ((flags & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v4 = 0;
    if ((flags & 1) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_pauseSpokenAudio;
    if ((flags & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v6 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_muteSpeechOverride;
    if ((*(_WORD *)&self->_flags & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v7 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_speechEnabled;
    if ((flags & 2) != 0)
      goto LABEL_7;
LABEL_14:
    v9 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v8 = 0;
  if ((flags & 2) == 0)
    goto LABEL_14;
LABEL_7:
  v9 = 2654435761u * self->_maxAlternateRouteCount;
  if ((flags & 0x10) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_beepBeforeInstruction;
    goto LABEL_16;
  }
LABEL_15:
  v10 = 0;
LABEL_16:
  v11 = -[NSString hash](self->_voiceLanguage, "hash");
  v12 = (__int16)self->_flags;
  if ((v12 & 0x80) != 0)
  {
    v13 = 2654435761 * self->_shouldUseGuidanceEventManager;
    if ((v12 & 8) != 0)
      goto LABEL_18;
LABEL_20:
    v14 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v11;
  }
  v13 = 0;
  if ((v12 & 8) == 0)
    goto LABEL_20;
LABEL_18:
  v14 = 2654435761 * self->_userPreferredTransportType;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  v5 = *((_WORD *)v7 + 26);
  if ((v5 & 4) != 0)
  {
    self->_voiceVolume = *((_QWORD *)v7 + 4);
    *(_WORD *)&self->_flags |= 4u;
    v5 = *((_WORD *)v7 + 26);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_distanceUnits = *((_QWORD *)v7 + 1);
  *(_WORD *)&self->_flags |= 1u;
  v5 = *((_WORD *)v7 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_pauseSpokenAudio = *((_BYTE *)v7 + 46);
  *(_WORD *)&self->_flags |= 0x40u;
  v5 = *((_WORD *)v7 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_muteSpeechOverride = *((_BYTE *)v7 + 45);
  *(_WORD *)&self->_flags |= 0x20u;
  v5 = *((_WORD *)v7 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_speechEnabled = *((_BYTE *)v7 + 48);
  *(_WORD *)&self->_flags |= 0x100u;
  v5 = *((_WORD *)v7 + 26);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_21:
  self->_maxAlternateRouteCount = *((_QWORD *)v7 + 2);
  *(_WORD *)&self->_flags |= 2u;
  if ((*((_WORD *)v7 + 26) & 0x10) != 0)
  {
LABEL_8:
    self->_beepBeforeInstruction = *((_BYTE *)v7 + 44);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_9:
  if (*((_QWORD *)v7 + 3))
  {
    -[GEORPNavigationSettings setVoiceLanguage:](self, "setVoiceLanguage:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 26);
  if ((v6 & 0x80) != 0)
  {
    self->_shouldUseGuidanceEventManager = *((_BYTE *)v4 + 47);
    *(_WORD *)&self->_flags |= 0x80u;
    v6 = *((_WORD *)v4 + 26);
  }
  if ((v6 & 8) != 0)
  {
    self->_userPreferredTransportType = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_flags |= 8u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceLanguage, 0);
}

@end
