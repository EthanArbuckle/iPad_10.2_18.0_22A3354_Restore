@implementation ATXPBHomeScreenWidgetIdentifiable

- (BOOL)hasExtensionBundleId
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (BOOL)hasWidgetKind
{
  if (result)
    return *(_QWORD *)(result + 56) != 0;
  return result;
}

- (BOOL)hasAppBundleId
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

- (BOOL)hasIntent
{
  if (result)
    return *(_QWORD *)(result + 32) != 0;
  return result;
}

- (BOOL)hasWidgetUniqueId
{
  if (result)
    return *(_QWORD *)(result + 64) != 0;
  return result;
}

- (uint64_t)size
{
  if (result)
  {
    if ((*(_BYTE *)(result + 76) & 2) != 0)
      return *(unsigned int *)(result + 48);
    else
      return 1;
  }
  return result;
}

- (uint64_t)setSize:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 76) |= 2u;
    *(_DWORD *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)setHasSize:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 76) = *(_BYTE *)(result + 76) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasSize
{
  if (result)
    return (*(unsigned __int8 *)(result + 76) >> 1) & 1;
  return result;
}

- (__CFString)sizeAsString:(void *)a1
{
  if (a1)
  {
    if ((a2 - 1) < 5)
      return off_1E4D5C9D0[(int)a2 - 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)setSuggestedWidget:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 76) |= 8u;
    *(_BYTE *)(result + 73) = a2;
  }
  return result;
}

- (uint64_t)setHasSuggestedWidget:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 8;
    else
      v2 = 0;
    *(_BYTE *)(result + 76) = *(_BYTE *)(result + 76) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasSuggestedWidget
{
  if (result)
    return (*(unsigned __int8 *)(result + 76) >> 3) & 1;
  return result;
}

- (uint64_t)setOnboardingWidget:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 76) |= 4u;
    *(_BYTE *)(result + 72) = a2;
  }
  return result;
}

- (uint64_t)setHasOnboardingWidget:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(result + 76) = *(_BYTE *)(result + 76) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasOnboardingWidget
{
  if (result)
    return (*(unsigned __int8 *)(result + 76) >> 2) & 1;
  return result;
}

- (uint64_t)setScore:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 76) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasScore:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 76) = *(_BYTE *)(result + 76) & 0xFE | a2;
  return result;
}

- (uint64_t)hasScore
{
  if (result)
    return *(_BYTE *)(result + 76) & 1;
  return result;
}

- (BOOL)hasPredictionSource
{
  if (result)
    return *(_QWORD *)(result + 40) != 0;
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
  v8.super_class = (Class)ATXPBHomeScreenWidgetIdentifiable;
  -[ATXPBHomeScreenWidgetIdentifiable description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenWidgetIdentifiable dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *extensionBundleId;
  NSString *widgetKind;
  NSString *appBundleId;
  NSData *intent;
  NSString *widgetUniqueId;
  char has;
  unsigned int v11;
  __CFString *v12;
  void *v13;
  NSString *predictionSource;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  extensionBundleId = self->_extensionBundleId;
  if (extensionBundleId)
    objc_msgSend(v3, "setObject:forKey:", extensionBundleId, CFSTR("extensionBundleId"));
  widgetKind = self->_widgetKind;
  if (widgetKind)
    objc_msgSend(v4, "setObject:forKey:", widgetKind, CFSTR("widgetKind"));
  appBundleId = self->_appBundleId;
  if (appBundleId)
    objc_msgSend(v4, "setObject:forKey:", appBundleId, CFSTR("appBundleId"));
  intent = self->_intent;
  if (intent)
    objc_msgSend(v4, "setObject:forKey:", intent, CFSTR("intent"));
  widgetUniqueId = self->_widgetUniqueId;
  if (widgetUniqueId)
    objc_msgSend(v4, "setObject:forKey:", widgetUniqueId, CFSTR("widgetUniqueId"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = self->_size - 1;
    if (v11 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_size);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E4D5C9D0[v11];
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("size"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suggestedWidget);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("suggestedWidget"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_18:
      if ((has & 1) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onboardingWidget);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("onboardingWidget"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("score"));

  }
LABEL_20:
  predictionSource = self->_predictionSource;
  if (predictionSource)
    objc_msgSend(v4, "setObject:forKey:", predictionSource, CFSTR("predictionSource"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBHomeScreenWidgetIdentifiableReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_extensionBundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_widgetKind)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_appBundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_intent)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_widgetUniqueId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_14;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_15:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_16:
  if (self->_predictionSource)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v3 = a2;
  if (!a1)
    goto LABEL_19;
  v4 = *(void **)(a1 + 24);
  v11 = v3;
  if (v4)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setExtensionBundleId:]((uint64_t)v3, v4);
    v3 = v11;
  }
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setWidgetKind:]((uint64_t)v11, v5);
    v3 = v11;
  }
  v6 = *(void **)(a1 + 16);
  if (v6)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setAppBundleId:]((uint64_t)v11, v6);
    v3 = v11;
  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setIntent:]((uint64_t)v11, v7);
    v3 = v11;
  }
  v8 = *(void **)(a1 + 64);
  if (v8)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setWidgetUniqueId:]((uint64_t)v11, v8);
    v3 = v11;
  }
  v9 = *(_BYTE *)(a1 + 76);
  if ((v9 & 2) != 0)
  {
    *((_DWORD *)v3 + 12) = *(_DWORD *)(a1 + 48);
    *((_BYTE *)v3 + 76) |= 2u;
    v9 = *(_BYTE *)(a1 + 76);
    if ((v9 & 8) == 0)
    {
LABEL_14:
      if ((v9 & 4) == 0)
        goto LABEL_15;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)(a1 + 76) & 8) == 0)
  {
    goto LABEL_14;
  }
  *((_BYTE *)v3 + 73) = *(_BYTE *)(a1 + 73);
  *((_BYTE *)v3 + 76) |= 8u;
  v9 = *(_BYTE *)(a1 + 76);
  if ((v9 & 4) == 0)
  {
LABEL_15:
    if ((v9 & 1) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_22:
  *((_BYTE *)v3 + 72) = *(_BYTE *)(a1 + 72);
  *((_BYTE *)v3 + 76) |= 4u;
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
LABEL_16:
    *((_QWORD *)v3 + 1) = *(_QWORD *)(a1 + 8);
    *((_BYTE *)v3 + 76) |= 1u;
  }
LABEL_17:
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setPredictionSource:]((uint64_t)v11, v10);
    v3 = v11;
  }
LABEL_19:

}

- (void)setExtensionBundleId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setWidgetKind:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setAppBundleId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setIntent:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setWidgetUniqueId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)setPredictionSource:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char has;
  uint64_t v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_extensionBundleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_widgetKind, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSData copyWithZone:](self->_intent, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_widgetUniqueId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_size;
    *(_BYTE *)(v5 + 76) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *(_BYTE *)(v5 + 72) = self->_onboardingWidget;
      *(_BYTE *)(v5 + 76) |= 4u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 73) = self->_suggestedWidget;
  *(_BYTE *)(v5 + 76) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    *(double *)(v5 + 8) = self->_score;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
LABEL_6:
  v17 = -[NSString copyWithZone:](self->_predictionSource, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *extensionBundleId;
  NSString *widgetKind;
  NSString *appBundleId;
  NSData *intent;
  NSString *widgetUniqueId;
  NSString *predictionSource;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  extensionBundleId = self->_extensionBundleId;
  if ((unint64_t)extensionBundleId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](extensionBundleId, "isEqual:"))
      goto LABEL_40;
  }
  widgetKind = self->_widgetKind;
  if ((unint64_t)widgetKind | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](widgetKind, "isEqual:"))
      goto LABEL_40;
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:"))
      goto LABEL_40;
  }
  intent = self->_intent;
  if ((unint64_t)intent | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](intent, "isEqual:"))
      goto LABEL_40;
  }
  widgetUniqueId = self->_widgetUniqueId;
  if ((unint64_t)widgetUniqueId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](widgetUniqueId, "isEqual:"))
      goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_size != *((_DWORD *)v4 + 12))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) == 0)
      goto LABEL_40;
    if (self->_suggestedWidget)
    {
      if (!*((_BYTE *)v4 + 73))
        goto LABEL_40;
    }
    else if (*((_BYTE *)v4 + 73))
    {
      goto LABEL_40;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) != 0)
    {
      if (self->_onboardingWidget)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_40;
        goto LABEL_33;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_33;
    }
LABEL_40:
    v11 = 0;
    goto LABEL_41;
  }
  if ((*((_BYTE *)v4 + 76) & 4) != 0)
    goto LABEL_40;
LABEL_33:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_score != *((double *)v4 + 1))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_40;
  }
  predictionSource = self->_predictionSource;
  if ((unint64_t)predictionSource | *((_QWORD *)v4 + 5))
    v11 = -[NSString isEqual:](predictionSource, "isEqual:");
  else
    v11 = 1;
LABEL_41:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double score;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;

  v3 = -[NSString hash](self->_extensionBundleId, "hash");
  v4 = -[NSString hash](self->_widgetKind, "hash");
  v5 = -[NSString hash](self->_appBundleId, "hash");
  v6 = -[NSData hash](self->_intent, "hash");
  v7 = -[NSString hash](self->_widgetUniqueId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v8 = 2654435761 * self->_size;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v9 = 2654435761 * self->_suggestedWidget;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_11:
      v10 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_12:
      v15 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v15 ^ -[NSString hash](self->_predictionSource, "hash");
    }
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_4:
  v10 = 2654435761 * self->_onboardingWidget;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_5:
  score = self->_score;
  v12 = -score;
  if (score >= 0.0)
    v12 = self->_score;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v15 ^ -[NSString hash](self->_predictionSource, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD *v11;

  v3 = a2;
  if (!a1)
    goto LABEL_19;
  v4 = (void *)v3[3];
  v11 = v3;
  if (v4)
  {
    objc_storeStrong((id *)(a1 + 24), v4);
    v3 = v11;
  }
  v5 = (void *)v3[7];
  if (v5)
  {
    objc_storeStrong((id *)(a1 + 56), v5);
    v3 = v11;
  }
  v6 = (void *)v3[2];
  if (v6)
  {
    objc_storeStrong((id *)(a1 + 16), v6);
    v3 = v11;
  }
  v7 = (void *)v3[4];
  if (v7)
  {
    objc_storeStrong((id *)(a1 + 32), v7);
    v3 = v11;
  }
  v8 = (void *)v3[8];
  if (v8)
  {
    objc_storeStrong((id *)(a1 + 64), v8);
    v3 = v11;
  }
  v9 = *((_BYTE *)v3 + 76);
  if ((v9 & 2) != 0)
  {
    *(_DWORD *)(a1 + 48) = *((_DWORD *)v3 + 12);
    *(_BYTE *)(a1 + 76) |= 2u;
    v9 = *((_BYTE *)v3 + 76);
    if ((v9 & 8) == 0)
    {
LABEL_14:
      if ((v9 & 4) == 0)
        goto LABEL_15;
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v3 + 76) & 8) == 0)
  {
    goto LABEL_14;
  }
  *(_BYTE *)(a1 + 73) = *((_BYTE *)v3 + 73);
  *(_BYTE *)(a1 + 76) |= 8u;
  v9 = *((_BYTE *)v3 + 76);
  if ((v9 & 4) == 0)
  {
LABEL_15:
    if ((v9 & 1) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_22:
  *(_BYTE *)(a1 + 72) = *((_BYTE *)v3 + 72);
  *(_BYTE *)(a1 + 76) |= 4u;
  if ((*((_BYTE *)v3 + 76) & 1) != 0)
  {
LABEL_16:
    *(_QWORD *)(a1 + 8) = v3[1];
    *(_BYTE *)(a1 + 76) |= 1u;
  }
LABEL_17:
  v10 = (void *)v3[5];
  if (v10)
  {
    objc_storeStrong((id *)(a1 + 40), v10);
    v3 = v11;
  }
LABEL_19:

}

- (uint64_t)extensionBundleId
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)widgetKind
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)appBundleId
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)intent
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)widgetUniqueId
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (BOOL)suggestedWidget
{
  if (result)
    return *(_BYTE *)(result + 73) != 0;
  return result;
}

- (BOOL)onboardingWidget
{
  if (result)
    return *(_BYTE *)(result + 72) != 0;
  return result;
}

- (double)score
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (uint64_t)predictionSource
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_predictionSource, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end
