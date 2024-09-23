@implementation SGM2NLEventInBanner

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("NLEventInBanner");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)interface
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_interface;
  else
    return 0;
}

- (void)setInterface:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_interface = a3;
}

- (void)setHasInterface:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasInterface
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)interfaceAsString:(int)a3
{
  if (a3 < 0x14)
    return off_1E4760430[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsInterface:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceSuggestd")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceMail")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceMailBanner")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceMailDDLink")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceMessages")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceMessagesBanner")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceMessagesDDLink")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceCalendar")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceCalendarNotification")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceCalendarInbox")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceCalendarEventDetails")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceCalendarCanvas")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceCalendarWidget")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceCalendarWidgetUpNext")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceCalendarZKW")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceCalendarAutocomplete")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceMaps")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceMapsWidget")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceTTLNotification")) & 1) != 0)
  {
    v4 = 18;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventInterfaceSpotlight")))
  {
    v4 = 19;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)actionType
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_actionType;
  else
    return 0;
}

- (void)setActionType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_actionType = a3;
}

- (void)setHasActionType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasActionType
{
  return *(_WORD *)&self->_has & 1;
}

- (id)actionTypeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E47604D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventActionTypeDissected")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventActionTypeHarvested")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventActionTypeFiltered")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventActionTypeFound")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventActionTypeShown")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventActionTypeEngaged")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventActionTypeConfirmed")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventActionTypeRejected")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventActionTypeDismissed")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasEventType
{
  return self->_eventType != 0;
}

- (BOOL)hasLanguageID
{
  return self->_languageID != 0;
}

- (void)setDaysFromStartDate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_daysFromStartDate = a3;
}

- (void)setHasDaysFromStartDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDaysFromStartDate
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setConfidenceScore:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_confidenceScore = a3;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConfidenceScore
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (int)significantSender
{
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    return self->_significantSender;
  else
    return 0;
}

- (void)setSignificantSender:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_significantSender = a3;
}

- (void)setHasSignificantSender:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSignificantSender
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)significantSenderAsString:(int)a3
{
  if (a3 < 3)
    return off_1E4760518[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSignificantSender:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBoolOptionFalse")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBoolOptionTrue")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBoolOptionNA")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setParticipantCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_participantCount = a3;
}

- (void)setHasParticipantCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasParticipantCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (int)extractionLevel
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_extractionLevel;
  else
    return 0;
}

- (void)setExtractionLevel:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_extractionLevel = a3;
}

- (void)setHasExtractionLevel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasExtractionLevel
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)extractionLevelAsString:(int)a3
{
  if (a3 < 6)
    return off_1E4760530[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsExtractionLevel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventExtractionLevelNA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventExtractionLevelFullEvent")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventExtractionLevelTypeOnly")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventExtractionLevelNone")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventExtractionLevelFullEventWithTitleGeneration")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMNLEventExtractionLevelTypeOnlyWithTitleGeneration")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setUsedBubblesCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_usedBubblesCount = a3;
}

- (void)setHasUsedBubblesCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasUsedBubblesCount
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (int)titleSource
{
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
    return self->_titleSource;
  else
    return 0;
}

- (void)setTitleSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_titleSource = a3;
}

- (void)setHasTitleSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasTitleSource
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (id)titleSourceAsString:(int)a3
{
  if (a3 < 4)
    return off_1E4760560[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTitleSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventTitleSourceNA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventTitleSourceSubject")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventTitleSourceTemplate")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventTitleSourceMLModel")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)titleAdj
{
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
    return self->_titleAdj;
  else
    return 0;
}

- (void)setTitleAdj:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_titleAdj = a3;
}

- (void)setHasTitleAdj:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTitleAdj
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (id)titleAdjAsString:(int)a3
{
  if (a3 < 5)
    return off_1E4760580[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTitleAdj:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventStringAdjNA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventStringAdjConfirmed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventStringAdjPrefixAdded")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventStringAdjSuffixAdded")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventStringAdjReplaced")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)dateAdj
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_dateAdj;
  else
    return 0;
}

- (void)setDateAdj:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_dateAdj = a3;
}

- (void)setHasDateAdj:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDateAdj
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)dateAdjAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E47605A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDateAdj:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDateAdjNA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDateAdjConfirmed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDateAdjChangedDay")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDateAdjSubTime2hPlus")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDateAdjSubTime2h")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDateAdjSubTime1h")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDateAdjAddTime1h")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDateAdjAddTime2h")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDateAdjAddTime2hPlus")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDateAdjChangedDayAndTime")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)duraAdj
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_duraAdj;
  else
    return 0;
}

- (void)setDuraAdj:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_duraAdj = a3;
}

- (void)setHasDuraAdj:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDuraAdj
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)duraAdjAsString:(int)a3
{
  if (a3 < 6)
    return off_1E47605F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDuraAdj:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDurationAdjNA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDurationAdjConfirmed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDurationAdjLessThan30Min")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDurationAdj30To60Min")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDurationAdj1To2Hours")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventDurationAdjMoreThan2Hours")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)locationAdj
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_locationAdj;
  else
    return 0;
}

- (void)setLocationAdj:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_locationAdj = a3;
}

- (void)setHasLocationAdj:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLocationAdj
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)locationAdjAsString:(int)a3
{
  if (a3 < 5)
    return off_1E4760628[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLocationAdj:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventLocationAdjNA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventLocationAdjConfirmed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventLocationAdjModified")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventLocationAdjAdded")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMEventLocationAdjRemoved")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAddedAttendeesCount
{
  return self->_addedAttendeesCount != 0;
}

- (BOOL)hasCalendarAppUsageLevel
{
  return self->_calendarAppUsageLevel != 0;
}

- (int)mailAppUsageLevel
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_mailAppUsageLevel;
  else
    return 0;
}

- (void)setMailAppUsageLevel:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_mailAppUsageLevel = a3;
}

- (void)setHasMailAppUsageLevel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMailAppUsageLevel
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)mailAppUsageLevelAsString:(int)a3
{
  if (a3 < 4)
    return off_1E4760650[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMailAppUsageLevel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMAppUsageLevelNA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMAppUsageLevelLow")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMAppUsageLevelMedium")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMAppUsageLevelHigh")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)messagesAppUsageLevel
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_messagesAppUsageLevel;
  else
    return 0;
}

- (void)setMessagesAppUsageLevel:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_messagesAppUsageLevel = a3;
}

- (void)setHasMessagesAppUsageLevel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMessagesAppUsageLevel
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)messagesAppUsageLevelAsString:(int)a3
{
  if (a3 < 4)
    return off_1E4760650[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMessagesAppUsageLevel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMAppUsageLevelNA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMAppUsageLevelLow")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMAppUsageLevelMedium")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMAppUsageLevelHigh")))
  {
    v4 = 3;
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
  v8.super_class = (Class)SGM2NLEventInBanner;
  -[SGM2NLEventInBanner description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2NLEventInBanner dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  __int16 has;
  uint64_t interface;
  __CFString *v8;
  uint64_t actionType;
  __CFString *v10;
  NSString *eventType;
  NSString *languageID;
  __int16 v13;
  void *v14;
  void *v15;
  uint64_t significantSender;
  __CFString *v17;
  void *v18;
  uint64_t extractionLevel;
  __CFString *v20;
  void *v21;
  uint64_t titleSource;
  __CFString *v23;
  uint64_t titleAdj;
  __CFString *v25;
  uint64_t dateAdj;
  __CFString *v27;
  uint64_t duraAdj;
  __CFString *v29;
  uint64_t locationAdj;
  __CFString *v31;
  NSString *addedAttendeesCount;
  NSString *calendarAppUsageLevel;
  __int16 v34;
  uint64_t mailAppUsageLevel;
  __CFString *v36;
  uint64_t messagesAppUsageLevel;
  __CFString *v38;
  id v39;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    interface = self->_interface;
    if (interface >= 0x14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_interface);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4760430[interface];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("interface"));

    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
  {
    actionType = self->_actionType;
    if (actionType >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_actionType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E47604D0[actionType];
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("actionType"));

  }
  eventType = self->_eventType;
  if (eventType)
    objc_msgSend(v4, "setObject:forKey:", eventType, CFSTR("eventType"));
  languageID = self->_languageID;
  if (languageID)
    objc_msgSend(v4, "setObject:forKey:", languageID, CFSTR("languageID"));
  v13 = (__int16)self->_has;
  if ((v13 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_daysFromStartDate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("daysFromStartDate"));

    v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_19:
      if ((v13 & 0x800) == 0)
        goto LABEL_20;
      goto LABEL_31;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_confidenceScore);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("confidenceScore"));

  v13 = (__int16)self->_has;
  if ((v13 & 0x800) == 0)
  {
LABEL_20:
    if ((v13 & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_35;
  }
LABEL_31:
  significantSender = self->_significantSender;
  if (significantSender >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_significantSender);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E4760518[significantSender];
  }
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("significantSender"));

  v13 = (__int16)self->_has;
  if ((v13 & 0x400) == 0)
  {
LABEL_21:
    if ((v13 & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_participantCount);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("participantCount"));

  v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
LABEL_22:
    if ((v13 & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_40;
  }
LABEL_36:
  extractionLevel = self->_extractionLevel;
  if (extractionLevel >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_extractionLevel);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E4760530[extractionLevel];
  }
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("extractionLevel"));

  v13 = (__int16)self->_has;
  if ((v13 & 0x4000) == 0)
  {
LABEL_23:
    if ((v13 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_usedBubblesCount);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("usedBubblesCount"));

  v13 = (__int16)self->_has;
  if ((v13 & 0x2000) == 0)
  {
LABEL_24:
    if ((v13 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_45;
  }
LABEL_41:
  titleSource = self->_titleSource;
  if (titleSource >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_titleSource);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = off_1E4760560[titleSource];
  }
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("titleSource"));

  v13 = (__int16)self->_has;
  if ((v13 & 0x1000) == 0)
  {
LABEL_25:
    if ((v13 & 4) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_45:
  titleAdj = self->_titleAdj;
  if (titleAdj >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_titleAdj);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_1E4760580[titleAdj];
  }
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("titleAdj"));

  v13 = (__int16)self->_has;
  if ((v13 & 4) == 0)
  {
LABEL_26:
    if ((v13 & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_53;
  }
LABEL_49:
  dateAdj = self->_dateAdj;
  if (dateAdj >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dateAdj);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = off_1E47605A8[dateAdj];
  }
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("dateAdj"));

  v13 = (__int16)self->_has;
  if ((v13 & 0x10) == 0)
  {
LABEL_27:
    if ((v13 & 0x80) == 0)
      goto LABEL_61;
    goto LABEL_57;
  }
LABEL_53:
  duraAdj = self->_duraAdj;
  if (duraAdj >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_duraAdj);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = off_1E47605F8[duraAdj];
  }
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("duraAdj"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_57:
    locationAdj = self->_locationAdj;
    if (locationAdj >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_locationAdj);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E4760628[locationAdj];
    }
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("locationAdj"));

  }
LABEL_61:
  addedAttendeesCount = self->_addedAttendeesCount;
  if (addedAttendeesCount)
    objc_msgSend(v4, "setObject:forKey:", addedAttendeesCount, CFSTR("addedAttendeesCount"));
  calendarAppUsageLevel = self->_calendarAppUsageLevel;
  if (calendarAppUsageLevel)
    objc_msgSend(v4, "setObject:forKey:", calendarAppUsageLevel, CFSTR("calendarAppUsageLevel"));
  v34 = (__int16)self->_has;
  if ((v34 & 0x100) != 0)
  {
    mailAppUsageLevel = self->_mailAppUsageLevel;
    if (mailAppUsageLevel >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mailAppUsageLevel);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_1E4760650[mailAppUsageLevel];
    }
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("mailAppUsageLevel"));

    v34 = (__int16)self->_has;
  }
  if ((v34 & 0x200) != 0)
  {
    messagesAppUsageLevel = self->_messagesAppUsageLevel;
    if (messagesAppUsageLevel >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_messagesAppUsageLevel);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E4760650[messagesAppUsageLevel];
    }
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("messagesAppUsageLevel"));

  }
  v39 = v4;

  return v39;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2NLEventInBannerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
  if (self->_eventType)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_languageID)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_13:
      if ((v6 & 0x800) == 0)
        goto LABEL_14;
      goto LABEL_34;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_14:
    if ((v6 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  v4 = v8;
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_15:
    if ((v6 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  v4 = v8;
  v6 = (__int16)self->_has;
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v6 = (__int16)self->_has;
  if ((v6 & 0x2000) == 0)
  {
LABEL_18:
    if ((v6 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  v4 = v8;
  v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_19:
    if ((v6 & 4) == 0)
      goto LABEL_20;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  v4 = v8;
  v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_20:
    if ((v6 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  v4 = v8;
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_21:
    if ((v6 & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_22:
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
LABEL_23:
  if (self->_addedAttendeesCount)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_calendarAppUsageLevel)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_interface;
    *((_WORD *)v4 + 56) |= 0x40u;
    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_actionType;
    *((_WORD *)v4 + 56) |= 1u;
  }
  if (self->_eventType)
  {
    objc_msgSend(v8, "setEventType:");
    v4 = v8;
  }
  if (self->_languageID)
  {
    objc_msgSend(v8, "setLanguageID:");
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_daysFromStartDate;
    *((_WORD *)v4 + 56) |= 8u;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_13:
      if ((v6 & 0x800) == 0)
        goto LABEL_14;
      goto LABEL_34;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 8) = self->_confidenceScore;
  *((_WORD *)v4 + 56) |= 2u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_14:
    if ((v6 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 24) = self->_significantSender;
  *((_WORD *)v4 + 56) |= 0x800u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_15:
    if ((v6 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 23) = self->_participantCount;
  *((_WORD *)v4 + 56) |= 0x400u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 14) = self->_extractionLevel;
  *((_WORD *)v4 + 56) |= 0x20u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 27) = self->_usedBubblesCount;
  *((_WORD *)v4 + 56) |= 0x4000u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x2000) == 0)
  {
LABEL_18:
    if ((v6 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 26) = self->_titleSource;
  *((_WORD *)v4 + 56) |= 0x2000u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_19:
    if ((v6 & 4) == 0)
      goto LABEL_20;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 25) = self->_titleAdj;
  *((_WORD *)v4 + 56) |= 0x1000u;
  v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_20:
    if ((v6 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 9) = self->_dateAdj;
  *((_WORD *)v4 + 56) |= 4u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_21:
    if ((v6 & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_41:
  *((_DWORD *)v4 + 11) = self->_duraAdj;
  *((_WORD *)v4 + 56) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_22:
    *((_DWORD *)v4 + 20) = self->_locationAdj;
    *((_WORD *)v4 + 56) |= 0x80u;
  }
LABEL_23:
  if (self->_addedAttendeesCount)
  {
    objc_msgSend(v8, "setAddedAttendeesCount:");
    v4 = v8;
  }
  if (self->_calendarAppUsageLevel)
  {
    objc_msgSend(v8, "setCalendarAppUsageLevel:");
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_mailAppUsageLevel;
    *((_WORD *)v4 + 56) |= 0x100u;
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_messagesAppUsageLevel;
    *((_WORD *)v4 + 56) |= 0x200u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int16 has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int16 v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_interface;
    *(_WORD *)(v5 + 112) |= 0x40u;
    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_actionType;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_eventType, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[NSString copyWithZone:](self->_languageID, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  v13 = (__int16)self->_has;
  if ((v13 & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_daysFromStartDate;
    *(_WORD *)(v5 + 112) |= 8u;
    v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_7:
      if ((v13 & 0x800) == 0)
        goto LABEL_8;
      goto LABEL_24;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 32) = self->_confidenceScore;
  *(_WORD *)(v5 + 112) |= 2u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x800) == 0)
  {
LABEL_8:
    if ((v13 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 96) = self->_significantSender;
  *(_WORD *)(v5 + 112) |= 0x800u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x400) == 0)
  {
LABEL_9:
    if ((v13 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 92) = self->_participantCount;
  *(_WORD *)(v5 + 112) |= 0x400u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
LABEL_10:
    if ((v13 & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 56) = self->_extractionLevel;
  *(_WORD *)(v5 + 112) |= 0x20u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x4000) == 0)
  {
LABEL_11:
    if ((v13 & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 108) = self->_usedBubblesCount;
  *(_WORD *)(v5 + 112) |= 0x4000u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x2000) == 0)
  {
LABEL_12:
    if ((v13 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 104) = self->_titleSource;
  *(_WORD *)(v5 + 112) |= 0x2000u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x1000) == 0)
  {
LABEL_13:
    if ((v13 & 4) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 100) = self->_titleAdj;
  *(_WORD *)(v5 + 112) |= 0x1000u;
  v13 = (__int16)self->_has;
  if ((v13 & 4) == 0)
  {
LABEL_14:
    if ((v13 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 36) = self->_dateAdj;
  *(_WORD *)(v5 + 112) |= 4u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x10) == 0)
  {
LABEL_15:
    if ((v13 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_31:
  *(_DWORD *)(v5 + 44) = self->_duraAdj;
  *(_WORD *)(v5 + 112) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_16:
    *(_DWORD *)(v5 + 80) = self->_locationAdj;
    *(_WORD *)(v5 + 112) |= 0x80u;
  }
LABEL_17:
  v14 = -[NSString copyWithZone:](self->_addedAttendeesCount, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  v16 = -[NSString copyWithZone:](self->_calendarAppUsageLevel, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = (__int16)self->_has;
  if ((v18 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_mailAppUsageLevel;
    *(_WORD *)(v5 + 112) |= 0x100u;
    v18 = (__int16)self->_has;
  }
  if ((v18 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_messagesAppUsageLevel;
    *(_WORD *)(v5 + 112) |= 0x200u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  __int16 has;
  __int16 v7;
  NSString *eventType;
  NSString *languageID;
  __int16 v10;
  __int16 v11;
  NSString *addedAttendeesCount;
  NSString *calendarAppUsageLevel;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_87;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_87;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 56);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_interface != *((_DWORD *)v4 + 15))
      goto LABEL_87;
  }
  else if ((v7 & 0x40) != 0)
  {
LABEL_87:
    v14 = 0;
    goto LABEL_88;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_actionType != *((_DWORD *)v4 + 2))
      goto LABEL_87;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_87;
  }
  eventType = self->_eventType;
  if ((unint64_t)eventType | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](eventType, "isEqual:"))
    goto LABEL_87;
  languageID = self->_languageID;
  if ((unint64_t)languageID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](languageID, "isEqual:"))
      goto LABEL_87;
  }
  v10 = (__int16)self->_has;
  v11 = *((_WORD *)v4 + 56);
  if ((v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_daysFromStartDate != *((_DWORD *)v4 + 10))
      goto LABEL_87;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_87;
  }
  if ((v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_confidenceScore != *((_DWORD *)v4 + 8))
      goto LABEL_87;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x800) == 0 || self->_significantSender != *((_DWORD *)v4 + 24))
      goto LABEL_87;
  }
  else if ((*((_WORD *)v4 + 56) & 0x800) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x400) == 0 || self->_participantCount != *((_DWORD *)v4 + 23))
      goto LABEL_87;
  }
  else if ((*((_WORD *)v4 + 56) & 0x400) != 0)
  {
    goto LABEL_87;
  }
  if ((v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_extractionLevel != *((_DWORD *)v4 + 14))
      goto LABEL_87;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x4000) == 0 || self->_usedBubblesCount != *((_DWORD *)v4 + 27))
      goto LABEL_87;
  }
  else if ((*((_WORD *)v4 + 56) & 0x4000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x2000) == 0 || self->_titleSource != *((_DWORD *)v4 + 26))
      goto LABEL_87;
  }
  else if ((*((_WORD *)v4 + 56) & 0x2000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x1000) == 0 || self->_titleAdj != *((_DWORD *)v4 + 25))
      goto LABEL_87;
  }
  else if ((*((_WORD *)v4 + 56) & 0x1000) != 0)
  {
    goto LABEL_87;
  }
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_dateAdj != *((_DWORD *)v4 + 9))
      goto LABEL_87;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_87;
  }
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_duraAdj != *((_DWORD *)v4 + 11))
      goto LABEL_87;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_87;
  }
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_locationAdj != *((_DWORD *)v4 + 20))
      goto LABEL_87;
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_87;
  }
  addedAttendeesCount = self->_addedAttendeesCount;
  if ((unint64_t)addedAttendeesCount | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](addedAttendeesCount, "isEqual:"))
  {
    goto LABEL_87;
  }
  calendarAppUsageLevel = self->_calendarAppUsageLevel;
  if ((unint64_t)calendarAppUsageLevel | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](calendarAppUsageLevel, "isEqual:"))
      goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x100) == 0 || self->_mailAppUsageLevel != *((_DWORD *)v4 + 21))
      goto LABEL_87;
  }
  else if ((*((_WORD *)v4 + 56) & 0x100) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x200) == 0 || self->_messagesAppUsageLevel != *((_DWORD *)v4 + 22))
      goto LABEL_87;
    v14 = 1;
  }
  else
  {
    v14 = (*((_WORD *)v4 + 56) & 0x200) == 0;
  }
LABEL_88:

  return v14;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;
  NSUInteger v26;

  v26 = -[NSString hash](self->_key, "hash");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v25 = 2654435761 * self->_interface;
    if ((has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v25 = 0;
    if ((has & 1) != 0)
    {
LABEL_3:
      v24 = 2654435761 * self->_actionType;
      goto LABEL_6;
    }
  }
  v24 = 0;
LABEL_6:
  v23 = -[NSString hash](self->_eventType, "hash");
  v22 = -[NSString hash](self->_languageID, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 8) != 0)
  {
    v21 = 2654435761 * self->_daysFromStartDate;
    if ((v4 & 2) != 0)
    {
LABEL_8:
      v20 = 2654435761 * self->_confidenceScore;
      if ((*(_WORD *)&self->_has & 0x800) != 0)
        goto LABEL_9;
      goto LABEL_20;
    }
  }
  else
  {
    v21 = 0;
    if ((v4 & 2) != 0)
      goto LABEL_8;
  }
  v20 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    v19 = 2654435761 * self->_significantSender;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v19 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_10:
    v18 = 2654435761 * self->_participantCount;
    if ((v4 & 0x20) != 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  v18 = 0;
  if ((v4 & 0x20) != 0)
  {
LABEL_11:
    v16 = 2654435761 * self->_extractionLevel;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  v16 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_12:
    v5 = 2654435761 * self->_usedBubblesCount;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_13:
    v6 = 2654435761 * self->_titleSource;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_25;
  }
LABEL_24:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_14:
    v7 = 2654435761 * self->_titleAdj;
    if ((v4 & 4) != 0)
      goto LABEL_15;
    goto LABEL_26;
  }
LABEL_25:
  v7 = 0;
  if ((v4 & 4) != 0)
  {
LABEL_15:
    v8 = 2654435761 * self->_dateAdj;
    if ((v4 & 0x10) != 0)
      goto LABEL_16;
LABEL_27:
    v9 = 0;
    if ((v4 & 0x80) != 0)
      goto LABEL_17;
    goto LABEL_28;
  }
LABEL_26:
  v8 = 0;
  if ((v4 & 0x10) == 0)
    goto LABEL_27;
LABEL_16:
  v9 = 2654435761 * self->_duraAdj;
  if ((v4 & 0x80) != 0)
  {
LABEL_17:
    v10 = 2654435761 * self->_locationAdj;
    goto LABEL_29;
  }
LABEL_28:
  v10 = 0;
LABEL_29:
  v11 = -[NSString hash](self->_addedAttendeesCount, "hash", v16);
  v12 = -[NSString hash](self->_calendarAppUsageLevel, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v13 = 2654435761 * self->_mailAppUsageLevel;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_31;
LABEL_33:
    v14 = 0;
    return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_33;
LABEL_31:
  v14 = 2654435761 * self->_messagesAppUsageLevel;
  return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[SGM2NLEventInBanner setKey:](self, "setKey:");
    v4 = v8;
  }
  v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x40) != 0)
  {
    self->_interface = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x40u;
    v5 = *((_WORD *)v4 + 56);
  }
  if ((v5 & 1) != 0)
  {
    self->_actionType = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[SGM2NLEventInBanner setEventType:](self, "setEventType:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[SGM2NLEventInBanner setLanguageID:](self, "setLanguageID:");
    v4 = v8;
  }
  v6 = *((_WORD *)v4 + 56);
  if ((v6 & 8) != 0)
  {
    self->_daysFromStartDate = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 8u;
    v6 = *((_WORD *)v4 + 56);
    if ((v6 & 2) == 0)
    {
LABEL_13:
      if ((v6 & 0x800) == 0)
        goto LABEL_14;
      goto LABEL_34;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_confidenceScore = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x800) == 0)
  {
LABEL_14:
    if ((v6 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  self->_significantSender = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x800u;
  v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x400) == 0)
  {
LABEL_15:
    if ((v6 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  self->_participantCount = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_has |= 0x400u;
  v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x20) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  self->_extractionLevel = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x20u;
  v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  self->_usedBubblesCount = *((_DWORD *)v4 + 27);
  *(_WORD *)&self->_has |= 0x4000u;
  v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x2000) == 0)
  {
LABEL_18:
    if ((v6 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  self->_titleSource = *((_DWORD *)v4 + 26);
  *(_WORD *)&self->_has |= 0x2000u;
  v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x1000) == 0)
  {
LABEL_19:
    if ((v6 & 4) == 0)
      goto LABEL_20;
    goto LABEL_40;
  }
LABEL_39:
  self->_titleAdj = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x1000u;
  v6 = *((_WORD *)v4 + 56);
  if ((v6 & 4) == 0)
  {
LABEL_20:
    if ((v6 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_41;
  }
LABEL_40:
  self->_dateAdj = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 4u;
  v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x10) == 0)
  {
LABEL_21:
    if ((v6 & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_41:
  self->_duraAdj = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 56) & 0x80) != 0)
  {
LABEL_22:
    self->_locationAdj = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_23:
  if (*((_QWORD *)v4 + 2))
  {
    -[SGM2NLEventInBanner setAddedAttendeesCount:](self, "setAddedAttendeesCount:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[SGM2NLEventInBanner setCalendarAppUsageLevel:](self, "setCalendarAppUsageLevel:");
    v4 = v8;
  }
  v7 = *((_WORD *)v4 + 56);
  if ((v7 & 0x100) != 0)
  {
    self->_mailAppUsageLevel = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_has |= 0x100u;
    v7 = *((_WORD *)v4 + 56);
  }
  if ((v7 & 0x200) != 0)
  {
    self->_messagesAppUsageLevel = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x200u;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
  objc_storeStrong((id *)&self->_eventType, a3);
}

- (NSString)languageID
{
  return self->_languageID;
}

- (void)setLanguageID:(id)a3
{
  objc_storeStrong((id *)&self->_languageID, a3);
}

- (unsigned)daysFromStartDate
{
  return self->_daysFromStartDate;
}

- (unsigned)confidenceScore
{
  return self->_confidenceScore;
}

- (unsigned)participantCount
{
  return self->_participantCount;
}

- (unsigned)usedBubblesCount
{
  return self->_usedBubblesCount;
}

- (NSString)addedAttendeesCount
{
  return self->_addedAttendeesCount;
}

- (void)setAddedAttendeesCount:(id)a3
{
  objc_storeStrong((id *)&self->_addedAttendeesCount, a3);
}

- (NSString)calendarAppUsageLevel
{
  return self->_calendarAppUsageLevel;
}

- (void)setCalendarAppUsageLevel:(id)a3
{
  objc_storeStrong((id *)&self->_calendarAppUsageLevel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageID, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_calendarAppUsageLevel, 0);
  objc_storeStrong((id *)&self->_addedAttendeesCount, 0);
}

@end
