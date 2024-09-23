@implementation _INPBPayloadUnsupported

- (void)setUpdateAlarmIntentAlarmUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 1);
    self->_updateAlarmIntentAlarmUnsupportedReason = a3;
  }
}

- (BOOL)hasUpdateAlarmIntentAlarmUnsupportedReason
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasUpdateAlarmIntentAlarmUnsupportedReason:(BOOL)a3
{
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (id)updateAlarmIntentAlarmUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  switch(a3)
  {
    case 0:
      return CFSTR("NOT_FOUND");
    case 3:
      return CFSTR("SLEEP_ALARM_NOT_SUPPORTED");
    case 1:
      v3 = CFSTR("NO_ALARM_EXISTS");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (int)StringAsUpdateAlarmIntentAlarmUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_FOUND")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_ALARM_EXISTS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SLEEP_ALARM_NOT_SUPPORTED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setChangeAlarmStatusIntentAlarmsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFFFFDLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 2);
    self->_changeAlarmStatusIntentAlarmsUnsupportedReason = a3;
  }
}

- (BOOL)hasChangeAlarmStatusIntentAlarmsUnsupportedReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasChangeAlarmStatusIntentAlarmsUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (id)changeAlarmStatusIntentAlarmsUnsupportedReasonAsString:(int)a3
{
  if (a3 < 6)
    return off_1E228E8A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsChangeAlarmStatusIntentAlarmsUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_FOUND")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_ALARM_EXISTS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALARM_ALREADY_ENABLED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALARM_ALREADY_DISABLED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALARM_NOT_FIRING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SLEEP_ALARM_NOT_SUPPORTED")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDeleteAlarmIntentAlarmsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFFFFBLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 4);
    self->_deleteAlarmIntentAlarmsUnsupportedReason = a3;
  }
}

- (BOOL)hasDeleteAlarmIntentAlarmsUnsupportedReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasDeleteAlarmIntentAlarmsUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (id)deleteAlarmIntentAlarmsUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("NOT_FOUND");
  if (a3 == 1)
  {
    v3 = CFSTR("NO_ALARM_EXISTS");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDeleteAlarmIntentAlarmsUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_FOUND")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NO_ALARM_EXISTS"));

  return v4;
}

- (void)setSearchAlarmIntentAlarmsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFFFF7);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 8);
    self->_searchAlarmIntentAlarmsUnsupportedReason = a3;
  }
}

- (BOOL)hasSearchAlarmIntentAlarmsUnsupportedReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasSearchAlarmIntentAlarmsUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (id)searchAlarmIntentAlarmsUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("NOT_FOUND");
  if (a3 == 1)
  {
    v3 = CFSTR("NO_ALARM_EXISTS");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSearchAlarmIntentAlarmsUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_FOUND")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NO_ALARM_EXISTS"));

  return v4;
}

- (void)setSnoozeAlarmIntentAlarmsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFFFEFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x10);
    self->_snoozeAlarmIntentAlarmsUnsupportedReason = a3;
  }
}

- (BOOL)hasSnoozeAlarmIntentAlarmsUnsupportedReason
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasSnoozeAlarmIntentAlarmsUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (id)snoozeAlarmIntentAlarmsUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("NO_ALARM_FIRING");
  if (a3 == 1)
  {
    v3 = CFSTR("CANT_SNOOZE_MUSIC_ALARM");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSnoozeAlarmIntentAlarmsUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_ALARM_FIRING")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CANT_SNOOZE_MUSIC_ALARM"));

  return v4;
}

- (void)setSendAnnouncementIntentAnnouncementUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFFFDFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x20);
    self->_sendAnnouncementIntentAnnouncementUnsupportedReason = a3;
  }
}

- (BOOL)hasSendAnnouncementIntentAnnouncementUnsupportedReason
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasSendAnnouncementIntentAnnouncementUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (id)sendAnnouncementIntentAnnouncementUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("NO_ANNOUNCEMENT_TO_REPLY_TO");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSendAnnouncementIntentAnnouncementUnsupportedReason:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("NO_ANNOUNCEMENT_TO_REPLY_TO"));
  return 1;
}

- (void)setStartCallIntentCallCapabilityUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFFFBFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x40);
    self->_startCallIntentCallCapabilityUnsupportedReason = a3;
  }
}

- (BOOL)hasStartCallIntentCallCapabilityUnsupportedReason
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasStartCallIntentCallCapabilityUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (id)startCallIntentCallCapabilityUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E228E8D8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStartCallIntentCallCapabilityUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_CALL_UNSUPPORTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MICROPHONE_NOT_ACCESSIBLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAMERA_NOT_ACCESSIBLE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setStartCallIntentCallRecordToCallBackUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFFF7FLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x80);
    self->_startCallIntentCallRecordToCallBackUnsupportedReason = a3;
  }
}

- (BOOL)hasStartCallIntentCallRecordToCallBackUnsupportedReason
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasStartCallIntentCallRecordToCallBackUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (id)startCallIntentCallRecordToCallBackUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("NO_MATCHING_CALL");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsStartCallIntentCallRecordToCallBackUnsupportedReason:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("NO_MATCHING_CALL"));
  return 1;
}

- (void)setConflictingParameters:(id)a3
{
  NSArray *v4;
  NSArray *conflictingParameters;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  conflictingParameters = self->_conflictingParameters;
  self->_conflictingParameters = v4;

}

- (void)clearConflictingParameters
{
  -[NSArray removeAllObjects](self->_conflictingParameters, "removeAllObjects");
}

- (void)addConflictingParameters:(id)a3
{
  id v4;
  NSArray *conflictingParameters;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  conflictingParameters = self->_conflictingParameters;
  v8 = v4;
  if (!conflictingParameters)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_conflictingParameters;
    self->_conflictingParameters = v6;

    v4 = v8;
    conflictingParameters = self->_conflictingParameters;
  }
  -[NSArray addObject:](conflictingParameters, "addObject:", v4);

}

- (unint64_t)conflictingParametersCount
{
  return -[NSArray count](self->_conflictingParameters, "count");
}

- (id)conflictingParametersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_conflictingParameters, "objectAtIndexedSubscript:", a3);
}

- (void)setAddTasksIntentContactEventTriggerUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFFEFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x100);
    self->_addTasksIntentContactEventTriggerUnsupportedReason = a3;
  }
}

- (BOOL)hasAddTasksIntentContactEventTriggerUnsupportedReason
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHasAddTasksIntentContactEventTriggerUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (id)addTasksIntentContactEventTriggerUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("ACCOUNT_DOES_NOT_SUPPORT");
  if (a3 == 2)
  {
    v3 = CFSTR("CLOUDKIT_NOT_UPGRADED");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAddTasksIntentContactEventTriggerUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCOUNT_DOES_NOT_SUPPORT")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLOUDKIT_NOT_UPGRADED")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setSetTaskAttributeIntentContactEventTriggerUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFFDFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x200);
    self->_setTaskAttributeIntentContactEventTriggerUnsupportedReason = a3;
  }
}

- (BOOL)hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasSetTaskAttributeIntentContactEventTriggerUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (id)setTaskAttributeIntentContactEventTriggerUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("ACCOUNT_DOES_NOT_SUPPORT");
  if (a3 == 2)
  {
    v3 = CFSTR("CLOUDKIT_NOT_UPGRADED");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSetTaskAttributeIntentContactEventTriggerUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCOUNT_DOES_NOT_SUPPORT")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLOUDKIT_NOT_UPGRADED")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setStartCallIntentContactsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFFBFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x400);
    self->_startCallIntentContactsUnsupportedReason = a3;
  }
}

- (BOOL)hasStartCallIntentContactsUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasStartCallIntentContactsUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (id)startCallIntentContactsUnsupportedReasonAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 0xA && ((0x2FFu >> v3) & 1) != 0)
  {
    v4 = off_1E228E8F0[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsStartCallIntentContactsUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_CONTACT_FOUND")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MULTIPLE_CONTACTS_UNSUPPORTED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_HANDLE_FOR_LABEL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_HANDLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSUPPORTED_MMI_USSD")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_CALL_HISTORY_FOR_REDIAL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_USABLE_HANDLE_FOR_REDIAL")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOREIGN_EMERGENCY_DISAMBIGUATION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REQUIRING_IN_APP_AUTHENTICATION")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setRequestPaymentIntentCurrencyAmountUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFF7FFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x800);
    self->_requestPaymentIntentCurrencyAmountUnsupportedReason = a3;
  }
}

- (BOOL)hasRequestPaymentIntentCurrencyAmountUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasRequestPaymentIntentCurrencyAmountUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (id)requestPaymentIntentCurrencyAmountUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E228E940[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestPaymentIntentCurrencyAmountUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENTS_AMOUNT_BELOW_MINIMUM")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENTS_AMOUNT_ABOVE_MAXIMUM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENTS_CURRENCY_UNSUPPORTED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setSendPaymentIntentCurrencyAmountUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFEFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x1000);
    self->_sendPaymentIntentCurrencyAmountUnsupportedReason = a3;
  }
}

- (BOOL)hasSendPaymentIntentCurrencyAmountUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasSendPaymentIntentCurrencyAmountUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (id)sendPaymentIntentCurrencyAmountUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E228E940[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSendPaymentIntentCurrencyAmountUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENTS_AMOUNT_BELOW_MINIMUM")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENTS_AMOUNT_ABOVE_MAXIMUM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENTS_CURRENCY_UNSUPPORTED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setCustomUnsupportedReason:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_customUnsupportedReason = a3;
}

- (BOOL)hasCustomUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasCustomUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (void)setDateTimeRangeUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFFBFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x4000);
    self->_dateTimeRangeUnsupportedReason = a3;
  }
}

- (BOOL)hasDateTimeRangeUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasDateTimeRangeUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (id)dateTimeRangeUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("PAST_DATE_TIME");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDateTimeRangeUnsupportedReason:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("PAST_DATE_TIME"));
  return 1;
}

- (void)setFindDeviceAndPlaySoundIntentDeviceUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFF7FFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x8000);
    self->_findDeviceAndPlaySoundIntentDeviceUnsupportedReason = a3;
  }
}

- (BOOL)hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (id)findDeviceAndPlaySoundIntentDeviceUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("UNKNOWN");
  if (a3 == 2)
  {
    v3 = CFSTR("SERVICE_UNAVAILABLE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsFindDeviceAndPlaySoundIntentDeviceUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_UNAVAILABLE")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setJoinCallIntentGroupConversationUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFEFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x10000);
    self->_joinCallIntentGroupConversationUnsupportedReason = a3;
  }
}

- (BOOL)hasJoinCallIntentGroupConversationUnsupportedReason
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasJoinCallIntentGroupConversationUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (id)joinCallIntentGroupConversationUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("NO_ACTIVE_NOTIFICATIONS");
  if (a3 == 2)
  {
    v3 = CFSTR("NO_MATCHING_NOTIFICATIONS");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsJoinCallIntentGroupConversationUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_ACTIVE_NOTIFICATIONS")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("NO_MATCHING_NOTIFICATIONS")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setReportIncidentIntentIncidentTypeUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFDFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x20000);
    self->_reportIncidentIntentIncidentTypeUnsupportedReason = a3;
  }
}

- (BOOL)hasReportIncidentIntentIncidentTypeUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasReportIncidentIntentIncidentTypeUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (id)reportIncidentIntentIncidentTypeUnsupportedReasonAsString:(int)a3
{
  if (a3 < 5)
    return off_1E228E958[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReportIncidentIntentIncidentTypeUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSUPPORTED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSUPPORTED_INCIDENT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSUPPORTED_REGION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_LOCATION_DISABLED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_INCIDENT_TYPE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCreateTimerIntentLabelUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFFBFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x40000);
    self->_createTimerIntentLabelUnsupportedReason = a3;
  }
}

- (BOOL)hasCreateTimerIntentLabelUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasCreateTimerIntentLabelUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (id)createTimerIntentLabelUnsupportedReasonAsString:(int)a3
{
  if (!a3)
    return CFSTR("AMBIGUOUS_UNNAMED_TIMER");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCreateTimerIntentLabelUnsupportedReason:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("AMBIGUOUS_UNNAMED_TIMER"));
  return 0;
}

- (void)setAddMediaIntentMediaDestinationUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFF7FFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x80000);
    self->_addMediaIntentMediaDestinationUnsupportedReason = a3;
  }
}

- (BOOL)hasAddMediaIntentMediaDestinationUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasAddMediaIntentMediaDestinationUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (id)addMediaIntentMediaDestinationUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("PLAYLIST_NAME_NOT_FOUND");
  if (a3 == 2)
  {
    v3 = CFSTR("PLAYLIST_NOT_EDITABLE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAddMediaIntentMediaDestinationUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLAYLIST_NAME_NOT_FOUND")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLAYLIST_NOT_EDITABLE")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setAddMediaIntentMediaItemsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFEFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x100000);
    self->_addMediaIntentMediaItemsUnsupportedReason = a3;
  }
}

- (BOOL)hasAddMediaIntentMediaItemsUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasAddMediaIntentMediaItemsUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (id)addMediaIntentMediaItemsUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("LOGIN_REQUIRED");
  switch(a3)
  {
    case 1:
LABEL_4:
      result = v3;
      break;
    case 2:
      result = CFSTR("SUBSCRIPTION_REQUIRED");
      break;
    case 3:
      result = CFSTR("UNSUPPORTED_MEDIA_TYPE");
      break;
    case 4:
      result = CFSTR("EXPLICIT_CONTENT_SETTINGS");
      break;
    case 5:
      result = CFSTR("CELLULAR_DATA_SETTINGS");
      break;
    case 6:
      result = CFSTR("RESTRICTED_CONTENT");
      break;
    case 7:
      result = CFSTR("SERVICE_UNAVAILABLE");
      break;
    case 8:
      result = CFSTR("REGION_RESTRICTION");
      break;
    default:
      switch(a3)
      {
        case 'd':
          v3 = CFSTR("APP_NOT_CONFIGURED");
          goto LABEL_4;
        case 'e':
          result = CFSTR("APP_NOT_AVAILABLE");
          break;
        case 'f':
          result = CFSTR("APP_ACCOUNT_FAILURE");
          break;
        case 'g':
          result = CFSTR("APP_DOESNT_SUPPORT_INTENT");
          break;
        case 'h':
          result = CFSTR("ALREADY_IN_LIBRARY");
          break;
        case 'i':
          result = CFSTR("CLOUD_SYNC_OFF");
          break;
        case 'j':
          result = CFSTR("GET_NOWPLAYING_FAILURE");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
      }
      break;
  }
  return result;
}

- (int)StringAsAddMediaIntentMediaItemsUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOGIN_REQUIRED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIPTION_REQUIRED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSUPPORTED_MEDIA_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLICIT_CONTENT_SETTINGS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_DATA_SETTINGS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTED_CONTENT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGION_RESTRICTION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_NOT_CONFIGURED")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_ACCOUNT_FAILURE")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_DOESNT_SUPPORT_INTENT")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALREADY_IN_LIBRARY")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLOUD_SYNC_OFF")) & 1) != 0)
  {
    v4 = 105;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GET_NOWPLAYING_FAILURE")))
  {
    v4 = 106;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setPlayMediaIntentMediaItemsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFDFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x200000);
    self->_playMediaIntentMediaItemsUnsupportedReason = a3;
  }
}

- (BOOL)hasPlayMediaIntentMediaItemsUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasPlayMediaIntentMediaItemsUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (id)playMediaIntentMediaItemsUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("LOGIN_REQUIRED");
  switch(a3)
  {
    case 1:
LABEL_4:
      result = v3;
      break;
    case 2:
      result = CFSTR("SUBSCRIPTION_REQUIRED");
      break;
    case 3:
      result = CFSTR("UNSUPPORTED_MEDIA_TYPE");
      break;
    case 4:
      result = CFSTR("EXPLICIT_CONTENT_SETTINGS");
      break;
    case 5:
      result = CFSTR("CELLULAR_DATA_SETTINGS");
      break;
    case 6:
      result = CFSTR("RESTRICTED_CONTENT");
      break;
    case 7:
      result = CFSTR("SERVICE_UNAVAILABLE");
      break;
    case 8:
      result = CFSTR("REGION_RESTRICTION");
      break;
    case 9:
      result = CFSTR("NOT_DOWNLOADED_FOR_OFFLINE");
      break;
    default:
      switch(a3)
      {
        case 1000:
          result = CFSTR("PLAYBACK_DEVICE_NOT_FOUND");
          break;
        case 1001:
          result = CFSTR("EMPTY_LIBRARY");
          break;
        case 1002:
          result = CFSTR("CREATE_RADIO_FAILED");
          break;
        case 1003:
          result = CFSTR("UNSUPPORTED_PLAYBACK_QUEUE_LOCATION");
          break;
        case 1004:
          result = CFSTR("UNSUPPORTED_PLAYBACK_QUEUE_LOCATION_WITH_LIVE_RADIO");
          break;
        case 1005:
          result = CFSTR("STILL_LOADING_CLOUD_LIBRARY");
          break;
        case 1006:
          result = CFSTR("ITUNES_ACCOUNT_ERROR");
          break;
        default:
          switch(a3)
          {
            case 'd':
              v3 = CFSTR("APP_NOT_CONFIGURED");
              goto LABEL_4;
            case 'e':
              result = CFSTR("APP_NOT_AVAILABLE");
              break;
            case 'f':
              result = CFSTR("APP_ACCOUNT_FAILURE");
              break;
            case 'g':
              result = CFSTR("APP_DOESNT_SUPPORT_INTENT");
              break;
            case 'h':
              result = CFSTR("MS_LIMIT_REACHED");
              break;
            case 'i':
              result = CFSTR("MEDIA_PLAYBACK_DISABLED");
              break;
            default:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
              v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
              goto LABEL_4;
          }
          break;
      }
      break;
  }
  return result;
}

- (int)StringAsPlayMediaIntentMediaItemsUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOGIN_REQUIRED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIPTION_REQUIRED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSUPPORTED_MEDIA_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLICIT_CONTENT_SETTINGS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_DATA_SETTINGS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTED_CONTENT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGION_RESTRICTION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_DOWNLOADED_FOR_OFFLINE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_NOT_CONFIGURED")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_ACCOUNT_FAILURE")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_DOESNT_SUPPORT_INTENT")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MS_LIMIT_REACHED")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIA_PLAYBACK_DISABLED")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLAYBACK_DEVICE_NOT_FOUND")) & 1) != 0)
  {
    v4 = 1000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMPTY_LIBRARY")) & 1) != 0)
  {
    v4 = 1001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CREATE_RADIO_FAILED")) & 1) != 0)
  {
    v4 = 1002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSUPPORTED_PLAYBACK_QUEUE_LOCATION")) & 1) != 0)
  {
    v4 = 1003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSUPPORTED_PLAYBACK_QUEUE_LOCATION_WITH_LIVE_RADIO")) & 1) != 0)
  {
    v4 = 1004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STILL_LOADING_CLOUD_LIBRARY")) & 1) != 0)
  {
    v4 = 1005;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ITUNES_ACCOUNT_ERROR")))
  {
    v4 = 1006;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setSearchForMediaIntentMediaItemsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFFBFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x400000);
    self->_searchForMediaIntentMediaItemsUnsupportedReason = a3;
  }
}

- (BOOL)hasSearchForMediaIntentMediaItemsUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasSearchForMediaIntentMediaItemsUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (id)searchForMediaIntentMediaItemsUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("LOGIN_REQUIRED");
  switch(a3)
  {
    case 1:
      goto LABEL_3;
    case 2:
      v3 = CFSTR("SUBSCRIPTION_REQUIRED");
LABEL_3:
      result = v3;
      break;
    case 3:
      result = CFSTR("UNSUPPORTED_MEDIA_TYPE");
      break;
    case 4:
      result = CFSTR("EXPLICIT_CONTENT_SETTINGS");
      break;
    case 5:
      result = CFSTR("CELLULAR_DATA_SETTINGS");
      break;
    case 6:
      result = CFSTR("RESTRICTED_CONTENT");
      break;
    case 7:
      result = CFSTR("SERVICE_UNAVAILABLE");
      break;
    case 8:
      result = CFSTR("REGION_RESTRICTION");
      break;
    default:
      switch(a3)
      {
        case 'd':
          result = CFSTR("APP_NOT_CONFIGURED");
          break;
        case 'e':
          result = CFSTR("APP_NOT_AVAILABLE");
          break;
        case 'f':
          result = CFSTR("APP_ACCOUNT_FAILURE");
          break;
        case 'g':
          result = CFSTR("APP_DOESNT_SUPPORT_INTENT");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
      }
      break;
  }
  return result;
}

- (int)StringAsSearchForMediaIntentMediaItemsUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOGIN_REQUIRED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIPTION_REQUIRED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSUPPORTED_MEDIA_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLICIT_CONTENT_SETTINGS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_DATA_SETTINGS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTED_CONTENT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGION_RESTRICTION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_NOT_CONFIGURED")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_ACCOUNT_FAILURE")) & 1) != 0)
  {
    v4 = 102;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("APP_DOESNT_SUPPORT_INTENT")))
  {
    v4 = 103;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setUpdateMediaAffinityIntentMediaItemsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFF7FFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x800000);
    self->_updateMediaAffinityIntentMediaItemsUnsupportedReason = a3;
  }
}

- (BOOL)hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasUpdateMediaAffinityIntentMediaItemsUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (id)updateMediaAffinityIntentMediaItemsUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("LOGIN_REQUIRED");
  switch(a3)
  {
    case 1:
      goto LABEL_3;
    case 2:
      v3 = CFSTR("SUBSCRIPTION_REQUIRED");
LABEL_3:
      result = v3;
      break;
    case 3:
      result = CFSTR("UNSUPPORTED_MEDIA_TYPE");
      break;
    case 4:
      result = CFSTR("EXPLICIT_CONTENT_SETTINGS");
      break;
    case 5:
      result = CFSTR("CELLULAR_DATA_SETTINGS");
      break;
    case 6:
      result = CFSTR("RESTRICTED_CONTENT");
      break;
    case 7:
      result = CFSTR("SERVICE_UNAVAILABLE");
      break;
    case 8:
      result = CFSTR("REGION_RESTRICTION");
      break;
    default:
      switch(a3)
      {
        case 'd':
          result = CFSTR("APP_NOT_CONFIGURED");
          break;
        case 'e':
          result = CFSTR("APP_NOT_AVAILABLE");
          break;
        case 'f':
          result = CFSTR("APP_ACCOUNT_FAILURE");
          break;
        case 'g':
          result = CFSTR("APP_DOESNT_SUPPORT_INTENT");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
      }
      break;
  }
  return result;
}

- (int)StringAsUpdateMediaAffinityIntentMediaItemsUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOGIN_REQUIRED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIPTION_REQUIRED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSUPPORTED_MEDIA_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLICIT_CONTENT_SETTINGS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_DATA_SETTINGS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTED_CONTENT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGION_RESTRICTION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_NOT_CONFIGURED")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_ACCOUNT_FAILURE")) & 1) != 0)
  {
    v4 = 102;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("APP_DOESNT_SUPPORT_INTENT")))
  {
    v4 = 103;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setParticipantUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFEFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x1000000);
    self->_participantUnsupportedReason = a3;
  }
}

- (BOOL)hasParticipantUnsupportedReason
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHasParticipantUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (id)participantUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("INVALID_PARTICIPANT");
  if (a3 == 2)
  {
    v3 = CFSTR("PARTICIPANT_NOT_FOUND");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsParticipantUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_PARTICIPANT")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("PARTICIPANT_NOT_FOUND")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setAddCallParticipantIntentParticipantsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFDFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x2000000);
    self->_addCallParticipantIntentParticipantsUnsupportedReason = a3;
  }
}

- (BOOL)hasAddCallParticipantIntentParticipantsUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasAddCallParticipantIntentParticipantsUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (id)addCallParticipantIntentParticipantsUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) < 6)
    return off_1E228E980[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAddCallParticipantIntentParticipantsUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_CONTACT_FOUND")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MULTIPLE_CONTACTS_UNSUPPORTED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_HANDLE_FOUND")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_HANDLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCAL_EMERGENCY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FOREIGN_EMERGENCY")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setSendPaymentIntentPayeeUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFFBFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x4000000);
    self->_sendPaymentIntentPayeeUnsupportedReason = a3;
  }
}

- (BOOL)hasSendPaymentIntentPayeeUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasSendPaymentIntentPayeeUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (id)sendPaymentIntentPayeeUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E228E9B0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSendPaymentIntentPayeeUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CREDENTIALS_UNVERIFIED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INSUFFICIENT_FUNDS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_ACCOUNT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NO_VALID_HANDLE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setRequestPaymentIntentPayerUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFF7FFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x8000000);
    self->_requestPaymentIntentPayerUnsupportedReason = a3;
  }
}

- (BOOL)hasRequestPaymentIntentPayerUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasRequestPaymentIntentPayerUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (id)requestPaymentIntentPayerUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E228E9D0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestPaymentIntentPayerUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CREDENTIALS_UNVERIFIED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_ACCOUNT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NO_VALID_HANDLE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setPlayMediaIntentPlaybackSpeedUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFEFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x10000000);
    self->_playMediaIntentPlaybackSpeedUnsupportedReason = a3;
  }
}

- (BOOL)hasPlayMediaIntentPlaybackSpeedUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHasPlayMediaIntentPlaybackSpeedUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (id)playMediaIntentPlaybackSpeedUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("BELOW_MINIMUM");
  if (a3 == 2)
  {
    v3 = CFSTR("ABOVE_MAXIMUM");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsPlayMediaIntentPlaybackSpeedUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BELOW_MINIMUM")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("ABOVE_MAXIMUM")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setStartCallIntentPreferredCallProviderUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFDFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x20000000);
    self->_startCallIntentPreferredCallProviderUnsupportedReason = a3;
  }
}

- (BOOL)hasStartCallIntentPreferredCallProviderUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHasStartCallIntentPreferredCallProviderUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (id)startCallIntentPreferredCallProviderUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) < 6)
    return off_1E228E9E8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStartCallIntentPreferredCallProviderUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TELEPHONY_UNSUPPORTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CALL_PROVIDER_NOT_ACCESSIBLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMERGENCY_CALL_PROVIDER_NOT_ACCESSIBLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SETTINGS_RESTRICTED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCOUNT_SETUP_REQUIRED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PROVIDER_DISABLED_IN_SETTINGS")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFFBFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x40000000);
    self->_reason = a3;
  }
}

- (BOOL)hasReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setHasReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (id)reasonAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("None");
  switch(a3)
  {
    case 1:
      return v3;
    case 2:
      v3 = CFSTR("NotNow");
      return v3;
    case 3:
      return CFSTR("NotHere");
    case 4:
      return CFSTR("ConflictWithOtherFields");
    default:
      if (a3 == 1000)
        return CFSTR("UnsupportedReasonExtension");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotNow")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotHere")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConflictWithOtherFields")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UnsupportedReasonExtension")))
  {
    v4 = 1000;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setShareETAIntentRecipientUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFF7FFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(unint64_t *)&has | 0x80000000);
    self->_shareETAIntentRecipientUnsupportedReason = a3;
  }
}

- (BOOL)hasShareETAIntentRecipientUnsupportedReason
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setHasShareETAIntentRecipientUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (id)shareETAIntentRecipientUnsupportedReasonAsString:(int)a3
{
  if (a3 < 5)
    return off_1E228EA18[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsShareETAIntentRecipientUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_RECIPIENTS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_ID_MISSING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_NOT_FOUND")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_HANDLE_MISSING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_SHARED_TRIP_FAILED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setStopShareETAIntentRecipientUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFEFFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x100000000);
    self->_stopShareETAIntentRecipientUnsupportedReason = a3;
  }
}

- (BOOL)hasStopShareETAIntentRecipientUnsupportedReason
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setHasStopShareETAIntentRecipientUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (id)stopShareETAIntentRecipientUnsupportedReasonAsString:(int)a3
{
  if (a3 < 5)
    return off_1E228EA18[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStopShareETAIntentRecipientUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_RECIPIENTS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_ID_MISSING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_NOT_FOUND")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_HANDLE_MISSING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_SHARED_TRIP_FAILED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSendMessageIntentRecipientUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFDFFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x200000000);
    self->_sendMessageIntentRecipientUnsupportedReason = a3;
  }
}

- (BOOL)hasSendMessageIntentRecipientUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setHasSendMessageIntentRecipientUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (id)sendMessageIntentRecipientUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) < 0xA)
    return off_1E228EA40[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSendMessageIntentRecipientUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_ACCOUNT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGING_SERVICE_NOT_ENABLED_FOR_RECIPIENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_VALID_HANDLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUESTED_HANDLE_INVALID")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_HANDLE_FOR_LABEL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCREEN_TIME_RESTRICTION_ENABLED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_A_MEMBER_OF_CONVERSATION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOWN_TIME_RESTRICTION_ENABLED")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REQUIRING_IN_APP_AUTHENTICATION")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setSendAnnouncementIntentRecipientsUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFFBFFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x400000000);
    self->_sendAnnouncementIntentRecipientsUnsupportedReason = a3;
  }
}

- (BOOL)hasSendAnnouncementIntentRecipientsUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setHasSendAnnouncementIntentRecipientsUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (id)sendAnnouncementIntentRecipientsUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E228EA90[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSendAnnouncementIntentRecipientsUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TARGET_NOT_FOUND")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCING_TO_SELF")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEAKER_GROUPS_NOT_SUPPORTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INTERCOM_DISABLED_ON_ALL_DEVICES")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setSaveHealthSampleIntentRecordDateUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFF7FFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x800000000);
    self->_saveHealthSampleIntentRecordDateUnsupportedReason = a3;
  }
}

- (BOOL)hasSaveHealthSampleIntentRecordDateUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setHasSaveHealthSampleIntentRecordDateUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (id)saveHealthSampleIntentRecordDateUnsupportedReasonAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E228EAB0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSaveHealthSampleIntentRecordDateUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_FUTURE_DATETIME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_FUZZY_TIME")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NO_FUZZY_DATE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setTargetEventUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFEFFFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x1000000000);
    self->_targetEventUnsupportedReason = a3;
  }
}

- (BOOL)hasTargetEventUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setHasTargetEventUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (id)targetEventUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("TARGET_EVENT_NOT_FOUND");
  if (a3 == 2)
  {
    v3 = CFSTR("TARGET_EVENT_NOT_CREATED_BY_USER");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsTargetEventUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TARGET_EVENT_NOT_FOUND")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("TARGET_EVENT_NOT_CREATED_BY_USER")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setAddTasksIntentTargetTaskListMembersUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFDFFFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x2000000000);
    self->_addTasksIntentTargetTaskListMembersUnsupportedReason = a3;
  }
}

- (BOOL)hasAddTasksIntentTargetTaskListMembersUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setHasAddTasksIntentTargetTaskListMembersUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (id)addTasksIntentTargetTaskListMembersUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("NO_SHARED_LIST_WITH_CONTACT");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAddTasksIntentTargetTaskListMembersUnsupportedReason:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("NO_SHARED_LIST_WITH_CONTACT"));
  return 1;
}

- (void)setSetTimerAttributeIntentTargetTimerUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFFBFFFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x4000000000);
    self->_setTimerAttributeIntentTargetTimerUnsupportedReason = a3;
  }
}

- (BOOL)hasSetTimerAttributeIntentTargetTimerUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setHasSetTimerAttributeIntentTargetTimerUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (id)setTimerAttributeIntentTargetTimerUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("NOT_FOUND");
  if (a3 == 1)
  {
    v3 = CFSTR("NO_TIMERS");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSetTimerAttributeIntentTargetTimerUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_FOUND")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NO_TIMERS"));

  return v4;
}

- (void)setDeleteTasksIntentTaskListUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFF7FFFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x8000000000);
    self->_deleteTasksIntentTaskListUnsupportedReason = a3;
  }
}

- (BOOL)hasDeleteTasksIntentTaskListUnsupportedReason
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setHasDeleteTasksIntentTaskListUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (id)deleteTasksIntentTaskListUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("NO_TASK_LIST_FOUND");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDeleteTasksIntentTaskListUnsupportedReason:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("NO_TASK_LIST_FOUND"));
  return 1;
}

- (void)setDeleteTasksIntentTaskUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFEFFFFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x10000000000);
    self->_deleteTasksIntentTaskUnsupportedReason = a3;
  }
}

- (BOOL)hasDeleteTasksIntentTaskUnsupportedReason
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setHasDeleteTasksIntentTaskUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (id)deleteTasksIntentTaskUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("NO_TASKS_FOUND");
  if (a3 == 2)
  {
    v3 = CFSTR("NO_TASKS_IN_APP");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDeleteTasksIntentTaskUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_TASKS_FOUND")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("NO_TASKS_IN_APP")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setSnoozeTasksIntentTaskUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFDFFFFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x20000000000);
    self->_snoozeTasksIntentTaskUnsupportedReason = a3;
  }
}

- (BOOL)hasSnoozeTasksIntentTaskUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setHasSnoozeTasksIntentTaskUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (id)snoozeTasksIntentTaskUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("NO_TASKS_FOUND");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSnoozeTasksIntentTaskUnsupportedReason:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("NO_TASKS_FOUND"));
  return 1;
}

- (void)setAddTasksIntentTemporalEventTriggerUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFFBFFFFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x40000000000);
    self->_addTasksIntentTemporalEventTriggerUnsupportedReason = a3;
  }
}

- (BOOL)hasAddTasksIntentTemporalEventTriggerUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setHasAddTasksIntentTemporalEventTriggerUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (id)addTasksIntentTemporalEventTriggerUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("TIME_IN_PAST");
  if (a3 == 2)
  {
    v3 = CFSTR("INVALID_RECURRENCE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAddTasksIntentTemporalEventTriggerUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_IN_PAST")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_RECURRENCE")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFF7FFFFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x80000000000);
    self->_setTaskAttributeIntentTemporalEventTriggerUnsupportedReason = a3;
  }
}

- (BOOL)hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setHasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (id)setTaskAttributeIntentTemporalEventTriggerUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("TIME_IN_PAST");
  if (a3 == 2)
  {
    v3 = CFSTR("INVALID_RECURRENCE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_IN_PAST")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_RECURRENCE")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setRunWorkflowIntentWorkflowUnsupportedReason:(int)a3
{
  $6684D1921AA65EBAD0A930EA955AC65C has;

  has = self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has & 0xFFFFEFFFFFFFFFFFLL);
  }
  else
  {
    self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&has | 0x100000000000);
    self->_runWorkflowIntentWorkflowUnsupportedReason = a3;
  }
}

- (BOOL)hasRunWorkflowIntentWorkflowUnsupportedReason
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setHasRunWorkflowIntentWorkflowUnsupportedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($6684D1921AA65EBAD0A930EA955AC65C)(*(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (id)runWorkflowIntentWorkflowUnsupportedReasonAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("NOT_FOUND");
  if (a3 == 1)
  {
    v3 = CFSTR("NO_WORKFLOWS");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRunWorkflowIntentWorkflowUnsupportedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_FOUND")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NO_WORKFLOWS"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPayloadUnsupportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBPayloadUnsupported hasUpdateAlarmIntentAlarmUnsupportedReason](self, "hasUpdateAlarmIntentAlarmUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasChangeAlarmStatusIntentAlarmsUnsupportedReason](self, "hasChangeAlarmStatusIntentAlarmsUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasDeleteAlarmIntentAlarmsUnsupportedReason](self, "hasDeleteAlarmIntentAlarmsUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSearchAlarmIntentAlarmsUnsupportedReason](self, "hasSearchAlarmIntentAlarmsUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSnoozeAlarmIntentAlarmsUnsupportedReason](self, "hasSnoozeAlarmIntentAlarmsUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSendAnnouncementIntentAnnouncementUnsupportedReason](self, "hasSendAnnouncementIntentAnnouncementUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentCallCapabilityUnsupportedReason](self, "hasStartCallIntentCallCapabilityUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentCallRecordToCallBackUnsupportedReason](self, "hasStartCallIntentCallRecordToCallBackUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_conflictingParameters;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (-[_INPBPayloadUnsupported hasAddTasksIntentContactEventTriggerUnsupportedReason](self, "hasAddTasksIntentContactEventTriggerUnsupportedReason", v10))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentContactsUnsupportedReason](self, "hasStartCallIntentContactsUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasRequestPaymentIntentCurrencyAmountUnsupportedReason](self, "hasRequestPaymentIntentCurrencyAmountUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSendPaymentIntentCurrencyAmountUnsupportedReason](self, "hasSendPaymentIntentCurrencyAmountUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasCustomUnsupportedReason](self, "hasCustomUnsupportedReason"))
    PBDataWriterWriteUint32Field();
  if (-[_INPBPayloadUnsupported hasDateTimeRangeUnsupportedReason](self, "hasDateTimeRangeUnsupportedReason"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBPayloadUnsupported hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason](self, "hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasJoinCallIntentGroupConversationUnsupportedReason](self, "hasJoinCallIntentGroupConversationUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasReportIncidentIntentIncidentTypeUnsupportedReason](self, "hasReportIncidentIntentIncidentTypeUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasCreateTimerIntentLabelUnsupportedReason](self, "hasCreateTimerIntentLabelUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasAddMediaIntentMediaDestinationUnsupportedReason](self, "hasAddMediaIntentMediaDestinationUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasAddMediaIntentMediaItemsUnsupportedReason](self, "hasAddMediaIntentMediaItemsUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasPlayMediaIntentMediaItemsUnsupportedReason](self, "hasPlayMediaIntentMediaItemsUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSearchForMediaIntentMediaItemsUnsupportedReason](self, "hasSearchForMediaIntentMediaItemsUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason](self, "hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasParticipantUnsupportedReason](self, "hasParticipantUnsupportedReason"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBPayloadUnsupported hasAddCallParticipantIntentParticipantsUnsupportedReason](self, "hasAddCallParticipantIntentParticipantsUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSendPaymentIntentPayeeUnsupportedReason](self, "hasSendPaymentIntentPayeeUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasRequestPaymentIntentPayerUnsupportedReason](self, "hasRequestPaymentIntentPayerUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasPlayMediaIntentPlaybackSpeedUnsupportedReason](self, "hasPlayMediaIntentPlaybackSpeedUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentPreferredCallProviderUnsupportedReason](self, "hasStartCallIntentPreferredCallProviderUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasReason](self, "hasReason"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBPayloadUnsupported hasShareETAIntentRecipientUnsupportedReason](self, "hasShareETAIntentRecipientUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasStopShareETAIntentRecipientUnsupportedReason](self, "hasStopShareETAIntentRecipientUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSendMessageIntentRecipientUnsupportedReason](self, "hasSendMessageIntentRecipientUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSendAnnouncementIntentRecipientsUnsupportedReason](self, "hasSendAnnouncementIntentRecipientsUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSaveHealthSampleIntentRecordDateUnsupportedReason](self, "hasSaveHealthSampleIntentRecordDateUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasTargetEventUnsupportedReason](self, "hasTargetEventUnsupportedReason"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBPayloadUnsupported hasAddTasksIntentTargetTaskListMembersUnsupportedReason](self, "hasAddTasksIntentTargetTaskListMembersUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSetTimerAttributeIntentTargetTimerUnsupportedReason](self, "hasSetTimerAttributeIntentTargetTimerUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasDeleteTasksIntentTaskListUnsupportedReason](self, "hasDeleteTasksIntentTaskListUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasDeleteTasksIntentTaskUnsupportedReason](self, "hasDeleteTasksIntentTaskUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSnoozeTasksIntentTaskUnsupportedReason](self, "hasSnoozeTasksIntentTaskUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasAddTasksIntentTemporalEventTriggerUnsupportedReason](self, "hasAddTasksIntentTemporalEventTriggerUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadUnsupported hasRunWorkflowIntentWorkflowUnsupportedReason](self, "hasRunWorkflowIntentWorkflowUnsupportedReason"))
  {
    PBDataWriterWriteInt32Field();
  }

}

- (_INPBPayloadUnsupported)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPayloadUnsupported *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPayloadUnsupported *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPayloadUnsupported *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPayloadUnsupported initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBPayloadUnsupported data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPayloadUnsupported *v5;
  void *v6;
  _INPBPayloadUnsupported *v7;

  v5 = -[_INPBPayloadUnsupported init](+[_INPBPayloadUnsupported allocWithZone:](_INPBPayloadUnsupported, "allocWithZone:"), "init");
  if (-[_INPBPayloadUnsupported hasUpdateAlarmIntentAlarmUnsupportedReason](self, "hasUpdateAlarmIntentAlarmUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setUpdateAlarmIntentAlarmUnsupportedReason:](v5, "setUpdateAlarmIntentAlarmUnsupportedReason:", -[_INPBPayloadUnsupported updateAlarmIntentAlarmUnsupportedReason](self, "updateAlarmIntentAlarmUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasChangeAlarmStatusIntentAlarmsUnsupportedReason](self, "hasChangeAlarmStatusIntentAlarmsUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setChangeAlarmStatusIntentAlarmsUnsupportedReason:](v5, "setChangeAlarmStatusIntentAlarmsUnsupportedReason:", -[_INPBPayloadUnsupported changeAlarmStatusIntentAlarmsUnsupportedReason](self, "changeAlarmStatusIntentAlarmsUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasDeleteAlarmIntentAlarmsUnsupportedReason](self, "hasDeleteAlarmIntentAlarmsUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setDeleteAlarmIntentAlarmsUnsupportedReason:](v5, "setDeleteAlarmIntentAlarmsUnsupportedReason:", -[_INPBPayloadUnsupported deleteAlarmIntentAlarmsUnsupportedReason](self, "deleteAlarmIntentAlarmsUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSearchAlarmIntentAlarmsUnsupportedReason](self, "hasSearchAlarmIntentAlarmsUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSearchAlarmIntentAlarmsUnsupportedReason:](v5, "setSearchAlarmIntentAlarmsUnsupportedReason:", -[_INPBPayloadUnsupported searchAlarmIntentAlarmsUnsupportedReason](self, "searchAlarmIntentAlarmsUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSnoozeAlarmIntentAlarmsUnsupportedReason](self, "hasSnoozeAlarmIntentAlarmsUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSnoozeAlarmIntentAlarmsUnsupportedReason:](v5, "setSnoozeAlarmIntentAlarmsUnsupportedReason:", -[_INPBPayloadUnsupported snoozeAlarmIntentAlarmsUnsupportedReason](self, "snoozeAlarmIntentAlarmsUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSendAnnouncementIntentAnnouncementUnsupportedReason](self, "hasSendAnnouncementIntentAnnouncementUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSendAnnouncementIntentAnnouncementUnsupportedReason:](v5, "setSendAnnouncementIntentAnnouncementUnsupportedReason:", -[_INPBPayloadUnsupported sendAnnouncementIntentAnnouncementUnsupportedReason](self, "sendAnnouncementIntentAnnouncementUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentCallCapabilityUnsupportedReason](self, "hasStartCallIntentCallCapabilityUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setStartCallIntentCallCapabilityUnsupportedReason:](v5, "setStartCallIntentCallCapabilityUnsupportedReason:", -[_INPBPayloadUnsupported startCallIntentCallCapabilityUnsupportedReason](self, "startCallIntentCallCapabilityUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentCallRecordToCallBackUnsupportedReason](self, "hasStartCallIntentCallRecordToCallBackUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setStartCallIntentCallRecordToCallBackUnsupportedReason:](v5, "setStartCallIntentCallRecordToCallBackUnsupportedReason:", -[_INPBPayloadUnsupported startCallIntentCallRecordToCallBackUnsupportedReason](self, "startCallIntentCallRecordToCallBackUnsupportedReason"));
  }
  v6 = (void *)-[NSArray copyWithZone:](self->_conflictingParameters, "copyWithZone:", a3);
  -[_INPBPayloadUnsupported setConflictingParameters:](v5, "setConflictingParameters:", v6);

  if (-[_INPBPayloadUnsupported hasAddTasksIntentContactEventTriggerUnsupportedReason](self, "hasAddTasksIntentContactEventTriggerUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setAddTasksIntentContactEventTriggerUnsupportedReason:](v5, "setAddTasksIntentContactEventTriggerUnsupportedReason:", -[_INPBPayloadUnsupported addTasksIntentContactEventTriggerUnsupportedReason](self, "addTasksIntentContactEventTriggerUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSetTaskAttributeIntentContactEventTriggerUnsupportedReason:](v5, "setSetTaskAttributeIntentContactEventTriggerUnsupportedReason:", -[_INPBPayloadUnsupported setTaskAttributeIntentContactEventTriggerUnsupportedReason](self, "setTaskAttributeIntentContactEventTriggerUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentContactsUnsupportedReason](self, "hasStartCallIntentContactsUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setStartCallIntentContactsUnsupportedReason:](v5, "setStartCallIntentContactsUnsupportedReason:", -[_INPBPayloadUnsupported startCallIntentContactsUnsupportedReason](self, "startCallIntentContactsUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasRequestPaymentIntentCurrencyAmountUnsupportedReason](self, "hasRequestPaymentIntentCurrencyAmountUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setRequestPaymentIntentCurrencyAmountUnsupportedReason:](v5, "setRequestPaymentIntentCurrencyAmountUnsupportedReason:", -[_INPBPayloadUnsupported requestPaymentIntentCurrencyAmountUnsupportedReason](self, "requestPaymentIntentCurrencyAmountUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSendPaymentIntentCurrencyAmountUnsupportedReason](self, "hasSendPaymentIntentCurrencyAmountUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSendPaymentIntentCurrencyAmountUnsupportedReason:](v5, "setSendPaymentIntentCurrencyAmountUnsupportedReason:", -[_INPBPayloadUnsupported sendPaymentIntentCurrencyAmountUnsupportedReason](self, "sendPaymentIntentCurrencyAmountUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasCustomUnsupportedReason](self, "hasCustomUnsupportedReason"))
    -[_INPBPayloadUnsupported setCustomUnsupportedReason:](v5, "setCustomUnsupportedReason:", -[_INPBPayloadUnsupported customUnsupportedReason](self, "customUnsupportedReason"));
  if (-[_INPBPayloadUnsupported hasDateTimeRangeUnsupportedReason](self, "hasDateTimeRangeUnsupportedReason"))
    -[_INPBPayloadUnsupported setDateTimeRangeUnsupportedReason:](v5, "setDateTimeRangeUnsupportedReason:", -[_INPBPayloadUnsupported dateTimeRangeUnsupportedReason](self, "dateTimeRangeUnsupportedReason"));
  if (-[_INPBPayloadUnsupported hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason](self, "hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setFindDeviceAndPlaySoundIntentDeviceUnsupportedReason:](v5, "setFindDeviceAndPlaySoundIntentDeviceUnsupportedReason:", -[_INPBPayloadUnsupported findDeviceAndPlaySoundIntentDeviceUnsupportedReason](self, "findDeviceAndPlaySoundIntentDeviceUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasJoinCallIntentGroupConversationUnsupportedReason](self, "hasJoinCallIntentGroupConversationUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setJoinCallIntentGroupConversationUnsupportedReason:](v5, "setJoinCallIntentGroupConversationUnsupportedReason:", -[_INPBPayloadUnsupported joinCallIntentGroupConversationUnsupportedReason](self, "joinCallIntentGroupConversationUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasReportIncidentIntentIncidentTypeUnsupportedReason](self, "hasReportIncidentIntentIncidentTypeUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setReportIncidentIntentIncidentTypeUnsupportedReason:](v5, "setReportIncidentIntentIncidentTypeUnsupportedReason:", -[_INPBPayloadUnsupported reportIncidentIntentIncidentTypeUnsupportedReason](self, "reportIncidentIntentIncidentTypeUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasCreateTimerIntentLabelUnsupportedReason](self, "hasCreateTimerIntentLabelUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setCreateTimerIntentLabelUnsupportedReason:](v5, "setCreateTimerIntentLabelUnsupportedReason:", -[_INPBPayloadUnsupported createTimerIntentLabelUnsupportedReason](self, "createTimerIntentLabelUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasAddMediaIntentMediaDestinationUnsupportedReason](self, "hasAddMediaIntentMediaDestinationUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setAddMediaIntentMediaDestinationUnsupportedReason:](v5, "setAddMediaIntentMediaDestinationUnsupportedReason:", -[_INPBPayloadUnsupported addMediaIntentMediaDestinationUnsupportedReason](self, "addMediaIntentMediaDestinationUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasAddMediaIntentMediaItemsUnsupportedReason](self, "hasAddMediaIntentMediaItemsUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setAddMediaIntentMediaItemsUnsupportedReason:](v5, "setAddMediaIntentMediaItemsUnsupportedReason:", -[_INPBPayloadUnsupported addMediaIntentMediaItemsUnsupportedReason](self, "addMediaIntentMediaItemsUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasPlayMediaIntentMediaItemsUnsupportedReason](self, "hasPlayMediaIntentMediaItemsUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setPlayMediaIntentMediaItemsUnsupportedReason:](v5, "setPlayMediaIntentMediaItemsUnsupportedReason:", -[_INPBPayloadUnsupported playMediaIntentMediaItemsUnsupportedReason](self, "playMediaIntentMediaItemsUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSearchForMediaIntentMediaItemsUnsupportedReason](self, "hasSearchForMediaIntentMediaItemsUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSearchForMediaIntentMediaItemsUnsupportedReason:](v5, "setSearchForMediaIntentMediaItemsUnsupportedReason:", -[_INPBPayloadUnsupported searchForMediaIntentMediaItemsUnsupportedReason](self, "searchForMediaIntentMediaItemsUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason](self, "hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setUpdateMediaAffinityIntentMediaItemsUnsupportedReason:](v5, "setUpdateMediaAffinityIntentMediaItemsUnsupportedReason:", -[_INPBPayloadUnsupported updateMediaAffinityIntentMediaItemsUnsupportedReason](self, "updateMediaAffinityIntentMediaItemsUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasParticipantUnsupportedReason](self, "hasParticipantUnsupportedReason"))
    -[_INPBPayloadUnsupported setParticipantUnsupportedReason:](v5, "setParticipantUnsupportedReason:", -[_INPBPayloadUnsupported participantUnsupportedReason](self, "participantUnsupportedReason"));
  if (-[_INPBPayloadUnsupported hasAddCallParticipantIntentParticipantsUnsupportedReason](self, "hasAddCallParticipantIntentParticipantsUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setAddCallParticipantIntentParticipantsUnsupportedReason:](v5, "setAddCallParticipantIntentParticipantsUnsupportedReason:", -[_INPBPayloadUnsupported addCallParticipantIntentParticipantsUnsupportedReason](self, "addCallParticipantIntentParticipantsUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSendPaymentIntentPayeeUnsupportedReason](self, "hasSendPaymentIntentPayeeUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSendPaymentIntentPayeeUnsupportedReason:](v5, "setSendPaymentIntentPayeeUnsupportedReason:", -[_INPBPayloadUnsupported sendPaymentIntentPayeeUnsupportedReason](self, "sendPaymentIntentPayeeUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasRequestPaymentIntentPayerUnsupportedReason](self, "hasRequestPaymentIntentPayerUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setRequestPaymentIntentPayerUnsupportedReason:](v5, "setRequestPaymentIntentPayerUnsupportedReason:", -[_INPBPayloadUnsupported requestPaymentIntentPayerUnsupportedReason](self, "requestPaymentIntentPayerUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasPlayMediaIntentPlaybackSpeedUnsupportedReason](self, "hasPlayMediaIntentPlaybackSpeedUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setPlayMediaIntentPlaybackSpeedUnsupportedReason:](v5, "setPlayMediaIntentPlaybackSpeedUnsupportedReason:", -[_INPBPayloadUnsupported playMediaIntentPlaybackSpeedUnsupportedReason](self, "playMediaIntentPlaybackSpeedUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentPreferredCallProviderUnsupportedReason](self, "hasStartCallIntentPreferredCallProviderUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setStartCallIntentPreferredCallProviderUnsupportedReason:](v5, "setStartCallIntentPreferredCallProviderUnsupportedReason:", -[_INPBPayloadUnsupported startCallIntentPreferredCallProviderUnsupportedReason](self, "startCallIntentPreferredCallProviderUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasReason](self, "hasReason"))
    -[_INPBPayloadUnsupported setReason:](v5, "setReason:", -[_INPBPayloadUnsupported reason](self, "reason"));
  if (-[_INPBPayloadUnsupported hasShareETAIntentRecipientUnsupportedReason](self, "hasShareETAIntentRecipientUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setShareETAIntentRecipientUnsupportedReason:](v5, "setShareETAIntentRecipientUnsupportedReason:", -[_INPBPayloadUnsupported shareETAIntentRecipientUnsupportedReason](self, "shareETAIntentRecipientUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasStopShareETAIntentRecipientUnsupportedReason](self, "hasStopShareETAIntentRecipientUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setStopShareETAIntentRecipientUnsupportedReason:](v5, "setStopShareETAIntentRecipientUnsupportedReason:", -[_INPBPayloadUnsupported stopShareETAIntentRecipientUnsupportedReason](self, "stopShareETAIntentRecipientUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSendMessageIntentRecipientUnsupportedReason](self, "hasSendMessageIntentRecipientUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSendMessageIntentRecipientUnsupportedReason:](v5, "setSendMessageIntentRecipientUnsupportedReason:", -[_INPBPayloadUnsupported sendMessageIntentRecipientUnsupportedReason](self, "sendMessageIntentRecipientUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSendAnnouncementIntentRecipientsUnsupportedReason](self, "hasSendAnnouncementIntentRecipientsUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSendAnnouncementIntentRecipientsUnsupportedReason:](v5, "setSendAnnouncementIntentRecipientsUnsupportedReason:", -[_INPBPayloadUnsupported sendAnnouncementIntentRecipientsUnsupportedReason](self, "sendAnnouncementIntentRecipientsUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSaveHealthSampleIntentRecordDateUnsupportedReason](self, "hasSaveHealthSampleIntentRecordDateUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSaveHealthSampleIntentRecordDateUnsupportedReason:](v5, "setSaveHealthSampleIntentRecordDateUnsupportedReason:", -[_INPBPayloadUnsupported saveHealthSampleIntentRecordDateUnsupportedReason](self, "saveHealthSampleIntentRecordDateUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasTargetEventUnsupportedReason](self, "hasTargetEventUnsupportedReason"))
    -[_INPBPayloadUnsupported setTargetEventUnsupportedReason:](v5, "setTargetEventUnsupportedReason:", -[_INPBPayloadUnsupported targetEventUnsupportedReason](self, "targetEventUnsupportedReason"));
  if (-[_INPBPayloadUnsupported hasAddTasksIntentTargetTaskListMembersUnsupportedReason](self, "hasAddTasksIntentTargetTaskListMembersUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setAddTasksIntentTargetTaskListMembersUnsupportedReason:](v5, "setAddTasksIntentTargetTaskListMembersUnsupportedReason:", -[_INPBPayloadUnsupported addTasksIntentTargetTaskListMembersUnsupportedReason](self, "addTasksIntentTargetTaskListMembersUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSetTimerAttributeIntentTargetTimerUnsupportedReason](self, "hasSetTimerAttributeIntentTargetTimerUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSetTimerAttributeIntentTargetTimerUnsupportedReason:](v5, "setSetTimerAttributeIntentTargetTimerUnsupportedReason:", -[_INPBPayloadUnsupported setTimerAttributeIntentTargetTimerUnsupportedReason](self, "setTimerAttributeIntentTargetTimerUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasDeleteTasksIntentTaskListUnsupportedReason](self, "hasDeleteTasksIntentTaskListUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setDeleteTasksIntentTaskListUnsupportedReason:](v5, "setDeleteTasksIntentTaskListUnsupportedReason:", -[_INPBPayloadUnsupported deleteTasksIntentTaskListUnsupportedReason](self, "deleteTasksIntentTaskListUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasDeleteTasksIntentTaskUnsupportedReason](self, "hasDeleteTasksIntentTaskUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setDeleteTasksIntentTaskUnsupportedReason:](v5, "setDeleteTasksIntentTaskUnsupportedReason:", -[_INPBPayloadUnsupported deleteTasksIntentTaskUnsupportedReason](self, "deleteTasksIntentTaskUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSnoozeTasksIntentTaskUnsupportedReason](self, "hasSnoozeTasksIntentTaskUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSnoozeTasksIntentTaskUnsupportedReason:](v5, "setSnoozeTasksIntentTaskUnsupportedReason:", -[_INPBPayloadUnsupported snoozeTasksIntentTaskUnsupportedReason](self, "snoozeTasksIntentTaskUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasAddTasksIntentTemporalEventTriggerUnsupportedReason](self, "hasAddTasksIntentTemporalEventTriggerUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setAddTasksIntentTemporalEventTriggerUnsupportedReason:](v5, "setAddTasksIntentTemporalEventTriggerUnsupportedReason:", -[_INPBPayloadUnsupported addTasksIntentTemporalEventTriggerUnsupportedReason](self, "addTasksIntentTemporalEventTriggerUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason:](v5, "setSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason:", -[_INPBPayloadUnsupported setTaskAttributeIntentTemporalEventTriggerUnsupportedReason](self, "setTaskAttributeIntentTemporalEventTriggerUnsupportedReason"));
  }
  if (-[_INPBPayloadUnsupported hasRunWorkflowIntentWorkflowUnsupportedReason](self, "hasRunWorkflowIntentWorkflowUnsupportedReason"))
  {
    -[_INPBPayloadUnsupported setRunWorkflowIntentWorkflowUnsupportedReason:](v5, "setRunWorkflowIntentWorkflowUnsupportedReason:", -[_INPBPayloadUnsupported runWorkflowIntentWorkflowUnsupportedReason](self, "runWorkflowIntentWorkflowUnsupportedReason"));
  }
  v7 = v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int updateAlarmIntentAlarmUnsupportedReason;
  int v7;
  int changeAlarmStatusIntentAlarmsUnsupportedReason;
  int v9;
  int deleteAlarmIntentAlarmsUnsupportedReason;
  int v11;
  int searchAlarmIntentAlarmsUnsupportedReason;
  int v13;
  int snoozeAlarmIntentAlarmsUnsupportedReason;
  int v15;
  int sendAnnouncementIntentAnnouncementUnsupportedReason;
  int v17;
  int startCallIntentCallCapabilityUnsupportedReason;
  int v19;
  int startCallIntentCallRecordToCallBackUnsupportedReason;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  int addTasksIntentContactEventTriggerUnsupportedReason;
  int v31;
  int setTaskAttributeIntentContactEventTriggerUnsupportedReason;
  int v33;
  int startCallIntentContactsUnsupportedReason;
  int v35;
  int requestPaymentIntentCurrencyAmountUnsupportedReason;
  int v37;
  int sendPaymentIntentCurrencyAmountUnsupportedReason;
  int v39;
  unsigned int customUnsupportedReason;
  int v41;
  int dateTimeRangeUnsupportedReason;
  int v43;
  int findDeviceAndPlaySoundIntentDeviceUnsupportedReason;
  int v45;
  int joinCallIntentGroupConversationUnsupportedReason;
  int v47;
  int reportIncidentIntentIncidentTypeUnsupportedReason;
  int v49;
  int createTimerIntentLabelUnsupportedReason;
  int v51;
  int addMediaIntentMediaDestinationUnsupportedReason;
  int v53;
  int addMediaIntentMediaItemsUnsupportedReason;
  int v55;
  int playMediaIntentMediaItemsUnsupportedReason;
  int v57;
  int searchForMediaIntentMediaItemsUnsupportedReason;
  int v59;
  int updateMediaAffinityIntentMediaItemsUnsupportedReason;
  int v61;
  int participantUnsupportedReason;
  int v63;
  int addCallParticipantIntentParticipantsUnsupportedReason;
  int v65;
  int sendPaymentIntentPayeeUnsupportedReason;
  int v67;
  int requestPaymentIntentPayerUnsupportedReason;
  int v69;
  int playMediaIntentPlaybackSpeedUnsupportedReason;
  int v71;
  int startCallIntentPreferredCallProviderUnsupportedReason;
  int v73;
  int reason;
  int v75;
  int shareETAIntentRecipientUnsupportedReason;
  int v77;
  int stopShareETAIntentRecipientUnsupportedReason;
  int v79;
  int sendMessageIntentRecipientUnsupportedReason;
  int v81;
  int sendAnnouncementIntentRecipientsUnsupportedReason;
  int v83;
  int saveHealthSampleIntentRecordDateUnsupportedReason;
  int v85;
  int targetEventUnsupportedReason;
  int v87;
  int addTasksIntentTargetTaskListMembersUnsupportedReason;
  int v89;
  int setTimerAttributeIntentTargetTimerUnsupportedReason;
  int v91;
  int deleteTasksIntentTaskListUnsupportedReason;
  int v93;
  int deleteTasksIntentTaskUnsupportedReason;
  int v95;
  int snoozeTasksIntentTaskUnsupportedReason;
  int v97;
  int addTasksIntentTemporalEventTriggerUnsupportedReason;
  int v99;
  int setTaskAttributeIntentTemporalEventTriggerUnsupportedReason;
  int v101;
  BOOL v102;
  int runWorkflowIntentWorkflowUnsupportedReason;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_185;
  v5 = -[_INPBPayloadUnsupported hasUpdateAlarmIntentAlarmUnsupportedReason](self, "hasUpdateAlarmIntentAlarmUnsupportedReason");
  if (v5 != objc_msgSend(v4, "hasUpdateAlarmIntentAlarmUnsupportedReason"))
    goto LABEL_185;
  if (-[_INPBPayloadUnsupported hasUpdateAlarmIntentAlarmUnsupportedReason](self, "hasUpdateAlarmIntentAlarmUnsupportedReason"))
  {
    if (objc_msgSend(v4, "hasUpdateAlarmIntentAlarmUnsupportedReason"))
    {
      updateAlarmIntentAlarmUnsupportedReason = self->_updateAlarmIntentAlarmUnsupportedReason;
      if (updateAlarmIntentAlarmUnsupportedReason != objc_msgSend(v4, "updateAlarmIntentAlarmUnsupportedReason"))goto LABEL_185;
    }
  }
  v7 = -[_INPBPayloadUnsupported hasChangeAlarmStatusIntentAlarmsUnsupportedReason](self, "hasChangeAlarmStatusIntentAlarmsUnsupportedReason");
  if (v7 != objc_msgSend(v4, "hasChangeAlarmStatusIntentAlarmsUnsupportedReason"))
    goto LABEL_185;
  if (-[_INPBPayloadUnsupported hasChangeAlarmStatusIntentAlarmsUnsupportedReason](self, "hasChangeAlarmStatusIntentAlarmsUnsupportedReason"))
  {
    if (objc_msgSend(v4, "hasChangeAlarmStatusIntentAlarmsUnsupportedReason"))
    {
      changeAlarmStatusIntentAlarmsUnsupportedReason = self->_changeAlarmStatusIntentAlarmsUnsupportedReason;
      if (changeAlarmStatusIntentAlarmsUnsupportedReason != objc_msgSend(v4, "changeAlarmStatusIntentAlarmsUnsupportedReason"))goto LABEL_185;
    }
  }
  v9 = -[_INPBPayloadUnsupported hasDeleteAlarmIntentAlarmsUnsupportedReason](self, "hasDeleteAlarmIntentAlarmsUnsupportedReason");
  if (v9 != objc_msgSend(v4, "hasDeleteAlarmIntentAlarmsUnsupportedReason"))
    goto LABEL_185;
  if (-[_INPBPayloadUnsupported hasDeleteAlarmIntentAlarmsUnsupportedReason](self, "hasDeleteAlarmIntentAlarmsUnsupportedReason"))
  {
    if (objc_msgSend(v4, "hasDeleteAlarmIntentAlarmsUnsupportedReason"))
    {
      deleteAlarmIntentAlarmsUnsupportedReason = self->_deleteAlarmIntentAlarmsUnsupportedReason;
      if (deleteAlarmIntentAlarmsUnsupportedReason != objc_msgSend(v4, "deleteAlarmIntentAlarmsUnsupportedReason"))goto LABEL_185;
    }
  }
  v11 = -[_INPBPayloadUnsupported hasSearchAlarmIntentAlarmsUnsupportedReason](self, "hasSearchAlarmIntentAlarmsUnsupportedReason");
  if (v11 != objc_msgSend(v4, "hasSearchAlarmIntentAlarmsUnsupportedReason"))
    goto LABEL_185;
  if (-[_INPBPayloadUnsupported hasSearchAlarmIntentAlarmsUnsupportedReason](self, "hasSearchAlarmIntentAlarmsUnsupportedReason"))
  {
    if (objc_msgSend(v4, "hasSearchAlarmIntentAlarmsUnsupportedReason"))
    {
      searchAlarmIntentAlarmsUnsupportedReason = self->_searchAlarmIntentAlarmsUnsupportedReason;
      if (searchAlarmIntentAlarmsUnsupportedReason != objc_msgSend(v4, "searchAlarmIntentAlarmsUnsupportedReason"))goto LABEL_185;
    }
  }
  v13 = -[_INPBPayloadUnsupported hasSnoozeAlarmIntentAlarmsUnsupportedReason](self, "hasSnoozeAlarmIntentAlarmsUnsupportedReason");
  if (v13 != objc_msgSend(v4, "hasSnoozeAlarmIntentAlarmsUnsupportedReason"))
    goto LABEL_185;
  if (-[_INPBPayloadUnsupported hasSnoozeAlarmIntentAlarmsUnsupportedReason](self, "hasSnoozeAlarmIntentAlarmsUnsupportedReason"))
  {
    if (objc_msgSend(v4, "hasSnoozeAlarmIntentAlarmsUnsupportedReason"))
    {
      snoozeAlarmIntentAlarmsUnsupportedReason = self->_snoozeAlarmIntentAlarmsUnsupportedReason;
      if (snoozeAlarmIntentAlarmsUnsupportedReason != objc_msgSend(v4, "snoozeAlarmIntentAlarmsUnsupportedReason"))goto LABEL_185;
    }
  }
  v15 = -[_INPBPayloadUnsupported hasSendAnnouncementIntentAnnouncementUnsupportedReason](self, "hasSendAnnouncementIntentAnnouncementUnsupportedReason");
  if (v15 != objc_msgSend(v4, "hasSendAnnouncementIntentAnnouncementUnsupportedReason"))
    goto LABEL_185;
  if (-[_INPBPayloadUnsupported hasSendAnnouncementIntentAnnouncementUnsupportedReason](self, "hasSendAnnouncementIntentAnnouncementUnsupportedReason"))
  {
    if (objc_msgSend(v4, "hasSendAnnouncementIntentAnnouncementUnsupportedReason"))
    {
      sendAnnouncementIntentAnnouncementUnsupportedReason = self->_sendAnnouncementIntentAnnouncementUnsupportedReason;
      if (sendAnnouncementIntentAnnouncementUnsupportedReason != objc_msgSend(v4, "sendAnnouncementIntentAnnouncementUnsupportedReason"))goto LABEL_185;
    }
  }
  v17 = -[_INPBPayloadUnsupported hasStartCallIntentCallCapabilityUnsupportedReason](self, "hasStartCallIntentCallCapabilityUnsupportedReason");
  if (v17 != objc_msgSend(v4, "hasStartCallIntentCallCapabilityUnsupportedReason"))
    goto LABEL_185;
  if (-[_INPBPayloadUnsupported hasStartCallIntentCallCapabilityUnsupportedReason](self, "hasStartCallIntentCallCapabilityUnsupportedReason"))
  {
    if (objc_msgSend(v4, "hasStartCallIntentCallCapabilityUnsupportedReason"))
    {
      startCallIntentCallCapabilityUnsupportedReason = self->_startCallIntentCallCapabilityUnsupportedReason;
      if (startCallIntentCallCapabilityUnsupportedReason != objc_msgSend(v4, "startCallIntentCallCapabilityUnsupportedReason"))goto LABEL_185;
    }
  }
  v19 = -[_INPBPayloadUnsupported hasStartCallIntentCallRecordToCallBackUnsupportedReason](self, "hasStartCallIntentCallRecordToCallBackUnsupportedReason");
  if (v19 != objc_msgSend(v4, "hasStartCallIntentCallRecordToCallBackUnsupportedReason"))
    goto LABEL_185;
  if (-[_INPBPayloadUnsupported hasStartCallIntentCallRecordToCallBackUnsupportedReason](self, "hasStartCallIntentCallRecordToCallBackUnsupportedReason"))
  {
    if (objc_msgSend(v4, "hasStartCallIntentCallRecordToCallBackUnsupportedReason"))
    {
      startCallIntentCallRecordToCallBackUnsupportedReason = self->_startCallIntentCallRecordToCallBackUnsupportedReason;
      if (startCallIntentCallRecordToCallBackUnsupportedReason != objc_msgSend(v4, "startCallIntentCallRecordToCallBackUnsupportedReason"))goto LABEL_185;
    }
  }
  -[_INPBPayloadUnsupported conflictingParameters](self, "conflictingParameters");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conflictingParameters");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if ((v21 == 0) != (v22 != 0))
  {
    -[_INPBPayloadUnsupported conflictingParameters](self, "conflictingParameters");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      -[_INPBPayloadUnsupported conflictingParameters](self, "conflictingParameters");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "conflictingParameters");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if (!v28)
        goto LABEL_185;
    }
    else
    {

    }
    v29 = -[_INPBPayloadUnsupported hasAddTasksIntentContactEventTriggerUnsupportedReason](self, "hasAddTasksIntentContactEventTriggerUnsupportedReason");
    if (v29 == objc_msgSend(v4, "hasAddTasksIntentContactEventTriggerUnsupportedReason"))
    {
      if (!-[_INPBPayloadUnsupported hasAddTasksIntentContactEventTriggerUnsupportedReason](self, "hasAddTasksIntentContactEventTriggerUnsupportedReason")|| !objc_msgSend(v4, "hasAddTasksIntentContactEventTriggerUnsupportedReason")|| (addTasksIntentContactEventTriggerUnsupportedReason = self->_addTasksIntentContactEventTriggerUnsupportedReason, addTasksIntentContactEventTriggerUnsupportedReason == objc_msgSend(v4, "addTasksIntentContactEventTriggerUnsupportedReason")))
      {
        v31 = -[_INPBPayloadUnsupported hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason");
        if (v31 == objc_msgSend(v4, "hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason"))
        {
          if (!-[_INPBPayloadUnsupported hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason")|| !objc_msgSend(v4, "hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason")|| (setTaskAttributeIntentContactEventTriggerUnsupportedReason = self->_setTaskAttributeIntentContactEventTriggerUnsupportedReason, setTaskAttributeIntentContactEventTriggerUnsupportedReason == objc_msgSend(v4, "setTaskAttributeIntentContactEventTriggerUnsupportedReason")))
          {
            v33 = -[_INPBPayloadUnsupported hasStartCallIntentContactsUnsupportedReason](self, "hasStartCallIntentContactsUnsupportedReason");
            if (v33 == objc_msgSend(v4, "hasStartCallIntentContactsUnsupportedReason"))
            {
              if (!-[_INPBPayloadUnsupported hasStartCallIntentContactsUnsupportedReason](self, "hasStartCallIntentContactsUnsupportedReason")|| !objc_msgSend(v4, "hasStartCallIntentContactsUnsupportedReason")|| (startCallIntentContactsUnsupportedReason = self->_startCallIntentContactsUnsupportedReason, startCallIntentContactsUnsupportedReason == objc_msgSend(v4, "startCallIntentContactsUnsupportedReason")))
              {
                v35 = -[_INPBPayloadUnsupported hasRequestPaymentIntentCurrencyAmountUnsupportedReason](self, "hasRequestPaymentIntentCurrencyAmountUnsupportedReason");
                if (v35 == objc_msgSend(v4, "hasRequestPaymentIntentCurrencyAmountUnsupportedReason"))
                {
                  if (!-[_INPBPayloadUnsupported hasRequestPaymentIntentCurrencyAmountUnsupportedReason](self, "hasRequestPaymentIntentCurrencyAmountUnsupportedReason")|| !objc_msgSend(v4, "hasRequestPaymentIntentCurrencyAmountUnsupportedReason")|| (requestPaymentIntentCurrencyAmountUnsupportedReason = self->_requestPaymentIntentCurrencyAmountUnsupportedReason, requestPaymentIntentCurrencyAmountUnsupportedReason == objc_msgSend(v4, "requestPaymentIntentCurrencyAmountUnsupportedReason")))
                  {
                    v37 = -[_INPBPayloadUnsupported hasSendPaymentIntentCurrencyAmountUnsupportedReason](self, "hasSendPaymentIntentCurrencyAmountUnsupportedReason");
                    if (v37 == objc_msgSend(v4, "hasSendPaymentIntentCurrencyAmountUnsupportedReason"))
                    {
                      if (!-[_INPBPayloadUnsupported hasSendPaymentIntentCurrencyAmountUnsupportedReason](self, "hasSendPaymentIntentCurrencyAmountUnsupportedReason")|| !objc_msgSend(v4, "hasSendPaymentIntentCurrencyAmountUnsupportedReason")|| (sendPaymentIntentCurrencyAmountUnsupportedReason = self->_sendPaymentIntentCurrencyAmountUnsupportedReason, sendPaymentIntentCurrencyAmountUnsupportedReason == objc_msgSend(v4, "sendPaymentIntentCurrencyAmountUnsupportedReason")))
                      {
                        v39 = -[_INPBPayloadUnsupported hasCustomUnsupportedReason](self, "hasCustomUnsupportedReason");
                        if (v39 == objc_msgSend(v4, "hasCustomUnsupportedReason"))
                        {
                          if (!-[_INPBPayloadUnsupported hasCustomUnsupportedReason](self, "hasCustomUnsupportedReason")|| !objc_msgSend(v4, "hasCustomUnsupportedReason")|| (customUnsupportedReason = self->_customUnsupportedReason, customUnsupportedReason == objc_msgSend(v4, "customUnsupportedReason")))
                          {
                            v41 = -[_INPBPayloadUnsupported hasDateTimeRangeUnsupportedReason](self, "hasDateTimeRangeUnsupportedReason");
                            if (v41 == objc_msgSend(v4, "hasDateTimeRangeUnsupportedReason"))
                            {
                              if (!-[_INPBPayloadUnsupported hasDateTimeRangeUnsupportedReason](self, "hasDateTimeRangeUnsupportedReason")|| !objc_msgSend(v4, "hasDateTimeRangeUnsupportedReason")|| (dateTimeRangeUnsupportedReason = self->_dateTimeRangeUnsupportedReason, dateTimeRangeUnsupportedReason == objc_msgSend(v4, "dateTimeRangeUnsupportedReason")))
                              {
                                v43 = -[_INPBPayloadUnsupported hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason](self, "hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason");
                                if (v43 == objc_msgSend(v4, "hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason"))
                                {
                                  if (!-[_INPBPayloadUnsupported hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason](self, "hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason")|| !objc_msgSend(v4, "hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason")|| (findDeviceAndPlaySoundIntentDeviceUnsupportedReason = self->_findDeviceAndPlaySoundIntentDeviceUnsupportedReason, findDeviceAndPlaySoundIntentDeviceUnsupportedReason == objc_msgSend(v4, "findDeviceAndPlaySoundIntentDeviceUnsupportedReason")))
                                  {
                                    v45 = -[_INPBPayloadUnsupported hasJoinCallIntentGroupConversationUnsupportedReason](self, "hasJoinCallIntentGroupConversationUnsupportedReason");
                                    if (v45 == objc_msgSend(v4, "hasJoinCallIntentGroupConversationUnsupportedReason"))
                                    {
                                      if (!-[_INPBPayloadUnsupported hasJoinCallIntentGroupConversationUnsupportedReason](self, "hasJoinCallIntentGroupConversationUnsupportedReason")|| !objc_msgSend(v4, "hasJoinCallIntentGroupConversationUnsupportedReason")|| (joinCallIntentGroupConversationUnsupportedReason = self->_joinCallIntentGroupConversationUnsupportedReason, joinCallIntentGroupConversationUnsupportedReason == objc_msgSend(v4, "joinCallIntentGroupConversationUnsupportedReason")))
                                      {
                                        v47 = -[_INPBPayloadUnsupported hasReportIncidentIntentIncidentTypeUnsupportedReason](self, "hasReportIncidentIntentIncidentTypeUnsupportedReason");
                                        if (v47 == objc_msgSend(v4, "hasReportIncidentIntentIncidentTypeUnsupportedReason"))
                                        {
                                          if (!-[_INPBPayloadUnsupported hasReportIncidentIntentIncidentTypeUnsupportedReason](self, "hasReportIncidentIntentIncidentTypeUnsupportedReason")|| !objc_msgSend(v4, "hasReportIncidentIntentIncidentTypeUnsupportedReason")|| (reportIncidentIntentIncidentTypeUnsupportedReason = self->_reportIncidentIntentIncidentTypeUnsupportedReason, reportIncidentIntentIncidentTypeUnsupportedReason == objc_msgSend(v4, "reportIncidentIntentIncidentTypeUnsupportedReason")))
                                          {
                                            v49 = -[_INPBPayloadUnsupported hasCreateTimerIntentLabelUnsupportedReason](self, "hasCreateTimerIntentLabelUnsupportedReason");
                                            if (v49 == objc_msgSend(v4, "hasCreateTimerIntentLabelUnsupportedReason"))
                                            {
                                              if (!-[_INPBPayloadUnsupported hasCreateTimerIntentLabelUnsupportedReason](self, "hasCreateTimerIntentLabelUnsupportedReason")|| !objc_msgSend(v4, "hasCreateTimerIntentLabelUnsupportedReason")|| (createTimerIntentLabelUnsupportedReason = self->_createTimerIntentLabelUnsupportedReason, createTimerIntentLabelUnsupportedReason == objc_msgSend(v4, "createTimerIntentLabelUnsupportedReason")))
                                              {
                                                v51 = -[_INPBPayloadUnsupported hasAddMediaIntentMediaDestinationUnsupportedReason](self, "hasAddMediaIntentMediaDestinationUnsupportedReason");
                                                if (v51 == objc_msgSend(v4, "hasAddMediaIntentMediaDestinationUnsupportedReason"))
                                                {
                                                  if (!-[_INPBPayloadUnsupported hasAddMediaIntentMediaDestinationUnsupportedReason](self, "hasAddMediaIntentMediaDestinationUnsupportedReason")|| !objc_msgSend(v4, "hasAddMediaIntentMediaDestinationUnsupportedReason")|| (addMediaIntentMediaDestinationUnsupportedReason = self->_addMediaIntentMediaDestinationUnsupportedReason, addMediaIntentMediaDestinationUnsupportedReason == objc_msgSend(v4, "addMediaIntentMediaDestinationUnsupportedReason")))
                                                  {
                                                    v53 = -[_INPBPayloadUnsupported hasAddMediaIntentMediaItemsUnsupportedReason](self, "hasAddMediaIntentMediaItemsUnsupportedReason");
                                                    if (v53 == objc_msgSend(v4, "hasAddMediaIntentMediaItemsUnsupportedReason"))
                                                    {
                                                      if (!-[_INPBPayloadUnsupported hasAddMediaIntentMediaItemsUnsupportedReason](self, "hasAddMediaIntentMediaItemsUnsupportedReason")|| !objc_msgSend(v4, "hasAddMediaIntentMediaItemsUnsupportedReason")|| (addMediaIntentMediaItemsUnsupportedReason = self->_addMediaIntentMediaItemsUnsupportedReason, addMediaIntentMediaItemsUnsupportedReason == objc_msgSend(v4, "addMediaIntentMediaItemsUnsupportedReason")))
                                                      {
                                                        v55 = -[_INPBPayloadUnsupported hasPlayMediaIntentMediaItemsUnsupportedReason](self, "hasPlayMediaIntentMediaItemsUnsupportedReason");
                                                        if (v55 == objc_msgSend(v4, "hasPlayMediaIntentMediaItemsUnsupportedReason"))
                                                        {
                                                          if (!-[_INPBPayloadUnsupported hasPlayMediaIntentMediaItemsUnsupportedReason](self, "hasPlayMediaIntentMediaItemsUnsupportedReason")|| !objc_msgSend(v4, "hasPlayMediaIntentMediaItemsUnsupportedReason")|| (playMediaIntentMediaItemsUnsupportedReason = self->_playMediaIntentMediaItemsUnsupportedReason, playMediaIntentMediaItemsUnsupportedReason == objc_msgSend(v4, "playMediaIntentMediaItemsUnsupportedReason")))
                                                          {
                                                            v57 = -[_INPBPayloadUnsupported hasSearchForMediaIntentMediaItemsUnsupportedReason](self, "hasSearchForMediaIntentMediaItemsUnsupportedReason");
                                                            if (v57 == objc_msgSend(v4, "hasSearchForMediaIntentMediaItemsUnsupportedReason"))
                                                            {
                                                              if (!-[_INPBPayloadUnsupported hasSearchForMediaIntentMediaItemsUnsupportedReason](self, "hasSearchForMediaIntentMediaItemsUnsupportedReason")|| !objc_msgSend(v4, "hasSearchForMediaIntentMediaItemsUnsupportedReason")|| (searchForMediaIntentMediaItemsUnsupportedReason = self->_searchForMediaIntentMediaItemsUnsupportedReason, searchForMediaIntentMediaItemsUnsupportedReason == objc_msgSend(v4, "searchForMediaIntentMediaItemsUnsupportedReason")))
                                                              {
                                                                v59 = -[_INPBPayloadUnsupported hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason](self, "hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason");
                                                                if (v59 == objc_msgSend(v4, "hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason"))
                                                                {
                                                                  if (!-[_INPBPayloadUnsupported hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason](self, "hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason")|| !objc_msgSend(v4, "hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason")|| (updateMediaAffinityIntentMediaItemsUnsupportedReason = self->_updateMediaAffinityIntentMediaItemsUnsupportedReason, updateMediaAffinityIntentMediaItemsUnsupportedReason == objc_msgSend(v4, "updateMediaAffinityIntentMediaItemsUnsupportedReason")))
                                                                  {
                                                                    v61 = -[_INPBPayloadUnsupported hasParticipantUnsupportedReason](self, "hasParticipantUnsupportedReason");
                                                                    if (v61 == objc_msgSend(v4, "hasParticipantUnsupportedReason"))
                                                                    {
                                                                      if (!-[_INPBPayloadUnsupported hasParticipantUnsupportedReason](self, "hasParticipantUnsupportedReason")|| !objc_msgSend(v4, "hasParticipantUnsupportedReason")|| (participantUnsupportedReason = self->_participantUnsupportedReason, participantUnsupportedReason == objc_msgSend(v4, "participantUnsupportedReason")))
                                                                      {
                                                                        v63 = -[_INPBPayloadUnsupported hasAddCallParticipantIntentParticipantsUnsupportedReason](self, "hasAddCallParticipantIntentParticipantsUnsupportedReason");
                                                                        if (v63 == objc_msgSend(v4, "hasAddCallParticipantIntentParticipantsUnsupportedReason"))
                                                                        {
                                                                          if (!-[_INPBPayloadUnsupported hasAddCallParticipantIntentParticipantsUnsupportedReason](self, "hasAddCallParticipantIntentParticipantsUnsupportedReason")|| !objc_msgSend(v4, "hasAddCallParticipantIntentParticipantsUnsupportedReason")|| (addCallParticipantIntentParticipantsUnsupportedReason = self->_addCallParticipantIntentParticipantsUnsupportedReason, addCallParticipantIntentParticipantsUnsupportedReason == objc_msgSend(v4, "addCallParticipantIntentParticipantsUnsupportedReason")))
                                                                          {
                                                                            v65 = -[_INPBPayloadUnsupported hasSendPaymentIntentPayeeUnsupportedReason](self, "hasSendPaymentIntentPayeeUnsupportedReason");
                                                                            if (v65 == objc_msgSend(v4, "hasSendPaymentIntentPayeeUnsupportedReason"))
                                                                            {
                                                                              if (!-[_INPBPayloadUnsupported hasSendPaymentIntentPayeeUnsupportedReason](self, "hasSendPaymentIntentPayeeUnsupportedReason")|| !objc_msgSend(v4, "hasSendPaymentIntentPayeeUnsupportedReason")|| (sendPaymentIntentPayeeUnsupportedReason = self->_sendPaymentIntentPayeeUnsupportedReason, sendPaymentIntentPayeeUnsupportedReason == objc_msgSend(v4, "sendPaymentIntentPayeeUnsupportedReason")))
                                                                              {
                                                                                v67 = -[_INPBPayloadUnsupported hasRequestPaymentIntentPayerUnsupportedReason](self, "hasRequestPaymentIntentPayerUnsupportedReason");
                                                                                if (v67 == objc_msgSend(v4, "hasRequestPaymentIntentPayerUnsupportedReason"))
                                                                                {
                                                                                  if (!-[_INPBPayloadUnsupported hasRequestPaymentIntentPayerUnsupportedReason](self, "hasRequestPaymentIntentPayerUnsupportedReason")|| !objc_msgSend(v4, "hasRequestPaymentIntentPayerUnsupportedReason")|| (requestPaymentIntentPayerUnsupportedReason = self->_requestPaymentIntentPayerUnsupportedReason, requestPaymentIntentPayerUnsupportedReason == objc_msgSend(v4, "requestPaymentIntentPayerUnsupportedReason")))
                                                                                  {
                                                                                    v69 = -[_INPBPayloadUnsupported hasPlayMediaIntentPlaybackSpeedUnsupportedReason](self, "hasPlayMediaIntentPlaybackSpeedUnsupportedReason");
                                                                                    if (v69 == objc_msgSend(v4, "hasPlayMediaIntentPlaybackSpeedUnsupportedReason"))
                                                                                    {
                                                                                      if (!-[_INPBPayloadUnsupported hasPlayMediaIntentPlaybackSpeedUnsupportedReason](self, "hasPlayMediaIntentPlaybackSpeedUnsupportedReason")|| !objc_msgSend(v4, "hasPlayMediaIntentPlaybackSpeedUnsupportedReason")|| (playMediaIntentPlaybackSpeedUnsupportedReason = self->_playMediaIntentPlaybackSpeedUnsupportedReason, playMediaIntentPlaybackSpeedUnsupportedReason == objc_msgSend(v4, "playMediaIntentPlaybackSpeedUnsupportedReason")))
                                                                                      {
                                                                                        v71 = -[_INPBPayloadUnsupported hasStartCallIntentPreferredCallProviderUnsupportedReason](self, "hasStartCallIntentPreferredCallProviderUnsupportedReason");
                                                                                        if (v71 == objc_msgSend(v4, "hasStartCallIntentPreferredCallProviderUnsupportedReason"))
                                                                                        {
                                                                                          if (!-[_INPBPayloadUnsupported hasStartCallIntentPreferredCallProviderUnsupportedReason](self, "hasStartCallIntentPreferredCallProviderUnsupportedReason")|| !objc_msgSend(v4, "hasStartCallIntentPreferredCallProviderUnsupportedReason")|| (startCallIntentPreferredCallProviderUnsupportedReason = self->_startCallIntentPreferredCallProviderUnsupportedReason, startCallIntentPreferredCallProviderUnsupportedReason == objc_msgSend(v4, "startCallIntentPreferredCallProviderUnsupportedReason")))
                                                                                          {
                                                                                            v73 = -[_INPBPayloadUnsupported hasReason](self, "hasReason");
                                                                                            if (v73 == objc_msgSend(v4, "hasReason"))
                                                                                            {
                                                                                              if (!-[_INPBPayloadUnsupported hasReason](self, "hasReason")
                                                                                                || !objc_msgSend(v4, "hasReason")
                                                                                                || (reason = self->_reason,
                                                                                                    reason == objc_msgSend(v4, "reason")))
                                                                                              {
                                                                                                v75 = -[_INPBPayloadUnsupported hasShareETAIntentRecipientUnsupportedReason](self, "hasShareETAIntentRecipientUnsupportedReason");
                                                                                                if (v75 == objc_msgSend(v4, "hasShareETAIntentRecipientUnsupportedReason"))
                                                                                                {
                                                                                                  if (!-[_INPBPayloadUnsupported hasShareETAIntentRecipientUnsupportedReason](self, "hasShareETAIntentRecipientUnsupportedReason") || !objc_msgSend(v4, "hasShareETAIntentRecipientUnsupportedReason") || (shareETAIntentRecipientUnsupportedReason = self->_shareETAIntentRecipientUnsupportedReason, shareETAIntentRecipientUnsupportedReason == objc_msgSend(v4, "shareETAIntentRecipientUnsupportedReason")))
                                                                                                  {
                                                                                                    v77 = -[_INPBPayloadUnsupported hasStopShareETAIntentRecipientUnsupportedReason](self, "hasStopShareETAIntentRecipientUnsupportedReason");
                                                                                                    if (v77 == objc_msgSend(v4, "hasStopShareETAIntentRecipientUnsupportedReason"))
                                                                                                    {
                                                                                                      if (!-[_INPBPayloadUnsupported hasStopShareETAIntentRecipientUnsupportedReason](self, "hasStopShareETAIntentRecipientUnsupportedReason") || !objc_msgSend(v4, "hasStopShareETAIntentRecipientUnsupportedReason") || (stopShareETAIntentRecipientUnsupportedReason = self->_stopShareETAIntentRecipientUnsupportedReason, stopShareETAIntentRecipientUnsupportedReason == objc_msgSend(v4, "stopShareETAIntentRecipientUnsupportedReason")))
                                                                                                      {
                                                                                                        v79 = -[_INPBPayloadUnsupported hasSendMessageIntentRecipientUnsupportedReason](self, "hasSendMessageIntentRecipientUnsupportedReason");
                                                                                                        if (v79 == objc_msgSend(v4, "hasSendMessageIntentRecipientUnsupportedReason"))
                                                                                                        {
                                                                                                          if (!-[_INPBPayloadUnsupported hasSendMessageIntentRecipientUnsupportedReason](self, "hasSendMessageIntentRecipientUnsupportedReason") || !objc_msgSend(v4, "hasSendMessageIntentRecipientUnsupportedReason") || (sendMessageIntentRecipientUnsupportedReason = self->_sendMessageIntentRecipientUnsupportedReason, sendMessageIntentRecipientUnsupportedReason == objc_msgSend(v4, "sendMessageIntentRecipientUnsupportedReason")))
                                                                                                          {
                                                                                                            v81 = -[_INPBPayloadUnsupported hasSendAnnouncementIntentRecipientsUnsupportedReason](self, "hasSendAnnouncementIntentRecipientsUnsupportedReason");
                                                                                                            if (v81 == objc_msgSend(v4, "hasSendAnnouncementIntentRecipientsUnsupportedReason"))
                                                                                                            {
                                                                                                              if (!-[_INPBPayloadUnsupported hasSendAnnouncementIntentRecipientsUnsupportedReason](self, "hasSendAnnouncementIntentRecipientsUnsupportedReason") || !objc_msgSend(v4, "hasSendAnnouncementIntentRecipientsUnsupportedReason") || (sendAnnouncementIntentRecipientsUnsupportedReason = self->_sendAnnouncementIntentRecipientsUnsupportedReason, sendAnnouncementIntentRecipientsUnsupportedReason == objc_msgSend(v4, "sendAnnouncementIntentRecipientsUnsupportedReason")))
                                                                                                              {
                                                                                                                v83 = -[_INPBPayloadUnsupported hasSaveHealthSampleIntentRecordDateUnsupportedReason](self, "hasSaveHealthSampleIntentRecordDateUnsupportedReason");
                                                                                                                if (v83 == objc_msgSend(v4, "hasSaveHealthSampleIntentRecordDateUnsupportedReason"))
                                                                                                                {
                                                                                                                  if (!-[_INPBPayloadUnsupported hasSaveHealthSampleIntentRecordDateUnsupportedReason](self, "hasSaveHealthSampleIntentRecordDateUnsupportedReason") || !objc_msgSend(v4, "hasSaveHealthSampleIntentRecordDateUnsupportedReason") || (saveHealthSampleIntentRecordDateUnsupportedReason = self->_saveHealthSampleIntentRecordDateUnsupportedReason, saveHealthSampleIntentRecordDateUnsupportedReason == objc_msgSend(v4, "saveHealthSampleIntentRecordDateUnsupportedReason")))
                                                                                                                  {
                                                                                                                    v85 = -[_INPBPayloadUnsupported hasTargetEventUnsupportedReason](self, "hasTargetEventUnsupportedReason");
                                                                                                                    if (v85 == objc_msgSend(v4, "hasTargetEventUnsupportedReason"))
                                                                                                                    {
                                                                                                                      if (!-[_INPBPayloadUnsupported hasTargetEventUnsupportedReason](self, "hasTargetEventUnsupportedReason") || !objc_msgSend(v4, "hasTargetEventUnsupportedReason") || (targetEventUnsupportedReason = self->_targetEventUnsupportedReason, targetEventUnsupportedReason == objc_msgSend(v4, "targetEventUnsupportedReason")))
                                                                                                                      {
                                                                                                                        v87 = -[_INPBPayloadUnsupported hasAddTasksIntentTargetTaskListMembersUnsupportedReason](self, "hasAddTasksIntentTargetTaskListMembersUnsupportedReason");
                                                                                                                        if (v87 == objc_msgSend(v4, "hasAddTasksIntentTargetTaskListMembersUnsupportedReason"))
                                                                                                                        {
                                                                                                                          if (!-[_INPBPayloadUnsupported hasAddTasksIntentTargetTaskListMembersUnsupportedReason](self, "hasAddTasksIntentTargetTaskListMembersUnsupportedReason") || !objc_msgSend(v4, "hasAddTasksIntentTargetTaskListMembersUnsupportedReason") || (addTasksIntentTargetTaskListMembersUnsupportedReason = self->_addTasksIntentTargetTaskListMembersUnsupportedReason, addTasksIntentTargetTaskListMembersUnsupportedReason == objc_msgSend(v4, "addTasksIntentTargetTaskListMembersUnsupportedReason")))
                                                                                                                          {
                                                                                                                            v89 = -[_INPBPayloadUnsupported hasSetTimerAttributeIntentTargetTimerUnsupportedReason](self, "hasSetTimerAttributeIntentTargetTimerUnsupportedReason");
                                                                                                                            if (v89 == objc_msgSend(v4, "hasSetTimerAttributeIntentTargetTimerUnsupportedReason"))
                                                                                                                            {
                                                                                                                              if (!-[_INPBPayloadUnsupported hasSetTimerAttributeIntentTargetTimerUnsupportedReason](self, "hasSetTimerAttributeIntentTargetTimerUnsupportedReason") || !objc_msgSend(v4, "hasSetTimerAttributeIntentTargetTimerUnsupportedReason") || (setTimerAttributeIntentTargetTimerUnsupportedReason = self->_setTimerAttributeIntentTargetTimerUnsupportedReason, setTimerAttributeIntentTargetTimerUnsupportedReason == objc_msgSend(v4, "setTimerAttributeIntentTargetTimerUnsupportedReason")))
                                                                                                                              {
                                                                                                                                v91 = -[_INPBPayloadUnsupported hasDeleteTasksIntentTaskListUnsupportedReason](self, "hasDeleteTasksIntentTaskListUnsupportedReason");
                                                                                                                                if (v91 == objc_msgSend(v4, "hasDeleteTasksIntentTaskListUnsupportedReason"))
                                                                                                                                {
                                                                                                                                  if (!-[_INPBPayloadUnsupported hasDeleteTasksIntentTaskListUnsupportedReason](self, "hasDeleteTasksIntentTaskListUnsupportedReason") || !objc_msgSend(v4, "hasDeleteTasksIntentTaskListUnsupportedReason") || (deleteTasksIntentTaskListUnsupportedReason = self->_deleteTasksIntentTaskListUnsupportedReason, deleteTasksIntentTaskListUnsupportedReason == objc_msgSend(v4, "deleteTasksIntentTaskListUnsupportedReason")))
                                                                                                                                  {
                                                                                                                                    v93 = -[_INPBPayloadUnsupported hasDeleteTasksIntentTaskUnsupportedReason](self, "hasDeleteTasksIntentTaskUnsupportedReason");
                                                                                                                                    if (v93 == objc_msgSend(v4, "hasDeleteTasksIntentTaskUnsupportedReason"))
                                                                                                                                    {
                                                                                                                                      if (!-[_INPBPayloadUnsupported hasDeleteTasksIntentTaskUnsupportedReason](self, "hasDeleteTasksIntentTaskUnsupportedReason") || !objc_msgSend(v4, "hasDeleteTasksIntentTaskUnsupportedReason") || (deleteTasksIntentTaskUnsupportedReason = self->_deleteTasksIntentTaskUnsupportedReason, deleteTasksIntentTaskUnsupportedReason == objc_msgSend(v4, "deleteTasksIntentTaskUnsupportedReason")))
                                                                                                                                      {
                                                                                                                                        v95 = -[_INPBPayloadUnsupported hasSnoozeTasksIntentTaskUnsupportedReason](self, "hasSnoozeTasksIntentTaskUnsupportedReason");
                                                                                                                                        if (v95 == objc_msgSend(v4, "hasSnoozeTasksIntentTaskUnsupportedReason"))
                                                                                                                                        {
                                                                                                                                          if (!-[_INPBPayloadUnsupported hasSnoozeTasksIntentTaskUnsupportedReason](self, "hasSnoozeTasksIntentTaskUnsupportedReason") || !objc_msgSend(v4, "hasSnoozeTasksIntentTaskUnsupportedReason") || (snoozeTasksIntentTaskUnsupportedReason = self->_snoozeTasksIntentTaskUnsupportedReason, snoozeTasksIntentTaskUnsupportedReason == objc_msgSend(v4, "snoozeTasksIntentTaskUnsupportedReason")))
                                                                                                                                          {
                                                                                                                                            v97 = -[_INPBPayloadUnsupported hasAddTasksIntentTemporalEventTriggerUnsupportedReason](self, "hasAddTasksIntentTemporalEventTriggerUnsupportedReason");
                                                                                                                                            if (v97 == objc_msgSend(v4, "hasAddTasksIntentTemporalEventTriggerUnsupportedReason"))
                                                                                                                                            {
                                                                                                                                              if (!-[_INPBPayloadUnsupported hasAddTasksIntentTemporalEventTriggerUnsupportedReason](self, "hasAddTasksIntentTemporalEventTriggerUnsupportedReason") || !objc_msgSend(v4, "hasAddTasksIntentTemporalEventTriggerUnsupportedReason") || (addTasksIntentTemporalEventTriggerUnsupportedReason = self->_addTasksIntentTemporalEventTriggerUnsupportedReason, addTasksIntentTemporalEventTriggerUnsupportedReason == objc_msgSend(v4, "addTasksIntentTemporalEventTriggerUnsupportedReason")))
                                                                                                                                              {
                                                                                                                                                v99 = -[_INPBPayloadUnsupported hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason");
                                                                                                                                                if (v99 == objc_msgSend(v4, "hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason"))
                                                                                                                                                {
                                                                                                                                                  if (!-[_INPBPayloadUnsupported hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason") || !objc_msgSend(v4, "hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason") || (setTaskAttributeIntentTemporalEventTriggerUnsupportedReason = self->_setTaskAttributeIntentTemporalEventTriggerUnsupportedReason, setTaskAttributeIntentTemporalEventTriggerUnsupportedReason == objc_msgSend(v4, "setTaskAttributeIntentTemporalEventTriggerUnsupportedReason")))
                                                                                                                                                  {
                                                                                                                                                    v101 = -[_INPBPayloadUnsupported hasRunWorkflowIntentWorkflowUnsupportedReason](self, "hasRunWorkflowIntentWorkflowUnsupportedReason");
                                                                                                                                                    if (v101 == objc_msgSend(v4, "hasRunWorkflowIntentWorkflowUnsupportedReason"))
                                                                                                                                                    {
                                                                                                                                                      if (!-[_INPBPayloadUnsupported hasRunWorkflowIntentWorkflowUnsupportedReason](self, "hasRunWorkflowIntentWorkflowUnsupportedReason") || !objc_msgSend(v4, "hasRunWorkflowIntentWorkflowUnsupportedReason") || (runWorkflowIntentWorkflowUnsupportedReason = self->_runWorkflowIntentWorkflowUnsupportedReason, runWorkflowIntentWorkflowUnsupportedReason == objc_msgSend(v4, "runWorkflowIntentWorkflowUnsupportedReason")))
                                                                                                                                                      {
                                                                                                                                                        v102 = 1;
                                                                                                                                                        goto LABEL_186;
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {

  }
LABEL_185:
  v102 = 0;
LABEL_186:

  return v102;
}

- (unint64_t)hash
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  if (-[_INPBPayloadUnsupported hasUpdateAlarmIntentAlarmUnsupportedReason](self, "hasUpdateAlarmIntentAlarmUnsupportedReason"))
  {
    v50 = 2654435761 * self->_updateAlarmIntentAlarmUnsupportedReason;
  }
  else
  {
    v50 = 0;
  }
  if (-[_INPBPayloadUnsupported hasChangeAlarmStatusIntentAlarmsUnsupportedReason](self, "hasChangeAlarmStatusIntentAlarmsUnsupportedReason"))
  {
    v49 = 2654435761 * self->_changeAlarmStatusIntentAlarmsUnsupportedReason;
  }
  else
  {
    v49 = 0;
  }
  if (-[_INPBPayloadUnsupported hasDeleteAlarmIntentAlarmsUnsupportedReason](self, "hasDeleteAlarmIntentAlarmsUnsupportedReason"))
  {
    v48 = 2654435761 * self->_deleteAlarmIntentAlarmsUnsupportedReason;
  }
  else
  {
    v48 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSearchAlarmIntentAlarmsUnsupportedReason](self, "hasSearchAlarmIntentAlarmsUnsupportedReason"))
  {
    v47 = 2654435761 * self->_searchAlarmIntentAlarmsUnsupportedReason;
  }
  else
  {
    v47 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSnoozeAlarmIntentAlarmsUnsupportedReason](self, "hasSnoozeAlarmIntentAlarmsUnsupportedReason"))
  {
    v46 = 2654435761 * self->_snoozeAlarmIntentAlarmsUnsupportedReason;
  }
  else
  {
    v46 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSendAnnouncementIntentAnnouncementUnsupportedReason](self, "hasSendAnnouncementIntentAnnouncementUnsupportedReason"))
  {
    v45 = 2654435761 * self->_sendAnnouncementIntentAnnouncementUnsupportedReason;
  }
  else
  {
    v45 = 0;
  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentCallCapabilityUnsupportedReason](self, "hasStartCallIntentCallCapabilityUnsupportedReason"))
  {
    v44 = 2654435761 * self->_startCallIntentCallCapabilityUnsupportedReason;
  }
  else
  {
    v44 = 0;
  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentCallRecordToCallBackUnsupportedReason](self, "hasStartCallIntentCallRecordToCallBackUnsupportedReason"))
  {
    v43 = 2654435761 * self->_startCallIntentCallRecordToCallBackUnsupportedReason;
  }
  else
  {
    v43 = 0;
  }
  v42 = -[NSArray hash](self->_conflictingParameters, "hash");
  if (-[_INPBPayloadUnsupported hasAddTasksIntentContactEventTriggerUnsupportedReason](self, "hasAddTasksIntentContactEventTriggerUnsupportedReason"))
  {
    v41 = 2654435761 * self->_addTasksIntentContactEventTriggerUnsupportedReason;
  }
  else
  {
    v41 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason"))
  {
    v40 = 2654435761 * self->_setTaskAttributeIntentContactEventTriggerUnsupportedReason;
  }
  else
  {
    v40 = 0;
  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentContactsUnsupportedReason](self, "hasStartCallIntentContactsUnsupportedReason"))
  {
    v39 = 2654435761 * self->_startCallIntentContactsUnsupportedReason;
  }
  else
  {
    v39 = 0;
  }
  if (-[_INPBPayloadUnsupported hasRequestPaymentIntentCurrencyAmountUnsupportedReason](self, "hasRequestPaymentIntentCurrencyAmountUnsupportedReason"))
  {
    v38 = 2654435761 * self->_requestPaymentIntentCurrencyAmountUnsupportedReason;
  }
  else
  {
    v38 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSendPaymentIntentCurrencyAmountUnsupportedReason](self, "hasSendPaymentIntentCurrencyAmountUnsupportedReason"))
  {
    v37 = 2654435761 * self->_sendPaymentIntentCurrencyAmountUnsupportedReason;
  }
  else
  {
    v37 = 0;
  }
  if (-[_INPBPayloadUnsupported hasCustomUnsupportedReason](self, "hasCustomUnsupportedReason"))
    v36 = 2654435761 * self->_customUnsupportedReason;
  else
    v36 = 0;
  if (-[_INPBPayloadUnsupported hasDateTimeRangeUnsupportedReason](self, "hasDateTimeRangeUnsupportedReason"))
    v35 = 2654435761 * self->_dateTimeRangeUnsupportedReason;
  else
    v35 = 0;
  if (-[_INPBPayloadUnsupported hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason](self, "hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason"))
  {
    v34 = 2654435761 * self->_findDeviceAndPlaySoundIntentDeviceUnsupportedReason;
  }
  else
  {
    v34 = 0;
  }
  if (-[_INPBPayloadUnsupported hasJoinCallIntentGroupConversationUnsupportedReason](self, "hasJoinCallIntentGroupConversationUnsupportedReason"))
  {
    v33 = 2654435761 * self->_joinCallIntentGroupConversationUnsupportedReason;
  }
  else
  {
    v33 = 0;
  }
  if (-[_INPBPayloadUnsupported hasReportIncidentIntentIncidentTypeUnsupportedReason](self, "hasReportIncidentIntentIncidentTypeUnsupportedReason"))
  {
    v32 = 2654435761 * self->_reportIncidentIntentIncidentTypeUnsupportedReason;
  }
  else
  {
    v32 = 0;
  }
  if (-[_INPBPayloadUnsupported hasCreateTimerIntentLabelUnsupportedReason](self, "hasCreateTimerIntentLabelUnsupportedReason"))
  {
    v31 = 2654435761 * self->_createTimerIntentLabelUnsupportedReason;
  }
  else
  {
    v31 = 0;
  }
  if (-[_INPBPayloadUnsupported hasAddMediaIntentMediaDestinationUnsupportedReason](self, "hasAddMediaIntentMediaDestinationUnsupportedReason"))
  {
    v30 = 2654435761 * self->_addMediaIntentMediaDestinationUnsupportedReason;
  }
  else
  {
    v30 = 0;
  }
  if (-[_INPBPayloadUnsupported hasAddMediaIntentMediaItemsUnsupportedReason](self, "hasAddMediaIntentMediaItemsUnsupportedReason"))
  {
    v29 = 2654435761 * self->_addMediaIntentMediaItemsUnsupportedReason;
  }
  else
  {
    v29 = 0;
  }
  if (-[_INPBPayloadUnsupported hasPlayMediaIntentMediaItemsUnsupportedReason](self, "hasPlayMediaIntentMediaItemsUnsupportedReason"))
  {
    v28 = 2654435761 * self->_playMediaIntentMediaItemsUnsupportedReason;
  }
  else
  {
    v28 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSearchForMediaIntentMediaItemsUnsupportedReason](self, "hasSearchForMediaIntentMediaItemsUnsupportedReason"))
  {
    v27 = 2654435761 * self->_searchForMediaIntentMediaItemsUnsupportedReason;
  }
  else
  {
    v27 = 0;
  }
  if (-[_INPBPayloadUnsupported hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason](self, "hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason"))
  {
    v26 = 2654435761 * self->_updateMediaAffinityIntentMediaItemsUnsupportedReason;
  }
  else
  {
    v26 = 0;
  }
  if (-[_INPBPayloadUnsupported hasParticipantUnsupportedReason](self, "hasParticipantUnsupportedReason"))
    v25 = 2654435761 * self->_participantUnsupportedReason;
  else
    v25 = 0;
  if (-[_INPBPayloadUnsupported hasAddCallParticipantIntentParticipantsUnsupportedReason](self, "hasAddCallParticipantIntentParticipantsUnsupportedReason"))
  {
    v24 = 2654435761 * self->_addCallParticipantIntentParticipantsUnsupportedReason;
  }
  else
  {
    v24 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSendPaymentIntentPayeeUnsupportedReason](self, "hasSendPaymentIntentPayeeUnsupportedReason"))
  {
    v23 = 2654435761 * self->_sendPaymentIntentPayeeUnsupportedReason;
  }
  else
  {
    v23 = 0;
  }
  if (-[_INPBPayloadUnsupported hasRequestPaymentIntentPayerUnsupportedReason](self, "hasRequestPaymentIntentPayerUnsupportedReason"))
  {
    v22 = 2654435761 * self->_requestPaymentIntentPayerUnsupportedReason;
  }
  else
  {
    v22 = 0;
  }
  if (-[_INPBPayloadUnsupported hasPlayMediaIntentPlaybackSpeedUnsupportedReason](self, "hasPlayMediaIntentPlaybackSpeedUnsupportedReason"))
  {
    v21 = 2654435761 * self->_playMediaIntentPlaybackSpeedUnsupportedReason;
  }
  else
  {
    v21 = 0;
  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentPreferredCallProviderUnsupportedReason](self, "hasStartCallIntentPreferredCallProviderUnsupportedReason"))
  {
    v20 = 2654435761 * self->_startCallIntentPreferredCallProviderUnsupportedReason;
  }
  else
  {
    v20 = 0;
  }
  if (-[_INPBPayloadUnsupported hasReason](self, "hasReason"))
    v19 = 2654435761 * self->_reason;
  else
    v19 = 0;
  if (-[_INPBPayloadUnsupported hasShareETAIntentRecipientUnsupportedReason](self, "hasShareETAIntentRecipientUnsupportedReason"))
  {
    v18 = 2654435761 * self->_shareETAIntentRecipientUnsupportedReason;
  }
  else
  {
    v18 = 0;
  }
  if (-[_INPBPayloadUnsupported hasStopShareETAIntentRecipientUnsupportedReason](self, "hasStopShareETAIntentRecipientUnsupportedReason"))
  {
    v17 = 2654435761 * self->_stopShareETAIntentRecipientUnsupportedReason;
  }
  else
  {
    v17 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSendMessageIntentRecipientUnsupportedReason](self, "hasSendMessageIntentRecipientUnsupportedReason"))
  {
    v16 = 2654435761 * self->_sendMessageIntentRecipientUnsupportedReason;
  }
  else
  {
    v16 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSendAnnouncementIntentRecipientsUnsupportedReason](self, "hasSendAnnouncementIntentRecipientsUnsupportedReason"))
  {
    v15 = 2654435761 * self->_sendAnnouncementIntentRecipientsUnsupportedReason;
  }
  else
  {
    v15 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSaveHealthSampleIntentRecordDateUnsupportedReason](self, "hasSaveHealthSampleIntentRecordDateUnsupportedReason"))
  {
    v3 = -[_INPBPayloadUnsupported hasTargetEventUnsupportedReason](self, "hasTargetEventUnsupportedReason", 2654435761 * self->_saveHealthSampleIntentRecordDateUnsupportedReason);
  }
  else
  {
    v3 = -[_INPBPayloadUnsupported hasTargetEventUnsupportedReason](self, "hasTargetEventUnsupportedReason", 0);
  }
  if (v3)
    v4 = 2654435761 * self->_targetEventUnsupportedReason;
  else
    v4 = 0;
  if (-[_INPBPayloadUnsupported hasAddTasksIntentTargetTaskListMembersUnsupportedReason](self, "hasAddTasksIntentTargetTaskListMembersUnsupportedReason"))
  {
    v5 = 2654435761 * self->_addTasksIntentTargetTaskListMembersUnsupportedReason;
  }
  else
  {
    v5 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSetTimerAttributeIntentTargetTimerUnsupportedReason](self, "hasSetTimerAttributeIntentTargetTimerUnsupportedReason"))
  {
    v6 = 2654435761 * self->_setTimerAttributeIntentTargetTimerUnsupportedReason;
  }
  else
  {
    v6 = 0;
  }
  if (-[_INPBPayloadUnsupported hasDeleteTasksIntentTaskListUnsupportedReason](self, "hasDeleteTasksIntentTaskListUnsupportedReason"))
  {
    v7 = 2654435761 * self->_deleteTasksIntentTaskListUnsupportedReason;
  }
  else
  {
    v7 = 0;
  }
  if (-[_INPBPayloadUnsupported hasDeleteTasksIntentTaskUnsupportedReason](self, "hasDeleteTasksIntentTaskUnsupportedReason"))
  {
    v8 = 2654435761 * self->_deleteTasksIntentTaskUnsupportedReason;
  }
  else
  {
    v8 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSnoozeTasksIntentTaskUnsupportedReason](self, "hasSnoozeTasksIntentTaskUnsupportedReason"))
  {
    v9 = 2654435761 * self->_snoozeTasksIntentTaskUnsupportedReason;
  }
  else
  {
    v9 = 0;
  }
  if (-[_INPBPayloadUnsupported hasAddTasksIntentTemporalEventTriggerUnsupportedReason](self, "hasAddTasksIntentTemporalEventTriggerUnsupportedReason"))
  {
    v10 = 2654435761 * self->_addTasksIntentTemporalEventTriggerUnsupportedReason;
  }
  else
  {
    v10 = 0;
  }
  if (-[_INPBPayloadUnsupported hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason"))
  {
    v11 = 2654435761 * self->_setTaskAttributeIntentTemporalEventTriggerUnsupportedReason;
  }
  else
  {
    v11 = 0;
  }
  if (-[_INPBPayloadUnsupported hasRunWorkflowIntentWorkflowUnsupportedReason](self, "hasRunWorkflowIntentWorkflowUnsupportedReason"))
  {
    v12 = 2654435761 * self->_runWorkflowIntentWorkflowUnsupportedReason;
  }
  else
  {
    v12 = 0;
  }
  return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v42 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  uint64_t v29;
  __CFString *v30;
  uint64_t v31;
  int v32;
  __CFString *v33;
  uint64_t v34;
  __CFString *v35;
  uint64_t v36;
  __CFString *v37;
  void *v38;
  uint64_t v39;
  __CFString *v40;
  uint64_t v41;
  __CFString *v42;
  uint64_t v43;
  __CFString *v44;
  uint64_t v45;
  __CFString *v46;
  uint64_t v47;
  __CFString *v48;
  uint64_t v49;
  __CFString *v50;
  uint64_t v51;
  __CFString *v52;
  uint64_t v53;
  __CFString *v54;
  uint64_t v55;
  __CFString *v56;
  uint64_t v57;
  __CFString *v58;
  uint64_t v59;
  __CFString *v60;
  uint64_t v61;
  __CFString *v62;
  uint64_t v63;
  __CFString *v64;
  uint64_t v65;
  __CFString *v66;
  uint64_t v67;
  __CFString *v68;
  uint64_t v69;
  __CFString *v70;
  uint64_t v71;
  __CFString *v72;
  uint64_t v73;
  __CFString *v74;
  uint64_t v75;
  __CFString *v76;
  uint64_t v77;
  __CFString *v78;
  uint64_t v79;
  __CFString *v80;
  uint64_t v81;
  __CFString *v82;
  uint64_t v83;
  __CFString *v84;
  uint64_t v85;
  __CFString *v86;
  uint64_t v87;
  __CFString *v88;
  uint64_t v89;
  __CFString *v90;
  uint64_t v91;
  __CFString *v92;
  uint64_t v93;
  __CFString *v94;
  uint64_t v95;
  __CFString *v96;
  uint64_t v97;
  __CFString *v98;
  uint64_t v99;
  __CFString *v100;
  id v101;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBPayloadUnsupported hasUpdateAlarmIntentAlarmUnsupportedReason](self, "hasUpdateAlarmIntentAlarmUnsupportedReason"))
  {
    v4 = -[_INPBPayloadUnsupported updateAlarmIntentAlarmUnsupportedReason](self, "updateAlarmIntentAlarmUnsupportedReason");
    if ((_DWORD)v4)
    {
      if ((_DWORD)v4 == 3)
      {
        v5 = CFSTR("SLEEP_ALARM_NOT_SUPPORTED");
      }
      else if ((_DWORD)v4 == 1)
      {
        v5 = CFSTR("NO_ALARM_EXISTS");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("NOT_FOUND");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alarmUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasChangeAlarmStatusIntentAlarmsUnsupportedReason](self, "hasChangeAlarmStatusIntentAlarmsUnsupportedReason"))
  {
    v6 = -[_INPBPayloadUnsupported changeAlarmStatusIntentAlarmsUnsupportedReason](self, "changeAlarmStatusIntentAlarmsUnsupportedReason");
    if (v6 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E228E8A8[v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("alarmsUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasDeleteAlarmIntentAlarmsUnsupportedReason](self, "hasDeleteAlarmIntentAlarmsUnsupportedReason"))
  {
    v8 = -[_INPBPayloadUnsupported deleteAlarmIntentAlarmsUnsupportedReason](self, "deleteAlarmIntentAlarmsUnsupportedReason");
    if ((_DWORD)v8)
    {
      if ((_DWORD)v8 == 1)
      {
        v9 = CFSTR("NO_ALARM_EXISTS");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = CFSTR("NOT_FOUND");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("alarmsUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSearchAlarmIntentAlarmsUnsupportedReason](self, "hasSearchAlarmIntentAlarmsUnsupportedReason"))
  {
    v10 = -[_INPBPayloadUnsupported searchAlarmIntentAlarmsUnsupportedReason](self, "searchAlarmIntentAlarmsUnsupportedReason");
    if ((_DWORD)v10)
    {
      if ((_DWORD)v10 == 1)
      {
        v11 = CFSTR("NO_ALARM_EXISTS");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v11 = CFSTR("NOT_FOUND");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("alarmsUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSnoozeAlarmIntentAlarmsUnsupportedReason](self, "hasSnoozeAlarmIntentAlarmsUnsupportedReason"))
  {
    v12 = -[_INPBPayloadUnsupported snoozeAlarmIntentAlarmsUnsupportedReason](self, "snoozeAlarmIntentAlarmsUnsupportedReason");
    if ((_DWORD)v12)
    {
      if ((_DWORD)v12 == 1)
      {
        v13 = CFSTR("CANT_SNOOZE_MUSIC_ALARM");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v13 = CFSTR("NO_ALARM_FIRING");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("alarmsUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSendAnnouncementIntentAnnouncementUnsupportedReason](self, "hasSendAnnouncementIntentAnnouncementUnsupportedReason"))
  {
    v14 = -[_INPBPayloadUnsupported sendAnnouncementIntentAnnouncementUnsupportedReason](self, "sendAnnouncementIntentAnnouncementUnsupportedReason");
    if ((_DWORD)v14 == 1)
    {
      v15 = CFSTR("NO_ANNOUNCEMENT_TO_REPLY_TO");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("announcementUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentCallCapabilityUnsupportedReason](self, "hasStartCallIntentCallCapabilityUnsupportedReason"))
  {
    v16 = -[_INPBPayloadUnsupported startCallIntentCallCapabilityUnsupportedReason](self, "startCallIntentCallCapabilityUnsupportedReason");
    if ((v16 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E228E8D8[(v16 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("callCapabilityUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentCallRecordToCallBackUnsupportedReason](self, "hasStartCallIntentCallRecordToCallBackUnsupportedReason"))
  {
    v18 = -[_INPBPayloadUnsupported startCallIntentCallRecordToCallBackUnsupportedReason](self, "startCallIntentCallRecordToCallBackUnsupportedReason");
    if ((_DWORD)v18 == 1)
    {
      v19 = CFSTR("NO_MATCHING_CALL");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("callRecordToCallBackUnsupportedReason"));

  }
  if (-[NSArray count](self->_conflictingParameters, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v21 = self->_conflictingParameters;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v104;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v104 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * i), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("conflictingParameters"));
  }
  if (-[_INPBPayloadUnsupported hasAddTasksIntentContactEventTriggerUnsupportedReason](self, "hasAddTasksIntentContactEventTriggerUnsupportedReason"))
  {
    v27 = -[_INPBPayloadUnsupported addTasksIntentContactEventTriggerUnsupportedReason](self, "addTasksIntentContactEventTriggerUnsupportedReason");
    if ((_DWORD)v27 == 1)
    {
      v28 = CFSTR("ACCOUNT_DOES_NOT_SUPPORT");
    }
    else if ((_DWORD)v27 == 2)
    {
      v28 = CFSTR("CLOUDKIT_NOT_UPGRADED");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v27);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("contactEventTriggerUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentContactEventTriggerUnsupportedReason"))
  {
    v29 = -[_INPBPayloadUnsupported setTaskAttributeIntentContactEventTriggerUnsupportedReason](self, "setTaskAttributeIntentContactEventTriggerUnsupportedReason");
    if ((_DWORD)v29 == 1)
    {
      v30 = CFSTR("ACCOUNT_DOES_NOT_SUPPORT");
    }
    else if ((_DWORD)v29 == 2)
    {
      v30 = CFSTR("CLOUDKIT_NOT_UPGRADED");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v29);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("contactEventTriggerUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentContactsUnsupportedReason](self, "hasStartCallIntentContactsUnsupportedReason"))
  {
    v31 = -[_INPBPayloadUnsupported startCallIntentContactsUnsupportedReason](self, "startCallIntentContactsUnsupportedReason");
    v32 = v31 - 1;
    if ((v31 - 1) < 0xA && ((0x2FFu >> v32) & 1) != 0)
    {
      v33 = off_1E228E8F0[v32];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v31);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("contactsUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasRequestPaymentIntentCurrencyAmountUnsupportedReason](self, "hasRequestPaymentIntentCurrencyAmountUnsupportedReason"))
  {
    v34 = -[_INPBPayloadUnsupported requestPaymentIntentCurrencyAmountUnsupportedReason](self, "requestPaymentIntentCurrencyAmountUnsupportedReason");
    if ((v34 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v34);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E228E940[(v34 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("currencyAmountUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSendPaymentIntentCurrencyAmountUnsupportedReason](self, "hasSendPaymentIntentCurrencyAmountUnsupportedReason"))
  {
    v36 = -[_INPBPayloadUnsupported sendPaymentIntentCurrencyAmountUnsupportedReason](self, "sendPaymentIntentCurrencyAmountUnsupportedReason");
    if ((v36 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v36);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = off_1E228E940[(v36 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("currencyAmountUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasCustomUnsupportedReason](self, "hasCustomUnsupportedReason"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_INPBPayloadUnsupported customUnsupportedReason](self, "customUnsupportedReason"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("customUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasDateTimeRangeUnsupportedReason](self, "hasDateTimeRangeUnsupportedReason"))
  {
    v39 = -[_INPBPayloadUnsupported dateTimeRangeUnsupportedReason](self, "dateTimeRangeUnsupportedReason");
    if ((_DWORD)v39 == 1)
    {
      v40 = CFSTR("PAST_DATE_TIME");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v39);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("dateTimeRangeUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason](self, "hasFindDeviceAndPlaySoundIntentDeviceUnsupportedReason"))
  {
    v41 = -[_INPBPayloadUnsupported findDeviceAndPlaySoundIntentDeviceUnsupportedReason](self, "findDeviceAndPlaySoundIntentDeviceUnsupportedReason");
    if ((_DWORD)v41 == 1)
    {
      v42 = CFSTR("UNKNOWN");
    }
    else if ((_DWORD)v41 == 2)
    {
      v42 = CFSTR("SERVICE_UNAVAILABLE");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v41);
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("deviceUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasJoinCallIntentGroupConversationUnsupportedReason](self, "hasJoinCallIntentGroupConversationUnsupportedReason"))
  {
    v43 = -[_INPBPayloadUnsupported joinCallIntentGroupConversationUnsupportedReason](self, "joinCallIntentGroupConversationUnsupportedReason");
    if ((_DWORD)v43 == 1)
    {
      v44 = CFSTR("NO_ACTIVE_NOTIFICATIONS");
    }
    else if ((_DWORD)v43 == 2)
    {
      v44 = CFSTR("NO_MATCHING_NOTIFICATIONS");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v43);
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("groupConversationUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasReportIncidentIntentIncidentTypeUnsupportedReason](self, "hasReportIncidentIntentIncidentTypeUnsupportedReason"))
  {
    v45 = -[_INPBPayloadUnsupported reportIncidentIntentIncidentTypeUnsupportedReason](self, "reportIncidentIntentIncidentTypeUnsupportedReason");
    if (v45 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v45);
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = off_1E228E958[v45];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("incidentTypeUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasCreateTimerIntentLabelUnsupportedReason](self, "hasCreateTimerIntentLabelUnsupportedReason"))
  {
    v47 = -[_INPBPayloadUnsupported createTimerIntentLabelUnsupportedReason](self, "createTimerIntentLabelUnsupportedReason");
    if ((_DWORD)v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v47);
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = CFSTR("AMBIGUOUS_UNNAMED_TIMER");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("labelUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasAddMediaIntentMediaDestinationUnsupportedReason](self, "hasAddMediaIntentMediaDestinationUnsupportedReason"))
  {
    v49 = -[_INPBPayloadUnsupported addMediaIntentMediaDestinationUnsupportedReason](self, "addMediaIntentMediaDestinationUnsupportedReason");
    if ((_DWORD)v49 == 1)
    {
      v50 = CFSTR("PLAYLIST_NAME_NOT_FOUND");
    }
    else if ((_DWORD)v49 == 2)
    {
      v50 = CFSTR("PLAYLIST_NOT_EDITABLE");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v49);
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("mediaDestinationUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasAddMediaIntentMediaItemsUnsupportedReason](self, "hasAddMediaIntentMediaItemsUnsupportedReason"))
  {
    v51 = -[_INPBPayloadUnsupported addMediaIntentMediaItemsUnsupportedReason](self, "addMediaIntentMediaItemsUnsupportedReason");
    v52 = CFSTR("LOGIN_REQUIRED");
    switch((int)v51)
    {
      case 1:
        break;
      case 2:
        v52 = CFSTR("SUBSCRIPTION_REQUIRED");
        break;
      case 3:
        v52 = CFSTR("UNSUPPORTED_MEDIA_TYPE");
        break;
      case 4:
        v52 = CFSTR("EXPLICIT_CONTENT_SETTINGS");
        break;
      case 5:
        v52 = CFSTR("CELLULAR_DATA_SETTINGS");
        break;
      case 6:
        v52 = CFSTR("RESTRICTED_CONTENT");
        break;
      case 7:
        v52 = CFSTR("SERVICE_UNAVAILABLE");
        break;
      case 8:
        v52 = CFSTR("REGION_RESTRICTION");
        break;
      default:
        switch((int)v51)
        {
          case 'd':
            v52 = CFSTR("APP_NOT_CONFIGURED");
            break;
          case 'e':
            v52 = CFSTR("APP_NOT_AVAILABLE");
            break;
          case 'f':
            v52 = CFSTR("APP_ACCOUNT_FAILURE");
            break;
          case 'g':
            v52 = CFSTR("APP_DOESNT_SUPPORT_INTENT");
            break;
          case 'h':
            v52 = CFSTR("ALREADY_IN_LIBRARY");
            break;
          case 'i':
            v52 = CFSTR("CLOUD_SYNC_OFF");
            break;
          case 'j':
            v52 = CFSTR("GET_NOWPLAYING_FAILURE");
            break;
          default:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v51);
            v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("mediaItemsUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasPlayMediaIntentMediaItemsUnsupportedReason](self, "hasPlayMediaIntentMediaItemsUnsupportedReason"))
  {
    v53 = -[_INPBPayloadUnsupported playMediaIntentMediaItemsUnsupportedReason](self, "playMediaIntentMediaItemsUnsupportedReason");
    v54 = CFSTR("LOGIN_REQUIRED");
    switch((int)v53)
    {
      case 1:
        break;
      case 2:
        v54 = CFSTR("SUBSCRIPTION_REQUIRED");
        break;
      case 3:
        v54 = CFSTR("UNSUPPORTED_MEDIA_TYPE");
        break;
      case 4:
        v54 = CFSTR("EXPLICIT_CONTENT_SETTINGS");
        break;
      case 5:
        v54 = CFSTR("CELLULAR_DATA_SETTINGS");
        break;
      case 6:
        v54 = CFSTR("RESTRICTED_CONTENT");
        break;
      case 7:
        v54 = CFSTR("SERVICE_UNAVAILABLE");
        break;
      case 8:
        v54 = CFSTR("REGION_RESTRICTION");
        break;
      case 9:
        v54 = CFSTR("NOT_DOWNLOADED_FOR_OFFLINE");
        break;
      default:
        switch((int)v53)
        {
          case 1000:
            v54 = CFSTR("PLAYBACK_DEVICE_NOT_FOUND");
            break;
          case 1001:
            v54 = CFSTR("EMPTY_LIBRARY");
            break;
          case 1002:
            v54 = CFSTR("CREATE_RADIO_FAILED");
            break;
          case 1003:
            v54 = CFSTR("UNSUPPORTED_PLAYBACK_QUEUE_LOCATION");
            break;
          case 1004:
            v54 = CFSTR("UNSUPPORTED_PLAYBACK_QUEUE_LOCATION_WITH_LIVE_RADIO");
            break;
          case 1005:
            v54 = CFSTR("STILL_LOADING_CLOUD_LIBRARY");
            break;
          case 1006:
            v54 = CFSTR("ITUNES_ACCOUNT_ERROR");
            break;
          default:
            switch((int)v53)
            {
              case 'd':
                v54 = CFSTR("APP_NOT_CONFIGURED");
                break;
              case 'e':
                v54 = CFSTR("APP_NOT_AVAILABLE");
                break;
              case 'f':
                v54 = CFSTR("APP_ACCOUNT_FAILURE");
                break;
              case 'g':
                v54 = CFSTR("APP_DOESNT_SUPPORT_INTENT");
                break;
              case 'h':
                v54 = CFSTR("MS_LIMIT_REACHED");
                break;
              case 'i':
                v54 = CFSTR("MEDIA_PLAYBACK_DISABLED");
                break;
              default:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v53);
                v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
            break;
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("mediaItemsUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSearchForMediaIntentMediaItemsUnsupportedReason](self, "hasSearchForMediaIntentMediaItemsUnsupportedReason"))
  {
    v55 = -[_INPBPayloadUnsupported searchForMediaIntentMediaItemsUnsupportedReason](self, "searchForMediaIntentMediaItemsUnsupportedReason");
    v56 = CFSTR("LOGIN_REQUIRED");
    switch((int)v55)
    {
      case 1:
        break;
      case 2:
        v56 = CFSTR("SUBSCRIPTION_REQUIRED");
        break;
      case 3:
        v56 = CFSTR("UNSUPPORTED_MEDIA_TYPE");
        break;
      case 4:
        v56 = CFSTR("EXPLICIT_CONTENT_SETTINGS");
        break;
      case 5:
        v56 = CFSTR("CELLULAR_DATA_SETTINGS");
        break;
      case 6:
        v56 = CFSTR("RESTRICTED_CONTENT");
        break;
      case 7:
        v56 = CFSTR("SERVICE_UNAVAILABLE");
        break;
      case 8:
        v56 = CFSTR("REGION_RESTRICTION");
        break;
      default:
        switch((int)v55)
        {
          case 'd':
            v56 = CFSTR("APP_NOT_CONFIGURED");
            break;
          case 'e':
            v56 = CFSTR("APP_NOT_AVAILABLE");
            break;
          case 'f':
            v56 = CFSTR("APP_ACCOUNT_FAILURE");
            break;
          case 'g':
            v56 = CFSTR("APP_DOESNT_SUPPORT_INTENT");
            break;
          default:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v55);
            v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("mediaItemsUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason](self, "hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason"))
  {
    v57 = -[_INPBPayloadUnsupported updateMediaAffinityIntentMediaItemsUnsupportedReason](self, "updateMediaAffinityIntentMediaItemsUnsupportedReason");
    v58 = CFSTR("LOGIN_REQUIRED");
    switch((int)v57)
    {
      case 1:
        break;
      case 2:
        v58 = CFSTR("SUBSCRIPTION_REQUIRED");
        break;
      case 3:
        v58 = CFSTR("UNSUPPORTED_MEDIA_TYPE");
        break;
      case 4:
        v58 = CFSTR("EXPLICIT_CONTENT_SETTINGS");
        break;
      case 5:
        v58 = CFSTR("CELLULAR_DATA_SETTINGS");
        break;
      case 6:
        v58 = CFSTR("RESTRICTED_CONTENT");
        break;
      case 7:
        v58 = CFSTR("SERVICE_UNAVAILABLE");
        break;
      case 8:
        v58 = CFSTR("REGION_RESTRICTION");
        break;
      default:
        switch((int)v57)
        {
          case 'd':
            v58 = CFSTR("APP_NOT_CONFIGURED");
            break;
          case 'e':
            v58 = CFSTR("APP_NOT_AVAILABLE");
            break;
          case 'f':
            v58 = CFSTR("APP_ACCOUNT_FAILURE");
            break;
          case 'g':
            v58 = CFSTR("APP_DOESNT_SUPPORT_INTENT");
            break;
          default:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v57);
            v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("mediaItemsUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasParticipantUnsupportedReason](self, "hasParticipantUnsupportedReason"))
  {
    v59 = -[_INPBPayloadUnsupported participantUnsupportedReason](self, "participantUnsupportedReason");
    if ((_DWORD)v59 == 1)
    {
      v60 = CFSTR("INVALID_PARTICIPANT");
    }
    else if ((_DWORD)v59 == 2)
    {
      v60 = CFSTR("PARTICIPANT_NOT_FOUND");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v59);
      v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("participantUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasAddCallParticipantIntentParticipantsUnsupportedReason](self, "hasAddCallParticipantIntentParticipantsUnsupportedReason"))
  {
    v61 = -[_INPBPayloadUnsupported addCallParticipantIntentParticipantsUnsupportedReason](self, "addCallParticipantIntentParticipantsUnsupportedReason");
    if ((v61 - 1) >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v61);
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v62 = off_1E228E980[(v61 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("participantsUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSendPaymentIntentPayeeUnsupportedReason](self, "hasSendPaymentIntentPayeeUnsupportedReason"))
  {
    v63 = -[_INPBPayloadUnsupported sendPaymentIntentPayeeUnsupportedReason](self, "sendPaymentIntentPayeeUnsupportedReason");
    if ((v63 - 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v63);
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64 = off_1E228E9B0[(v63 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("payeeUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasRequestPaymentIntentPayerUnsupportedReason](self, "hasRequestPaymentIntentPayerUnsupportedReason"))
  {
    v65 = -[_INPBPayloadUnsupported requestPaymentIntentPayerUnsupportedReason](self, "requestPaymentIntentPayerUnsupportedReason");
    if ((v65 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v65);
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v66 = off_1E228E9D0[(v65 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("payerUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasPlayMediaIntentPlaybackSpeedUnsupportedReason](self, "hasPlayMediaIntentPlaybackSpeedUnsupportedReason"))
  {
    v67 = -[_INPBPayloadUnsupported playMediaIntentPlaybackSpeedUnsupportedReason](self, "playMediaIntentPlaybackSpeedUnsupportedReason");
    if ((_DWORD)v67 == 1)
    {
      v68 = CFSTR("BELOW_MINIMUM");
    }
    else if ((_DWORD)v67 == 2)
    {
      v68 = CFSTR("ABOVE_MAXIMUM");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v67);
      v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("playbackSpeedUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasStartCallIntentPreferredCallProviderUnsupportedReason](self, "hasStartCallIntentPreferredCallProviderUnsupportedReason"))
  {
    v69 = -[_INPBPayloadUnsupported startCallIntentPreferredCallProviderUnsupportedReason](self, "startCallIntentPreferredCallProviderUnsupportedReason");
    if ((v69 - 1) >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v69);
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = off_1E228E9E8[(v69 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("preferredCallProviderUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasReason](self, "hasReason"))
  {
    v71 = -[_INPBPayloadUnsupported reason](self, "reason");
    v72 = CFSTR("None");
    switch((int)v71)
    {
      case 1:
        break;
      case 2:
        v72 = CFSTR("NotNow");
        break;
      case 3:
        v72 = CFSTR("NotHere");
        break;
      case 4:
        v72 = CFSTR("ConflictWithOtherFields");
        break;
      default:
        if ((_DWORD)v71 == 1000)
        {
          v72 = CFSTR("UnsupportedReasonExtension");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v71);
          v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("reason"));

  }
  if (-[_INPBPayloadUnsupported hasShareETAIntentRecipientUnsupportedReason](self, "hasShareETAIntentRecipientUnsupportedReason"))
  {
    v73 = -[_INPBPayloadUnsupported shareETAIntentRecipientUnsupportedReason](self, "shareETAIntentRecipientUnsupportedReason");
    if (v73 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v73);
      v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v74 = off_1E228EA18[v73];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("recipientUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasStopShareETAIntentRecipientUnsupportedReason](self, "hasStopShareETAIntentRecipientUnsupportedReason"))
  {
    v75 = -[_INPBPayloadUnsupported stopShareETAIntentRecipientUnsupportedReason](self, "stopShareETAIntentRecipientUnsupportedReason");
    if (v75 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v75);
      v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = off_1E228EA18[v75];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("recipientUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSendMessageIntentRecipientUnsupportedReason](self, "hasSendMessageIntentRecipientUnsupportedReason"))
  {
    v77 = -[_INPBPayloadUnsupported sendMessageIntentRecipientUnsupportedReason](self, "sendMessageIntentRecipientUnsupportedReason");
    if ((v77 - 1) >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v77);
      v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v78 = off_1E228EA40[(v77 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("recipientUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSendAnnouncementIntentRecipientsUnsupportedReason](self, "hasSendAnnouncementIntentRecipientsUnsupportedReason"))
  {
    v79 = -[_INPBPayloadUnsupported sendAnnouncementIntentRecipientsUnsupportedReason](self, "sendAnnouncementIntentRecipientsUnsupportedReason");
    if ((v79 - 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v79);
      v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v80 = off_1E228EA90[(v79 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("recipientsUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSaveHealthSampleIntentRecordDateUnsupportedReason](self, "hasSaveHealthSampleIntentRecordDateUnsupportedReason"))
  {
    v81 = -[_INPBPayloadUnsupported saveHealthSampleIntentRecordDateUnsupportedReason](self, "saveHealthSampleIntentRecordDateUnsupportedReason");
    if ((v81 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v81);
      v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v82 = off_1E228EAB0[(v81 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("recordDateUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasTargetEventUnsupportedReason](self, "hasTargetEventUnsupportedReason"))
  {
    v83 = -[_INPBPayloadUnsupported targetEventUnsupportedReason](self, "targetEventUnsupportedReason");
    if ((_DWORD)v83 == 1)
    {
      v84 = CFSTR("TARGET_EVENT_NOT_FOUND");
    }
    else if ((_DWORD)v83 == 2)
    {
      v84 = CFSTR("TARGET_EVENT_NOT_CREATED_BY_USER");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v83);
      v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("targetEventUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasAddTasksIntentTargetTaskListMembersUnsupportedReason](self, "hasAddTasksIntentTargetTaskListMembersUnsupportedReason"))
  {
    v85 = -[_INPBPayloadUnsupported addTasksIntentTargetTaskListMembersUnsupportedReason](self, "addTasksIntentTargetTaskListMembersUnsupportedReason");
    if ((_DWORD)v85 == 1)
    {
      v86 = CFSTR("NO_SHARED_LIST_WITH_CONTACT");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v85);
      v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("targetTaskListMembersUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSetTimerAttributeIntentTargetTimerUnsupportedReason](self, "hasSetTimerAttributeIntentTargetTimerUnsupportedReason"))
  {
    v87 = -[_INPBPayloadUnsupported setTimerAttributeIntentTargetTimerUnsupportedReason](self, "setTimerAttributeIntentTargetTimerUnsupportedReason");
    if ((_DWORD)v87)
    {
      if ((_DWORD)v87 == 1)
      {
        v88 = CFSTR("NO_TIMERS");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v87);
        v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v88 = CFSTR("NOT_FOUND");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v88, CFSTR("targetTimerUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasDeleteTasksIntentTaskListUnsupportedReason](self, "hasDeleteTasksIntentTaskListUnsupportedReason"))
  {
    v89 = -[_INPBPayloadUnsupported deleteTasksIntentTaskListUnsupportedReason](self, "deleteTasksIntentTaskListUnsupportedReason");
    if ((_DWORD)v89 == 1)
    {
      v90 = CFSTR("NO_TASK_LIST_FOUND");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v89);
      v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("taskListUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasDeleteTasksIntentTaskUnsupportedReason](self, "hasDeleteTasksIntentTaskUnsupportedReason"))
  {
    v91 = -[_INPBPayloadUnsupported deleteTasksIntentTaskUnsupportedReason](self, "deleteTasksIntentTaskUnsupportedReason");
    if ((_DWORD)v91 == 1)
    {
      v92 = CFSTR("NO_TASKS_FOUND");
    }
    else if ((_DWORD)v91 == 2)
    {
      v92 = CFSTR("NO_TASKS_IN_APP");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v91);
      v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("taskUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSnoozeTasksIntentTaskUnsupportedReason](self, "hasSnoozeTasksIntentTaskUnsupportedReason"))
  {
    v93 = -[_INPBPayloadUnsupported snoozeTasksIntentTaskUnsupportedReason](self, "snoozeTasksIntentTaskUnsupportedReason");
    if ((_DWORD)v93 == 1)
    {
      v94 = CFSTR("NO_TASKS_FOUND");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v93);
      v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v94, CFSTR("taskUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasAddTasksIntentTemporalEventTriggerUnsupportedReason](self, "hasAddTasksIntentTemporalEventTriggerUnsupportedReason"))
  {
    v95 = -[_INPBPayloadUnsupported addTasksIntentTemporalEventTriggerUnsupportedReason](self, "addTasksIntentTemporalEventTriggerUnsupportedReason");
    if ((_DWORD)v95 == 1)
    {
      v96 = CFSTR("TIME_IN_PAST");
    }
    else if ((_DWORD)v95 == 2)
    {
      v96 = CFSTR("INVALID_RECURRENCE");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v95);
      v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("temporalEventTriggerUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason](self, "hasSetTaskAttributeIntentTemporalEventTriggerUnsupportedReason"))
  {
    v97 = -[_INPBPayloadUnsupported setTaskAttributeIntentTemporalEventTriggerUnsupportedReason](self, "setTaskAttributeIntentTemporalEventTriggerUnsupportedReason");
    if ((_DWORD)v97 == 1)
    {
      v98 = CFSTR("TIME_IN_PAST");
    }
    else if ((_DWORD)v97 == 2)
    {
      v98 = CFSTR("INVALID_RECURRENCE");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v97);
      v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("temporalEventTriggerUnsupportedReason"));

  }
  if (-[_INPBPayloadUnsupported hasRunWorkflowIntentWorkflowUnsupportedReason](self, "hasRunWorkflowIntentWorkflowUnsupportedReason"))
  {
    v99 = -[_INPBPayloadUnsupported runWorkflowIntentWorkflowUnsupportedReason](self, "runWorkflowIntentWorkflowUnsupportedReason");
    if ((_DWORD)v99)
    {
      if ((_DWORD)v99 == 1)
      {
        v100 = CFSTR("NO_WORKFLOWS");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v99);
        v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v100 = CFSTR("NOT_FOUND");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v100, CFSTR("workflowUnsupportedReason"));

  }
  v101 = v3;

  return v101;
}

- (int)updateAlarmIntentAlarmUnsupportedReason
{
  return self->_updateAlarmIntentAlarmUnsupportedReason;
}

- (int)changeAlarmStatusIntentAlarmsUnsupportedReason
{
  return self->_changeAlarmStatusIntentAlarmsUnsupportedReason;
}

- (int)deleteAlarmIntentAlarmsUnsupportedReason
{
  return self->_deleteAlarmIntentAlarmsUnsupportedReason;
}

- (int)searchAlarmIntentAlarmsUnsupportedReason
{
  return self->_searchAlarmIntentAlarmsUnsupportedReason;
}

- (int)snoozeAlarmIntentAlarmsUnsupportedReason
{
  return self->_snoozeAlarmIntentAlarmsUnsupportedReason;
}

- (int)sendAnnouncementIntentAnnouncementUnsupportedReason
{
  return self->_sendAnnouncementIntentAnnouncementUnsupportedReason;
}

- (int)startCallIntentCallCapabilityUnsupportedReason
{
  return self->_startCallIntentCallCapabilityUnsupportedReason;
}

- (int)startCallIntentCallRecordToCallBackUnsupportedReason
{
  return self->_startCallIntentCallRecordToCallBackUnsupportedReason;
}

- (NSArray)conflictingParameters
{
  return self->_conflictingParameters;
}

- (int)addTasksIntentContactEventTriggerUnsupportedReason
{
  return self->_addTasksIntentContactEventTriggerUnsupportedReason;
}

- (int)setTaskAttributeIntentContactEventTriggerUnsupportedReason
{
  return self->_setTaskAttributeIntentContactEventTriggerUnsupportedReason;
}

- (int)startCallIntentContactsUnsupportedReason
{
  return self->_startCallIntentContactsUnsupportedReason;
}

- (int)requestPaymentIntentCurrencyAmountUnsupportedReason
{
  return self->_requestPaymentIntentCurrencyAmountUnsupportedReason;
}

- (int)sendPaymentIntentCurrencyAmountUnsupportedReason
{
  return self->_sendPaymentIntentCurrencyAmountUnsupportedReason;
}

- (unsigned)customUnsupportedReason
{
  return self->_customUnsupportedReason;
}

- (int)dateTimeRangeUnsupportedReason
{
  return self->_dateTimeRangeUnsupportedReason;
}

- (int)findDeviceAndPlaySoundIntentDeviceUnsupportedReason
{
  return self->_findDeviceAndPlaySoundIntentDeviceUnsupportedReason;
}

- (int)joinCallIntentGroupConversationUnsupportedReason
{
  return self->_joinCallIntentGroupConversationUnsupportedReason;
}

- (int)reportIncidentIntentIncidentTypeUnsupportedReason
{
  return self->_reportIncidentIntentIncidentTypeUnsupportedReason;
}

- (int)createTimerIntentLabelUnsupportedReason
{
  return self->_createTimerIntentLabelUnsupportedReason;
}

- (int)addMediaIntentMediaDestinationUnsupportedReason
{
  return self->_addMediaIntentMediaDestinationUnsupportedReason;
}

- (int)addMediaIntentMediaItemsUnsupportedReason
{
  return self->_addMediaIntentMediaItemsUnsupportedReason;
}

- (int)playMediaIntentMediaItemsUnsupportedReason
{
  return self->_playMediaIntentMediaItemsUnsupportedReason;
}

- (int)searchForMediaIntentMediaItemsUnsupportedReason
{
  return self->_searchForMediaIntentMediaItemsUnsupportedReason;
}

- (int)updateMediaAffinityIntentMediaItemsUnsupportedReason
{
  return self->_updateMediaAffinityIntentMediaItemsUnsupportedReason;
}

- (int)participantUnsupportedReason
{
  return self->_participantUnsupportedReason;
}

- (int)addCallParticipantIntentParticipantsUnsupportedReason
{
  return self->_addCallParticipantIntentParticipantsUnsupportedReason;
}

- (int)sendPaymentIntentPayeeUnsupportedReason
{
  return self->_sendPaymentIntentPayeeUnsupportedReason;
}

- (int)requestPaymentIntentPayerUnsupportedReason
{
  return self->_requestPaymentIntentPayerUnsupportedReason;
}

- (int)playMediaIntentPlaybackSpeedUnsupportedReason
{
  return self->_playMediaIntentPlaybackSpeedUnsupportedReason;
}

- (int)startCallIntentPreferredCallProviderUnsupportedReason
{
  return self->_startCallIntentPreferredCallProviderUnsupportedReason;
}

- (int)reason
{
  return self->_reason;
}

- (int)shareETAIntentRecipientUnsupportedReason
{
  return self->_shareETAIntentRecipientUnsupportedReason;
}

- (int)stopShareETAIntentRecipientUnsupportedReason
{
  return self->_stopShareETAIntentRecipientUnsupportedReason;
}

- (int)sendMessageIntentRecipientUnsupportedReason
{
  return self->_sendMessageIntentRecipientUnsupportedReason;
}

- (int)sendAnnouncementIntentRecipientsUnsupportedReason
{
  return self->_sendAnnouncementIntentRecipientsUnsupportedReason;
}

- (int)saveHealthSampleIntentRecordDateUnsupportedReason
{
  return self->_saveHealthSampleIntentRecordDateUnsupportedReason;
}

- (int)targetEventUnsupportedReason
{
  return self->_targetEventUnsupportedReason;
}

- (int)addTasksIntentTargetTaskListMembersUnsupportedReason
{
  return self->_addTasksIntentTargetTaskListMembersUnsupportedReason;
}

- (int)setTimerAttributeIntentTargetTimerUnsupportedReason
{
  return self->_setTimerAttributeIntentTargetTimerUnsupportedReason;
}

- (int)deleteTasksIntentTaskListUnsupportedReason
{
  return self->_deleteTasksIntentTaskListUnsupportedReason;
}

- (int)deleteTasksIntentTaskUnsupportedReason
{
  return self->_deleteTasksIntentTaskUnsupportedReason;
}

- (int)snoozeTasksIntentTaskUnsupportedReason
{
  return self->_snoozeTasksIntentTaskUnsupportedReason;
}

- (int)addTasksIntentTemporalEventTriggerUnsupportedReason
{
  return self->_addTasksIntentTemporalEventTriggerUnsupportedReason;
}

- (int)setTaskAttributeIntentTemporalEventTriggerUnsupportedReason
{
  return self->_setTaskAttributeIntentTemporalEventTriggerUnsupportedReason;
}

- (int)runWorkflowIntentWorkflowUnsupportedReason
{
  return self->_runWorkflowIntentWorkflowUnsupportedReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictingParameters, 0);
}

+ (Class)conflictingParametersType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
