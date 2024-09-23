@implementation BLSHEnvironmentTransitionStateTarget

- (BLSHEnvironmentTransitionStateTarget)initWithSequenceID:(unint64_t)a3 backlightState:(int64_t)a4 triggerEvent:(id)a5 backlightRampBlock:(id)a6 forIdentifier:(id)a7 previousTarget:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  int IsActive;
  BLSHPendingBacklightRamp *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  BLSHEnvironmentTransitionStateTarget *v24;
  int v26;
  BLSHEnvironmentTransitionStateTarget *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (!v17)
    goto LABEL_15;
  IsActive = BLSBacklightStateIsActive();
  objc_msgSend(v17, "backlightState");
  if (IsActive != BLSBacklightStateIsActive())
    goto LABEL_15;
  if (v15)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(v17, "pendingBacklightRamp");
    v19 = (BLSHPendingBacklightRamp *)objc_claimAutoreleasedReturnValue();
    if (-[BLSHPendingBacklightRamp hasPendingRamp](v19, "hasPendingRamp"))
    {
      bls_scenes_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        NSStringFromBLSBacklightState();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 134219010;
        v27 = self;
        v28 = 2114;
        v29 = v16;
        v30 = 2114;
        v31 = v21;
        v32 = 2114;
        v33 = v17;
        v34 = 2114;
        v35 = v14;
        _os_log_impl(&dword_2145AC000, v20, OS_LOG_TYPE_INFO, "ETS:%p:%{public}@ update to state:%{public}@ – inheriting old backlight ramp existingInProgress:%{public}@ – event:%{public}@", (uint8_t *)&v26, 0x34u);

      }
    }
  }
  if (!v14)
  {
    objc_msgSend(v17, "triggerEvent");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      bls_scenes_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        NSStringFromBLSBacklightState();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 134219010;
        v27 = self;
        v28 = 2114;
        v29 = v16;
        v30 = 2114;
        v31 = v23;
        v32 = 2114;
        v33 = v17;
        v34 = 2114;
        v35 = v14;
        _os_log_impl(&dword_2145AC000, v22, OS_LOG_TYPE_INFO, "ETS:%p:%{public}@ update to state:%{public}@ – inheriting old triggerEvent existingInProgress:%{public}@ – event:%{public}@", (uint8_t *)&v26, 0x34u);

      }
    }
  }
  if (!v19)
LABEL_15:
    v19 = -[BLSHPendingBacklightRamp initWithBacklightRampBlock:]([BLSHPendingBacklightRamp alloc], "initWithBacklightRampBlock:", v15);
  v24 = -[BLSHEnvironmentTransitionStateTarget initWithSequenceID:backlightState:visualState:presentationDate:triggerEvent:pendingBacklightRamp:](self, "initWithSequenceID:backlightState:visualState:presentationDate:triggerEvent:pendingBacklightRamp:", a3, a4, 0, 0, v14, v19);

  return v24;
}

- (BLSHEnvironmentTransitionStateTarget)initWithTarget:(id)a3 visualState:(id)a4 presentationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BLSHEnvironmentTransitionStateTarget *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v10, "sequenceID");
  v12 = objc_msgSend(v10, "backlightState");
  objc_msgSend(v10, "triggerEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pendingBacklightRamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[BLSHEnvironmentTransitionStateTarget initWithSequenceID:backlightState:visualState:presentationDate:triggerEvent:pendingBacklightRamp:](self, "initWithSequenceID:backlightState:visualState:presentationDate:triggerEvent:pendingBacklightRamp:", v11, v12, v9, v8, v13, v14);
  return v15;
}

- (BLSHEnvironmentTransitionStateTarget)initWithSequenceID:(unint64_t)a3 backlightState:(int64_t)a4 visualState:(id)a5 presentationDate:(id)a6 triggerEvent:(id)a7 pendingBacklightRamp:(id)a8
{
  id v15;
  id v16;
  id v17;
  BLSHEnvironmentTransitionStateTarget *v18;
  BLSHEnvironmentTransitionStateTarget *v19;
  id v21;
  objc_super v22;

  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BLSHEnvironmentTransitionStateTarget;
  v18 = -[BLSHEnvironmentTransitionStateTarget init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_sequenceID = a3;
    v18->_backlightState = a4;
    objc_storeStrong((id *)&v18->_visualState, a5);
    objc_storeStrong((id *)&v19->_presentationDate, a6);
    objc_storeStrong((id *)&v19->_triggerEvent, a7);
    objc_storeStrong((id *)&v19->_pendingBacklightRamp, a8);
  }

  return v19;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSHEnvironmentTransitionStateTarget *v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __51__BLSHEnvironmentTransitionStateTarget_description__block_invoke;
  v10 = &unk_24D1BBE80;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", 0, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __51__BLSHEnvironmentTransitionStateTarget_description__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id result;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 0);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "backlightState");
  NSStringFromBLSBacklightState();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, 0);

  v6 = *(id **)(a1 + 40);
  if (v6[5])
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6[5], "bls_shortLoggingString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, 0);

    v6 = *(id **)(a1 + 40);
  }
  if (v6[6])
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v6[6], "bls_shortLoggingString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v10, "appendObject:withName:", v11, 0);

    v6 = *(id **)(a1 + 40);
  }
  if (objc_msgSend(v6, "didUpdateInitialState"))
    v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", CFSTR("initialComplete"), 0);
  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "hasPendingRamp");
  if ((_DWORD)result)
    return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", CFSTR("pendingRamp"), 0);
  return result;
}

- (id)debugDescription
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_sequenceID, CFSTR("sequenceID"));
  -[BLSHEnvironmentTransitionStateTarget backlightState](self, "backlightState");
  NSStringFromBLSBacklightState();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("backlightState"));

  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_visualState, CFSTR("visualState"));
  -[NSDate bls_shortLoggingString](self->_presentationDate, "bls_shortLoggingString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("presentationDate"));

  v9 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHEnvironmentTransitionStateTarget didUpdateInitialState](self, "didUpdateInitialState"), CFSTR("updatedInitialState"), 1);
  v10 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHPendingBacklightRamp hasPendingRamp](self->_pendingBacklightRamp, "hasPendingRamp"), CFSTR("hasPendingBacklightRamp"), 1);
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt64:", self->_sequenceID);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_visualState);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_presentationDate);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t sequenceID;
  uint64_t v7;
  id v8;
  id v9;
  BLSBacklightSceneVisualState *visualState;
  id v11;
  id v12;
  NSDate *presentationDate;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sequenceID = self->_sequenceID;
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __48__BLSHEnvironmentTransitionStateTarget_isEqual___block_invoke;
  v21[3] = &unk_24D1BC3E8;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendInt64:counterpart:", sequenceID, v21);
  visualState = self->_visualState;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __48__BLSHEnvironmentTransitionStateTarget_isEqual___block_invoke_2;
  v19[3] = &unk_24D1BC410;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", visualState, v19);
  presentationDate = self->_presentationDate;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __48__BLSHEnvironmentTransitionStateTarget_isEqual___block_invoke_3;
  v17[3] = &unk_24D1BC410;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", presentationDate, v17);
  LOBYTE(presentationDate) = objc_msgSend(v5, "isEqual");

  return (char)presentationDate;
}

uint64_t __48__BLSHEnvironmentTransitionStateTarget_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sequenceID");
}

uint64_t __48__BLSHEnvironmentTransitionStateTarget_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "visualState");
}

uint64_t __48__BLSHEnvironmentTransitionStateTarget_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentationDate");
}

- (BOOL)isEqualToVisualState:(id)a3 presentationDate:(id)a4
{
  id v4;
  char v5;

  v4 = a4;
  if (BSEqualObjects())
    v5 = BSEqualObjects();
  else
    v5 = 0;

  return v5;
}

- (unint64_t)sequenceID
{
  return self->_sequenceID;
}

- (BLSBacklightChangeEvent)triggerEvent
{
  return self->_triggerEvent;
}

- (BLSHPendingBacklightRamp)pendingBacklightRamp
{
  return self->_pendingBacklightRamp;
}

- (BLSBacklightSceneVisualState)visualState
{
  return self->_visualState;
}

- (NSDate)presentationDate
{
  return self->_presentationDate;
}

- (int64_t)backlightState
{
  return self->_backlightState;
}

- (void)setBacklightState:(int64_t)a3
{
  self->_backlightState = a3;
}

- (BOOL)didUpdateInitialState
{
  return self->_didUpdateInitialState;
}

- (void)setDidUpdateInitialState:(BOOL)a3
{
  self->_didUpdateInitialState = a3;
}

- (BOOL)didCompleteAnimation
{
  return self->_didCompleteAnimation;
}

- (void)setDidCompleteAnimation:(BOOL)a3
{
  self->_didCompleteAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationDate, 0);
  objc_storeStrong((id *)&self->_visualState, 0);
  objc_storeStrong((id *)&self->_pendingBacklightRamp, 0);
  objc_storeStrong((id *)&self->_triggerEvent, 0);
}

@end
