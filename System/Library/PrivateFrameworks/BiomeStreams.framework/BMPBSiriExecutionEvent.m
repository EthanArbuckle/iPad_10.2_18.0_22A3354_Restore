@implementation BMPBSiriExecutionEvent

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

- (int)taskStep
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_taskStep;
  else
    return 0;
}

- (void)setTaskStep:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_taskStep = a3;
}

- (void)setHasTaskStep:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTaskStep
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)taskStepAsString:(int)a3
{
  if (a3 < 0x5E)
    return off_1E2648F30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTaskStep:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Start")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Authentication")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Wait")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Resume")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Canceled")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Failed")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Completed")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HandoffToCompanion")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SiriExecutionTaskStepTypeSaved")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserAuthenticated")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResolveConfirmStart")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResolveConfirmFinish")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HandleIntentStart")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HandleIntentFinish")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Disambiguation")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PromptForData")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Confirmation")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TapToEditCorrection")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FetchData")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResolveApp")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SuggestApp")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DisambiguateApp")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConfirmApp")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SearchCompleted")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Generic")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PromptUnlock")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShowInterstitial")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ContactResolution")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DeviceSearch")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IntentAutoConfirm")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CheckUnsetRelationship")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConfirmIntent")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ModifySlotValue")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReadingStart")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RememberUnsetRelationship")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResolveSlotAuthenticationRequired")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResolveSlotConfirm")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConfirmationAccepted")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConfirmationRejected")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResolveSlotDisambiguate")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DisambiguationResponseReceived")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DisambiguationManualOverride")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResolveSlotNeedsValue")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResolveSlotNotRequired")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResolveSlotSuccess")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResolveSlotUnsupported")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetUnsetRelationship")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SubtaskCompleted")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TermConditionCheck")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DirectExecution")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SearchKnowledgeFromSports")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SearchLocalEventsFromSports")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SearchWebFromSports")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IntentReformation")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DialogCompleted")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DialogFailed")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SportsProbeStarted")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SportsProbeNoResultsOrUnsupported")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SportsProbeFailed")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SportsProbeSuccessful")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Preprocess")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Render")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FlowReplan")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SendViaSnippet")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ContentChangedViaSnippet")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GateKeeperNewCall")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GateKeeperNewMessage")) & 1) != 0)
  {
    v4 = 67;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GateKeeperReadMessage")) & 1) != 0)
  {
    v4 = 68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Skip")) & 1) != 0)
  {
    v4 = 69;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Stop")) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Reply")) & 1) != 0)
  {
    v4 = 71;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AudioReply")) & 1) != 0)
  {
    v4 = 72;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReadAgain")) & 1) != 0)
  {
    v4 = 73;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ModifyMessage")) & 1) != 0)
  {
    v4 = 74;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReplyWithCall")) & 1) != 0)
  {
    v4 = 75;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TCCAccepted")) & 1) != 0)
  {
    v4 = 76;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TCCDeclined")) & 1) != 0)
  {
    v4 = 77;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetCallBackgroundState")) & 1) != 0)
  {
    v4 = 78;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SearchFailed")) & 1) != 0)
  {
    v4 = 79;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fallback")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartialFailure")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Correction")) & 1) != 0)
  {
    v4 = 82;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AutoSend")) & 1) != 0)
  {
    v4 = 83;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AutoSendStarted")) & 1) != 0)
  {
    v4 = 84;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CheckSharingPolicy")) & 1) != 0)
  {
    v4 = 85;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PostNotificationToCompanion")) & 1) != 0)
  {
    v4 = 86;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExecuteOnRemote")) & 1) != 0)
  {
    v4 = 87;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NeedsServerExecution")) & 1) != 0)
  {
    v4 = 88;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CheckPersonalDomainSetting")) & 1) != 0)
  {
    v4 = 89;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CheckPersonalDomainSettingResponse")) & 1) != 0)
  {
    v4 = 90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RequestIdentity")) & 1) != 0)
  {
    v4 = 91;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConfirmIdentity")) & 1) != 0)
  {
    v4 = 92;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CheckCompanionCompatibility")))
  {
    v4 = 93;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasStatusReason
{
  return self->_statusReason != 0;
}

- (BOOL)hasSlotValue
{
  return self->_slotValue != 0;
}

- (BOOL)hasIntentName
{
  return self->_intentName != 0;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (BOOL)hasInteractionId
{
  return self->_interactionId != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)BMPBSiriExecutionEvent;
  -[BMPBSiriExecutionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBSiriExecutionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *taskId;
  uint64_t taskStep;
  __CFString *v7;
  NSString *statusReason;
  NSString *slotValue;
  NSString *intentName;
  NSString *appBundleId;
  NSString *interactionId;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  taskId = self->_taskId;
  if (taskId)
    objc_msgSend(v3, "setObject:forKey:", taskId, CFSTR("taskId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    taskStep = self->_taskStep;
    if (taskStep >= 0x5E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_taskStep);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2648F30[taskStep];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("taskStep"));

  }
  statusReason = self->_statusReason;
  if (statusReason)
    objc_msgSend(v4, "setObject:forKey:", statusReason, CFSTR("statusReason"));
  slotValue = self->_slotValue;
  if (slotValue)
    objc_msgSend(v4, "setObject:forKey:", slotValue, CFSTR("slotValue"));
  intentName = self->_intentName;
  if (intentName)
    objc_msgSend(v4, "setObject:forKey:", intentName, CFSTR("intentName"));
  appBundleId = self->_appBundleId;
  if (appBundleId)
    objc_msgSend(v4, "setObject:forKey:", appBundleId, CFSTR("appBundleId"));
  interactionId = self->_interactionId;
  if (interactionId)
    objc_msgSend(v4, "setObject:forKey:", interactionId, CFSTR("interactionId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("absoluteTimestamp"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSiriExecutionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_taskId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_statusReason)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_slotValue)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_intentName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_appBundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_interactionId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_taskId)
  {
    objc_msgSend(v4, "setTaskId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_taskStep;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  if (self->_statusReason)
  {
    objc_msgSend(v5, "setStatusReason:");
    v4 = v5;
  }
  if (self->_slotValue)
  {
    objc_msgSend(v5, "setSlotValue:");
    v4 = v5;
  }
  if (self->_intentName)
  {
    objc_msgSend(v5, "setIntentName:");
    v4 = v5;
  }
  if (self->_appBundleId)
  {
    objc_msgSend(v5, "setAppBundleId:");
    v4 = v5;
  }
  if (self->_interactionId)
  {
    objc_msgSend(v5, "setInteractionId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 68) |= 1u;
  }

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
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_taskId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_taskStep;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_statusReason, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_slotValue, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_intentName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  v16 = -[NSString copyWithZone:](self->_interactionId, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *taskId;
  NSString *statusReason;
  NSString *slotValue;
  NSString *intentName;
  NSString *appBundleId;
  NSString *interactionId;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  taskId = self->_taskId;
  if ((unint64_t)taskId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](taskId, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_taskStep != *((_DWORD *)v4 + 16))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
LABEL_23:
    v11 = 0;
    goto LABEL_24;
  }
  statusReason = self->_statusReason;
  if ((unint64_t)statusReason | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](statusReason, "isEqual:"))
  {
    goto LABEL_23;
  }
  slotValue = self->_slotValue;
  if ((unint64_t)slotValue | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](slotValue, "isEqual:"))
      goto LABEL_23;
  }
  intentName = self->_intentName;
  if ((unint64_t)intentName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](intentName, "isEqual:"))
      goto LABEL_23;
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:"))
      goto LABEL_23;
  }
  interactionId = self->_interactionId;
  if ((unint64_t)interactionId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](interactionId, "isEqual:"))
      goto LABEL_23;
  }
  v11 = (*((_BYTE *)v4 + 68) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_23;
    v11 = 1;
  }
LABEL_24:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  double absoluteTimestamp;
  double v12;
  long double v13;
  double v14;

  v3 = -[NSString hash](self->_taskId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_taskStep;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_statusReason, "hash");
  v6 = -[NSString hash](self->_slotValue, "hash");
  v7 = -[NSString hash](self->_intentName, "hash");
  v8 = -[NSString hash](self->_appBundleId, "hash");
  v9 = -[NSString hash](self->_interactionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v12 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v12 = self->_absoluteTimestamp;
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
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[BMPBSiriExecutionEvent setTaskId:](self, "setTaskId:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    self->_taskStep = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[BMPBSiriExecutionEvent setStatusReason:](self, "setStatusReason:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[BMPBSiriExecutionEvent setSlotValue:](self, "setSlotValue:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBSiriExecutionEvent setIntentName:](self, "setIntentName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBSiriExecutionEvent setAppBundleId:](self, "setAppBundleId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBSiriExecutionEvent setInteractionId:](self, "setInteractionId:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(id)a3
{
  objc_storeStrong((id *)&self->_taskId, a3);
}

- (NSString)statusReason
{
  return self->_statusReason;
}

- (void)setStatusReason:(id)a3
{
  objc_storeStrong((id *)&self->_statusReason, a3);
}

- (NSString)slotValue
{
  return self->_slotValue;
}

- (void)setSlotValue:(id)a3
{
  objc_storeStrong((id *)&self->_slotValue, a3);
}

- (NSString)intentName
{
  return self->_intentName;
}

- (void)setIntentName:(id)a3
{
  objc_storeStrong((id *)&self->_intentName, a3);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (void)setInteractionId:(id)a3
{
  objc_storeStrong((id *)&self->_interactionId, a3);
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->_statusReason, 0);
  objc_storeStrong((id *)&self->_slotValue, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_intentName, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end
