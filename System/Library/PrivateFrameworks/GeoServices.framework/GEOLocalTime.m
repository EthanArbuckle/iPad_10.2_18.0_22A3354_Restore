@implementation GEOLocalTime

- (GEOLocalTime)initWithDate:(id)a3
{
  id v4;
  GEOLocalTime *v5;
  double v6;
  CFAbsoluteTime v7;
  const __CFTimeZone *v8;
  double SecondsFromGMT;
  double v10;
  GEOLocalTime *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOLocalTime;
  v5 = -[GEOLocalTime init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v7 = v6;
    -[GEOLocalTime setTimeRoundedToHour:](v5, "setTimeRoundedToHour:", (unint64_t)(round(v6 / 3600.0) * 3600.0));
    v8 = CFTimeZoneCopySystem();
    SecondsFromGMT = CFTimeZoneGetSecondsFromGMT(v8, v7);
    if (v8)
      CFRelease(v8);
    v10 = SecondsFromGMT / 3600.0;
    *(float *)&v10 = SecondsFromGMT / 3600.0;
    -[GEOLocalTime setTimezoneOffsetFromGmtInHours:](v5, "setTimezoneOffsetFromGmtInHours:", v10);
    v11 = v5;
  }

  return v5;
}

- (GEOLocalTime)initWithCFAbsoluteTime:(double)a3
{
  GEOLocalTime *v4;
  GEOLocalTime *v5;
  const __CFTimeZone *v6;
  double SecondsFromGMT;
  double v8;
  GEOLocalTime *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GEOLocalTime;
  v4 = -[GEOLocalTime init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    -[GEOLocalTime setTimeRoundedToHour:](v4, "setTimeRoundedToHour:", (unint64_t)(round(a3 / 3600.0) * 3600.0));
    v6 = CFTimeZoneCopySystem();
    SecondsFromGMT = CFTimeZoneGetSecondsFromGMT(v6, a3);
    if (v6)
      CFRelease(v6);
    v8 = SecondsFromGMT / 3600.0;
    *(float *)&v8 = SecondsFromGMT / 3600.0;
    -[GEOLocalTime setTimezoneOffsetFromGmtInHours:](v5, "setTimezoneOffsetFromGmtInHours:", v8);
    v9 = v5;
  }

  return v5;
}

- (unint64_t)timeRoundedToHour
{
  return self->_timeRoundedToHour;
}

- (void)setTimeRoundedToHour:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_timeRoundedToHour = a3;
}

- (void)setHasTimeRoundedToHour:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTimeRoundedToHour
{
  return *(_BYTE *)&self->_flags & 1;
}

- (float)timezoneOffsetFromGmtInHours
{
  return self->_timezoneOffsetFromGmtInHours;
}

- (void)setTimezoneOffsetFromGmtInHours:(float)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_timezoneOffsetFromGmtInHours = a3;
}

- (void)setHasTimezoneOffsetFromGmtInHours:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTimezoneOffsetFromGmtInHours
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOLocalTime;
  -[GEOLocalTime description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLocalTime dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocalTime _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  double v5;
  char v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(a1 + 36);
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("timeRoundedToHour");
    else
      v8 = CFSTR("time_rounded_to_hour");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v6 = *(_BYTE *)(a1 + 36);
  }
  if ((v6 & 2) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("timezoneOffsetFromGmtInHours");
    else
      v10 = CFSTR("timezone_offset_from_gmt_in_hours");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  objc_msgSend((id)a1, "humanReadable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("humanReadable");
    else
      v12 = CFSTR("human_readable");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  v13 = *(void **)(a1 + 8);
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __42__GEOLocalTime__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLocalTime _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEOLocalTime__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLocalTime)initWithDictionary:(id)a3
{
  return (GEOLocalTime *)-[GEOLocalTime _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("timeRoundedToHour");
      else
        v6 = CFSTR("time_rounded_to_hour");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTimeRoundedToHour:", objc_msgSend(v7, "unsignedLongLongValue"));

      if (a3)
        v8 = CFSTR("timezoneOffsetFromGmtInHours");
      else
        v8 = CFSTR("timezone_offset_from_gmt_in_hours");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "floatValue");
        objc_msgSend(a1, "setTimezoneOffsetFromGmtInHours:");
      }

      if (a3)
        v10 = CFSTR("humanReadable");
      else
        v10 = CFSTR("human_readable");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(a1, "setHumanReadable:", v12);

      }
    }
  }

  return a1;
}

- (GEOLocalTime)initWithJSON:(id)a3
{
  return (GEOLocalTime *)-[GEOLocalTime _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocalTimeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocalTimeReadAllFrom((uint64_t)self, a3);
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
    PBDataWriterWriteUint64Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
  if (self->_humanReadable)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOLocalTime readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_QWORD *)v6 + 3) = self->_timeRoundedToHour;
    *((_BYTE *)v6 + 36) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 8) = LODWORD(self->_timezoneOffsetFromGmtInHours);
    *((_BYTE *)v6 + 36) |= 2u;
  }
  if (self->_humanReadable)
  {
    objc_msgSend(v6, "setHumanReadable:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timeRoundedToHour;
    *(_BYTE *)(v5 + 36) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 32) = self->_timezoneOffsetFromGmtInHours;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_humanReadable, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *humanReadable;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOLocalTime readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_timeRoundedToHour != *((_QWORD *)v4 + 3))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_timezoneOffsetFromGmtInHours != *((float *)v4 + 8))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_14;
  }
  humanReadable = self->_humanReadable;
  if ((unint64_t)humanReadable | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](humanReadable, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  float timezoneOffsetFromGmtInHours;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  -[GEOLocalTime readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761u * self->_timeRoundedToHour;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    return v8 ^ v3 ^ -[NSString hash](self->_humanReadable, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_3:
  timezoneOffsetFromGmtInHours = self->_timezoneOffsetFromGmtInHours;
  v5 = timezoneOffsetFromGmtInHours;
  if (timezoneOffsetFromGmtInHours < 0.0)
    v5 = -timezoneOffsetFromGmtInHours;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3 ^ -[NSString hash](self->_humanReadable, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  v5 = *((_BYTE *)v6 + 36);
  if ((v5 & 1) != 0)
  {
    self->_timeRoundedToHour = *((_QWORD *)v6 + 3);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v6 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_timezoneOffsetFromGmtInHours = *((float *)v6 + 8);
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v6 + 2))
  {
    -[GEOLocalTime setHumanReadable:](self, "setHumanReadable:");
    v4 = v6;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOLocalTime readAll:](self, "readAll:", 0);
}

- (BOOL)hasHumanReadable
{
  return self->_humanReadable != 0;
}

- (NSString)humanReadable
{
  return self->_humanReadable;
}

- (void)setHumanReadable:(id)a3
{
  objc_storeStrong((id *)&self->_humanReadable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanReadable, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
