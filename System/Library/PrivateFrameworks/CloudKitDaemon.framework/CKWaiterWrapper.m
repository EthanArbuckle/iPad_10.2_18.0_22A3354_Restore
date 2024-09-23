@implementation CKWaiterWrapper

- (CKWaiterWrapper)initWithWaiter:(id)a3 zoneIDs:(id)a4 waitCompletedHandler:(id)a5 activity:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKWaiterWrapper *v15;
  CKWaiterWrapper *v16;
  void *v17;
  id waitCompletedHandler;
  uint64_t v19;
  NSString *personaID;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CKWaiterWrapper;
  v15 = -[CKWaiterWrapper init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_waiter, a3);
    objc_storeStrong((id *)&v16->_zoneIDs, a4);
    v17 = _Block_copy(v13);
    waitCompletedHandler = v16->_waitCompletedHandler;
    v16->_waitCompletedHandler = v17;

    objc_storeStrong((id *)&v16->_activity, a6);
    CKCurrentPersonaID();
    v19 = objc_claimAutoreleasedReturnValue();
    personaID = v16->_personaID;
    v16->_personaID = (NSString *)v19;

  }
  return v16;
}

- (void)invokeWaitCompletedHandler:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  objc_msgSend_activity(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v5, &state);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BEA4379C;
  v6[3] = &unk_1E7830650;
  v6[4] = self;
  v7 = a3;
  CKMuckingWithPersonas(v6);
  os_activity_scope_leave(&state);
}

- (id)description
{
  return (id)((uint64_t (*)(CKWaiterWrapper *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_ckShortDescription(self->_waiter, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("waiter=%@, zoneIDs=%@"), v5, self->_zoneIDs);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CKDZoneGatekeeperWaiter)waiter
{
  return self->_waiter;
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (id)waitCompletedHandler
{
  return self->_waitCompletedHandler;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong(&self->_waitCompletedHandler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong((id *)&self->_waiter, 0);
}

@end
