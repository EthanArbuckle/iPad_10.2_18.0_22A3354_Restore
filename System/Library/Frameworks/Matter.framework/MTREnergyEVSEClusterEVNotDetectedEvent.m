@implementation MTREnergyEVSEClusterEVNotDetectedEvent

- (MTREnergyEVSEClusterEVNotDetectedEvent)init
{
  MTREnergyEVSEClusterEVNotDetectedEvent *v2;
  MTREnergyEVSEClusterEVNotDetectedEvent *v3;
  NSNumber *sessionID;
  NSNumber *state;
  NSNumber *sessionDuration;
  NSNumber *sessionEnergyCharged;
  NSNumber *sessionEnergyDischarged;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTREnergyEVSEClusterEVNotDetectedEvent;
  v2 = -[MTREnergyEVSEClusterEVNotDetectedEvent init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    sessionID = v2->_sessionID;
    v2->_sessionID = (NSNumber *)&unk_250591B18;

    state = v3->_state;
    v3->_state = (NSNumber *)&unk_250591B18;

    sessionDuration = v3->_sessionDuration;
    v3->_sessionDuration = (NSNumber *)&unk_250591B18;

    sessionEnergyCharged = v3->_sessionEnergyCharged;
    v3->_sessionEnergyCharged = (NSNumber *)&unk_250591B18;

    sessionEnergyDischarged = v3->_sessionEnergyDischarged;
    v3->_sessionEnergyDischarged = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTREnergyEVSEClusterEVNotDetectedEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  v4 = objc_alloc_init(MTREnergyEVSEClusterEVNotDetectedEvent);
  objc_msgSend_sessionID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSessionID_(v4, v8, (uint64_t)v7);

  objc_msgSend_state(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setState_(v4, v12, (uint64_t)v11);

  objc_msgSend_sessionDuration(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSessionDuration_(v4, v16, (uint64_t)v15);

  objc_msgSend_sessionEnergyCharged(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSessionEnergyCharged_(v4, v20, (uint64_t)v19);

  objc_msgSend_sessionEnergyDischarged(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSessionEnergyDischarged_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: sessionID:%@; state:%@; sessionDuration:%@; sessionEnergyCharged:%@; sessionEnergyDischarged:%@; >"),
    v5,
    self->_sessionID,
    self->_state,
    self->_sessionDuration,
    self->_sessionEnergyCharged,
    self->_sessionEnergyDischarged);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)sessionDuration
{
  return self->_sessionDuration;
}

- (void)setSessionDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)sessionEnergyCharged
{
  return self->_sessionEnergyCharged;
}

- (void)setSessionEnergyCharged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)sessionEnergyDischarged
{
  return self->_sessionEnergyDischarged;
}

- (void)setSessionEnergyDischarged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEnergyDischarged, 0);
  objc_storeStrong((id *)&self->_sessionEnergyCharged, 0);
  objc_storeStrong((id *)&self->_sessionDuration, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
