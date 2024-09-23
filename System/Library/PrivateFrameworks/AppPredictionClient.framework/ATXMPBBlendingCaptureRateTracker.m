@implementation ATXMPBBlendingCaptureRateTracker

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (void)setCaptured:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_captured = a3;
}

- (void)setHasCaptured:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCaptured
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)captureType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_captureType;
  else
    return 1;
}

- (void)setCaptureType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_captureType = a3;
}

- (void)setHasCaptureType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaptureType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)captureTypeAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 4999)
  {
    switch(a3)
    {
      case 5000:
        result = CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreen");
        break;
      case 5001:
        result = CFSTR("HomeScreenDiverted_AppLaunchedFromShortcutExecution");
        break;
      case 5002:
        result = CFSTR("HomeScreenDiverted_AppLaunchedFromWidgetTap");
        break;
      case 5003:
        result = CFSTR("HomeScreenDiverted_AppLaunchedFromSuggestionsWidget");
        break;
      case 5004:
        result = CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenDock");
        break;
      case 5005:
        result = CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenSamePage");
        break;
      case 5006:
        result = CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenSamePageFolder");
        break;
      case 5007:
        result = CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenDiffPage");
        break;
      case 5008:
        result = CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenDiffPageFolder");
        break;
      default:
        goto LABEL_23;
    }
  }
  else if (a3 <= 2999)
  {
    if (a3 <= 1999)
    {
      if (a3 == 1)
        return CFSTR("Captured");
      if (a3 == 1000)
        return CFSTR("Diverted");
    }
    else
    {
      switch(a3)
      {
        case 2000:
          return CFSTR("SpotlightDiverted_AppLaunchedFromShortcutExecution");
        case 2001:
          return CFSTR("SpotlightDiverted_AppLaunchedFromSearch");
        case 2002:
          return CFSTR("SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp");
      }
    }
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  else
  {
    switch(a3)
    {
      case 4000:
        v3 = CFSTR("AppLibraryDiverted_AppLaunchedFromSearch");
        return v3;
      case 4001:
        return CFSTR("AppLibraryDiverted_AppLaunchedFromCategoryPreview");
      case 4002:
        return CFSTR("AppLibraryDiverted_AppLaunchedFromExpandedCategory");
      case 4003:
        return CFSTR("AppLibraryDiverted_AppLaunchedFromRecents");
      case 4004:
        return CFSTR("AppLibraryDiverted_AppLaunchedFromSearch_Deduped");
      case 4005:
        return CFSTR("AppLibraryDiverted_AppLaunchedFromCategoryPreview_Deduped");
      case 4006:
        return CFSTR("AppLibraryDiverted_AppLaunchedFromExpandedCategory_Deduped");
      case 4007:
        return CFSTR("AppLibraryDiverted_AppLaunchedFromRecents_Deduped");
      default:
        if (a3 == 3000)
        {
          result = CFSTR("SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch");
        }
        else
        {
          if (a3 != 3001)
            goto LABEL_23;
          result = CFSTR("SpotlightDiverted_ActionExecutedFromSearch");
        }
        break;
    }
  }
  return result;
}

- (int)StringAsCaptureType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Captured")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Diverted")) & 1) != 0)
  {
    v4 = 1000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SpotlightDiverted_AppLaunchedFromShortcutExecution")) & 1) != 0)
  {
    v4 = 2000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SpotlightDiverted_AppLaunchedFromSearch")) & 1) != 0)
  {
    v4 = 2001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp")) & 1) != 0)
  {
    v4 = 2002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch")) & 1) != 0)
  {
    v4 = 3000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SpotlightDiverted_ActionExecutedFromSearch")) & 1) != 0)
  {
    v4 = 3001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLibraryDiverted_AppLaunchedFromSearch")) & 1) != 0)
  {
    v4 = 4000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLibraryDiverted_AppLaunchedFromCategoryPreview")) & 1) != 0)
  {
    v4 = 4001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLibraryDiverted_AppLaunchedFromExpandedCategory")) & 1) != 0)
  {
    v4 = 4002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLibraryDiverted_AppLaunchedFromRecents")) & 1) != 0)
  {
    v4 = 4003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLibraryDiverted_AppLaunchedFromSearch_Deduped")) & 1) != 0)
  {
    v4 = 4004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLibraryDiverted_AppLaunchedFromCategoryPreview_Deduped")) & 1) != 0)
  {
    v4 = 4005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLibraryDiverted_AppLaunchedFromExpandedCategory_Deduped")) & 1) != 0)
  {
    v4 = 4006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLibraryDiverted_AppLaunchedFromRecents_Deduped")) & 1) != 0)
  {
    v4 = 4007;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreen")) & 1) != 0)
  {
    v4 = 5000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenDiverted_AppLaunchedFromShortcutExecution")) & 1) != 0)
  {
    v4 = 5001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenDiverted_AppLaunchedFromWidgetTap")) & 1) != 0)
  {
    v4 = 5002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenDiverted_AppLaunchedFromSuggestionsWidget")) & 1) != 0)
  {
    v4 = 5003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenDock")) & 1) != 0)
  {
    v4 = 5004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenSamePage")) & 1) != 0)
  {
    v4 = 5005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenSamePageFolder")) & 1) != 0)
  {
    v4 = 5006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenDiffPage")) & 1) != 0)
  {
    v4 = 5007;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenDiffPageFolder")))
  {
    v4 = 5008;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasExecutableType
{
  return self->_executableType != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
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
  v8.super_class = (Class)ATXMPBBlendingCaptureRateTracker;
  -[ATXMPBBlendingCaptureRateTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBBlendingCaptureRateTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *consumerSubType;
  char has;
  void *v7;
  int captureType;
  __CFString *v9;
  NSString *executableType;
  NSString *abGroup;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v3, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captured);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("captured"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    captureType = self->_captureType;
    if (captureType > 4999)
    {
      switch(captureType)
      {
        case 5000:
          v9 = CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreen");
          break;
        case 5001:
          v9 = CFSTR("HomeScreenDiverted_AppLaunchedFromShortcutExecution");
          break;
        case 5002:
          v9 = CFSTR("HomeScreenDiverted_AppLaunchedFromWidgetTap");
          break;
        case 5003:
          v9 = CFSTR("HomeScreenDiverted_AppLaunchedFromSuggestionsWidget");
          break;
        case 5004:
          v9 = CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenDock");
          break;
        case 5005:
          v9 = CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenSamePage");
          break;
        case 5006:
          v9 = CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenSamePageFolder");
          break;
        case 5007:
          v9 = CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenDiffPage");
          break;
        case 5008:
          v9 = CFSTR("HomeScreenDiverted_AppLaunchedFromHomeScreenDiffPageFolder");
          break;
        default:
          goto LABEL_26;
      }
      goto LABEL_43;
    }
    if (captureType > 2999)
    {
      switch(captureType)
      {
        case 4000:
          v9 = CFSTR("AppLibraryDiverted_AppLaunchedFromSearch");
          break;
        case 4001:
          v9 = CFSTR("AppLibraryDiverted_AppLaunchedFromCategoryPreview");
          break;
        case 4002:
          v9 = CFSTR("AppLibraryDiverted_AppLaunchedFromExpandedCategory");
          break;
        case 4003:
          v9 = CFSTR("AppLibraryDiverted_AppLaunchedFromRecents");
          break;
        case 4004:
          v9 = CFSTR("AppLibraryDiverted_AppLaunchedFromSearch_Deduped");
          break;
        case 4005:
          v9 = CFSTR("AppLibraryDiverted_AppLaunchedFromCategoryPreview_Deduped");
          break;
        case 4006:
          v9 = CFSTR("AppLibraryDiverted_AppLaunchedFromExpandedCategory_Deduped");
          break;
        case 4007:
          v9 = CFSTR("AppLibraryDiverted_AppLaunchedFromRecents_Deduped");
          break;
        default:
          if (captureType == 3000)
          {
            v9 = CFSTR("SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch");
          }
          else
          {
            if (captureType != 3001)
              goto LABEL_26;
            v9 = CFSTR("SpotlightDiverted_ActionExecutedFromSearch");
          }
          break;
      }
      goto LABEL_43;
    }
    if (captureType <= 1999)
    {
      if (captureType == 1)
      {
        v9 = CFSTR("Captured");
        goto LABEL_43;
      }
      if (captureType == 1000)
      {
        v9 = CFSTR("Diverted");
        goto LABEL_43;
      }
    }
    else
    {
      switch(captureType)
      {
        case 2000:
          v9 = CFSTR("SpotlightDiverted_AppLaunchedFromShortcutExecution");
          goto LABEL_43;
        case 2001:
          v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearch");
          goto LABEL_43;
        case 2002:
          v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp");
LABEL_43:
          objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("captureType"));

          goto LABEL_44;
      }
    }
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_captureType);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
LABEL_44:
  executableType = self->_executableType;
  if (executableType)
    objc_msgSend(v4, "setObject:forKey:", executableType, CFSTR("executableType"));
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v4, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingCaptureRateTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_executableType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_consumerSubType)
  {
    objc_msgSend(v4, "setConsumerSubType:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_captured;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_captureType;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  if (self->_executableType)
  {
    objc_msgSend(v6, "setExecutableType:");
    v4 = v6;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v6, "setAbGroup:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_captured;
    *(_BYTE *)(v5 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_captureType;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_executableType, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *consumerSubType;
  NSString *executableType;
  NSString *abGroup;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](consumerSubType, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_captured)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_21;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_12;
    }
LABEL_21:
    v8 = 0;
    goto LABEL_22;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_21;
LABEL_12:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_captureType != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_21;
  }
  executableType = self->_executableType;
  if ((unint64_t)executableType | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](executableType, "isEqual:"))
  {
    goto LABEL_21;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1))
    v8 = -[NSString isEqual:](abGroup, "isEqual:");
  else
    v8 = 1;
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_consumerSubType, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_captured;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_captureType;
LABEL_6:
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_executableType, "hash");
  return v6 ^ -[NSString hash](self->_abGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXMPBBlendingCaptureRateTracker setConsumerSubType:](self, "setConsumerSubType:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_captured = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 1) != 0)
  {
    self->_captureType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXMPBBlendingCaptureRateTracker setExecutableType:](self, "setExecutableType:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBBlendingCaptureRateTracker setAbGroup:](self, "setAbGroup:");
    v4 = v6;
  }

}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
}

- (BOOL)captured
{
  return self->_captured;
}

- (NSString)executableType
{
  return self->_executableType;
}

- (void)setExecutableType:(id)a3
{
  objc_storeStrong((id *)&self->_executableType, a3);
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableType, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
