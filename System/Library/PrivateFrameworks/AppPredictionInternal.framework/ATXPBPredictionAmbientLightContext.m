@implementation ATXPBPredictionAmbientLightContext

- (int)ambientLightType
{
  return self->_ambientLightType;
}

- (void)setAmbientLightType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ambientLightType = a3;
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)setHasAmbientLightType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAmbientLightType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)ambientLightTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_1E82DDAB8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAmbientLightType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeDark")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeIndoorDark")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeOutdoorDark")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeIndoorArtificialLight")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeIndoorBrightArtificialLight")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeOutdoor")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeOutdoorDirectSun")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeUnknown")))
  {
    v4 = 7;
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
  v8.super_class = (Class)ATXPBPredictionAmbientLightContext;
  -[ATXPBPredictionAmbientLightContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBPredictionAmbientLightContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t ambientLightType;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    ambientLightType = self->_ambientLightType;
    if (ambientLightType >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ambientLightType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E82DDAB8[ambientLightType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ambientLightType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPredictionAmbientLightContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_ambientLightType;
    *((_BYTE *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_ambientLightType;
    *((_BYTE *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  v5 = (*((_BYTE *)v4 + 12) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 12) & 1) != 0 && self->_ambientLightType == *((_DWORD *)v4 + 2))
    {
      v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_ambientLightType;
  else
    return 0;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    self->_ambientLightType = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

@end
