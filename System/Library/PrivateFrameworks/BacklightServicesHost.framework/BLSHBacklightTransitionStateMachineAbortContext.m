@implementation BLSHBacklightTransitionStateMachineAbortContext

+ (unsigned)backlightChangeRequestExplanationIdentifierFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = a3;
  if (backlightChangeRequestExplanationIdentifierFromString__onceToken != -1)
    dispatch_once(&backlightChangeRequestExplanationIdentifierFromString__onceToken, &__block_literal_global);
  objc_msgSend((id)backlightChangeRequestExplanationIdentifierFromString__exactMatches, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
  }
  else if (objc_msgSend(v3, "containsString:", CFSTR(" - force active")))
  {
    v6 = 1000;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __105__BLSHBacklightTransitionStateMachineAbortContext_backlightChangeRequestExplanationIdentifierFromString___block_invoke()
{
  void *v0;

  v0 = (void *)backlightChangeRequestExplanationIdentifierFromString__exactMatches;
  backlightChangeRequestExplanationIdentifierFromString__exactMatches = (uint64_t)&unk_24D1DD438;

}

- (BLSHBacklightTransitionStateMachineAbortContext)initWithCurrentState:(id)a3 targetState:(id)a4 activeEvents:(id)a5 abortedEvents:(id)a6 pendingEnvironmentUpdate:(id)a7 pendingUpdatePresentation:(id)a8 pendingUpdateToSpecifier:(id)a9 pendingUpdateDisplayMode:(id)a10 ensureFlipbookCurrentOperation:(id)a11 queuedEventsToPerform:(id)a12 pendingPrewarmedEvent:(id)a13 environmentStateMachine:(id)a14 sleepRequested:(BOOL)a15 sleepImminent:(BOOL)a16 timeInSleepImminent:(double)a17
{
  id v23;
  id v24;
  id v25;
  id v26;
  BLSHBacklightTransitionStateMachineAbortContext *v27;
  BLSHBacklightTransitionStateMachineAbortContext *v28;
  id v31;
  id v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v41 = a3;
  v31 = a4;
  v40 = a4;
  v39 = a5;
  v32 = a6;
  v38 = a6;
  v37 = a7;
  v36 = a8;
  v35 = a9;
  v34 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  v42.receiver = self;
  v42.super_class = (Class)BLSHBacklightTransitionStateMachineAbortContext;
  v27 = -[BLSHBacklightTransitionStateMachineAbortContext init](&v42, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_currentState, a3);
    objc_storeStrong((id *)&v28->_targetState, v31);
    objc_storeStrong((id *)&v28->_activeEvents, a5);
    objc_storeStrong((id *)&v28->_abortedEvents, v32);
    objc_storeStrong((id *)&v28->_pendingEnvironmentUpdate, a7);
    objc_storeStrong((id *)&v28->_pendingUpdatePresentation, a8);
    objc_storeStrong((id *)&v28->_pendingUpdateToSpecifier, a9);
    objc_storeStrong((id *)&v28->_pendingUpdateDisplayMode, a10);
    objc_storeStrong((id *)&v28->_ensureFlipbookCurrentOperation, a11);
    objc_storeStrong((id *)&v28->_queuedEventsToPerform, a12);
    objc_storeStrong((id *)&v28->_pendingPrewarmedEvent, a13);
    objc_storeStrong((id *)&v28->_environmentStateMachine, a14);
    v28->_sleepRequested = a15;
    v28->_sleepImminent = a16;
    v28->_timeInSleepImminent = a17;
    v28->_abortReason = 1;
    v28->_payloadSize = 376;
    -[BLSHBacklightTransitionStateMachineAbortContext _populatePayload](v28, "_populatePayload");
  }

  return v28;
}

- (NSString)abortReasonString
{
  if (self->_abortReason == 4)
    return (NSString *)CFSTR("TSM_SI");
  else
    return (NSString *)CFSTR("TSM");
}

- (BOOL)hasEnsureFlipbookCurrent
{
  return self->_ensureFlipbookCurrentOperation != 0;
}

- (void)setSleepImminentAbortReason
{
  self->_abortReason = 4;
}

- (BOOL)wantsPanic
{
  return self->_abortReason == 4;
}

- (void)_populatePayload
{
  char *v3;
  void *v4;
  void *v5;
  BLSHPendingEnvironmentUpdateOperation *pendingEnvironmentUpdate;
  BLSHPendingEnvironmentUpdateOperation *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BLSHPendingUpdateDisplayMode *pendingUpdateDisplayMode;
  void *v18;
  BLSHBacklightEnvironmentStateMachine *environmentStateMachine;
  _BYTE *v20;

  v3 = (char *)malloc_type_calloc(1uLL, self->_payloadSize, 0x5ED3BE5CuLL);
  *(_DWORD *)v3 = 2;
  *((_DWORD *)v3 + 1) = -[BLSHBacklightAggregateState displayMode](self->_currentState, "displayMode");
  -[BLSHBacklightAggregateState presentation](self->_currentState, "presentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLSHBacklightEnvironmentStateMachineAbortPayload populatePresentationStruct:withPresentation:](BLSHBacklightEnvironmentStateMachineAbortPayload, "populatePresentationStruct:withPresentation:", v3 + 8, v4);

  *((_DWORD *)v3 + 8) = -[BLSHBacklightMutableTargetState displayMode](self->_targetState, "displayMode");
  -[BLSHBacklightMutableTargetState presentation](self->_targetState, "presentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLSHBacklightEnvironmentStateMachineAbortPayload populatePresentationStruct:withPresentation:](BLSHBacklightEnvironmentStateMachineAbortPayload, "populatePresentationStruct:withPresentation:", v3 + 36, v5);

  pendingEnvironmentUpdate = self->_pendingEnvironmentUpdate;
  v3[64] = v3[64] & 0xFE | (pendingEnvironmentUpdate != 0);
  if (pendingEnvironmentUpdate)
  {
    v7 = pendingEnvironmentUpdate;
    if (-[BLSHPendingEnvironmentUpdateOperation didUpdateInitialState](v7, "didUpdateInitialState"))
      v8 = 2;
    else
      v8 = 0;
    v3[64] = v3[64] & 0xFD | v8;
    -[BLSHPendingEnvironmentUpdateOperation triggerEvent](v7, "triggerEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v3 + 9) = objc_msgSend(v9, "eventID");

    -[BLSHPendingEnvironmentUpdateOperation triggerEvent](v7, "triggerEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v3 + 20) = objc_msgSend(v10, "state");

    -[BLSHPendingEnvironmentUpdateOperation triggerEvent](v7, "triggerEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v3 + 21) = objc_msgSend(v11, "previousState");

    -[BLSHPendingEnvironmentUpdateOperation initialSpecifier](v7, "initialSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    *((_QWORD *)v3 + 11) = v14;

    -[BLSHPendingEnvironmentUpdateOperation initialSpecifier](v7, "initialSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "specifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v3 + 24) = objc_msgSend(v16, "count");

  }
  v3[104] = v3[104] & 0xFE | (self->_pendingUpdatePresentation != 0);
  v3[108] = v3[108] & 0xFE | (self->_pendingUpdateToSpecifier != 0);
  pendingUpdateDisplayMode = self->_pendingUpdateDisplayMode;
  v3[112] = v3[112] & 0xFE | (pendingUpdateDisplayMode != 0);
  if (pendingUpdateDisplayMode)
    *((_DWORD *)v3 + 29) = -[BLSHPendingUpdateDisplayMode targetDisplayMode](pendingUpdateDisplayMode, "targetDisplayMode");
  -[NSArray firstObject](self->_queuedEventsToPerform, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _populateBacklightChangeEventStruct(v18, (uint64_t)(v3 + 264));

  _populateBacklightChangeEventStruct(self->_pendingPrewarmedEvent, (uint64_t)(v3 + 320));
  environmentStateMachine = self->_environmentStateMachine;
  v20 = v3 + 120;
  if (environmentStateMachine)
    -[BLSHBacklightEnvironmentStateMachine populateEnvironmentStateMachineStruct:](environmentStateMachine, "populateEnvironmentStateMachineStruct:", v20);
  else
    *v20 &= ~1u;
  self->_payload = v3;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_sleepRequested, CFSTR("sleepRequested"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_sleepImminent, CFSTR("sleepImminent"));
  NSStringFromBLSBacklightChangeEvents();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("events"));

  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_ensureFlipbookCurrentOperation, CFSTR("ensureFlipbookCurrentOperation"));
  if (self->_sleepImminent)
    v9 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("timeInSleepImminent"), 1, self->_timeInSleepImminent);
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", self->_currentState, CFSTR("currentState"));
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", self->_targetState, CFSTR("targetState"));
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", self->_pendingEnvironmentUpdate, CFSTR("pendingEnvironmentUpdate"));
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", self->_pendingUpdatePresentation, CFSTR("pendingUpdatePresentation"));
  v14 = (id)objc_msgSend(v3, "appendObject:withName:", self->_pendingUpdateToSpecifier, CFSTR("pendingUpdateToSpecifier"));
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", self->_queuedEventsToPerform, CFSTR("queuedEventsToPerform"));
  v16 = (id)objc_msgSend(v3, "appendObject:withName:", self->_pendingPrewarmedEvent, CFSTR("pendingPrewarmedEvent"));
  objc_msgSend(v3, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (void)dealloc
{
  void *payload;
  objc_super v4;

  payload = (void *)self->_payload;
  if (payload)
  {
    free(payload);
    self->_payload = 0;
    self->_payloadSize = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BLSHBacklightTransitionStateMachineAbortContext;
  -[BLSHBacklightTransitionStateMachineAbortContext dealloc](&v4, sel_dealloc);
}

- (unint64_t)abortReason
{
  return self->_abortReason;
}

- (const)payload
{
  return self->_payload;
}

- (unsigned)payloadSize
{
  return self->_payloadSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentStateMachine, 0);
  objc_storeStrong((id *)&self->_pendingPrewarmedEvent, 0);
  objc_storeStrong((id *)&self->_queuedEventsToPerform, 0);
  objc_storeStrong((id *)&self->_ensureFlipbookCurrentOperation, 0);
  objc_storeStrong((id *)&self->_pendingUpdateDisplayMode, 0);
  objc_storeStrong((id *)&self->_pendingUpdateToSpecifier, 0);
  objc_storeStrong((id *)&self->_pendingUpdatePresentation, 0);
  objc_storeStrong((id *)&self->_pendingEnvironmentUpdate, 0);
  objc_storeStrong((id *)&self->_abortedEvents, 0);
  objc_storeStrong((id *)&self->_activeEvents, 0);
  objc_storeStrong((id *)&self->_targetState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end
