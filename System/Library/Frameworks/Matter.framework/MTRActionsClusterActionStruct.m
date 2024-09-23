@implementation MTRActionsClusterActionStruct

- (MTRActionsClusterActionStruct)init
{
  MTRActionsClusterActionStruct *v2;
  MTRActionsClusterActionStruct *v3;
  NSNumber *actionID;
  NSString *name;
  NSNumber *type;
  NSNumber *endpointListID;
  NSNumber *supportedCommands;
  NSNumber *state;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRActionsClusterActionStruct;
  v2 = -[MTRActionsClusterActionStruct init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    actionID = v2->_actionID;
    v2->_actionID = (NSNumber *)&unk_250591B18;

    name = v3->_name;
    v3->_name = (NSString *)&stru_2505249E8;

    type = v3->_type;
    v3->_type = (NSNumber *)&unk_250591B18;

    endpointListID = v3->_endpointListID;
    v3->_endpointListID = (NSNumber *)&unk_250591B18;

    supportedCommands = v3->_supportedCommands;
    v3->_supportedCommands = (NSNumber *)&unk_250591B18;

    state = v3->_state;
    v3->_state = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRActionsClusterActionStruct *v4;
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
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;

  v4 = objc_alloc_init(MTRActionsClusterActionStruct);
  objc_msgSend_actionID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActionID_(v4, v8, (uint64_t)v7);

  objc_msgSend_name(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

  objc_msgSend_type(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setType_(v4, v16, (uint64_t)v15);

  objc_msgSend_endpointListID(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndpointListID_(v4, v20, (uint64_t)v19);

  objc_msgSend_supportedCommands(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSupportedCommands_(v4, v24, (uint64_t)v23);

  objc_msgSend_state(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setState_(v4, v28, (uint64_t)v27);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: actionID:%@; name:%@; type:%@; endpointListID:%@; supportedCommands:%@; state:%@; >"),
    v5,
    self->_actionID,
    self->_name,
    self->_type,
    self->_endpointListID,
    self->_supportedCommands,
    self->_state);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)actionID
{
  return self->_actionID;
}

- (void)setActionID:(NSNumber *)actionID
{
  objc_setProperty_nonatomic_copy(self, a2, actionID, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 16);
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(NSNumber *)type
{
  objc_setProperty_nonatomic_copy(self, a2, type, 24);
}

- (NSNumber)endpointListID
{
  return self->_endpointListID;
}

- (void)setEndpointListID:(NSNumber *)endpointListID
{
  objc_setProperty_nonatomic_copy(self, a2, endpointListID, 32);
}

- (NSNumber)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(NSNumber *)supportedCommands
{
  objc_setProperty_nonatomic_copy(self, a2, supportedCommands, 40);
}

- (NSNumber)state
{
  return self->_state;
}

- (void)setState:(NSNumber *)state
{
  objc_setProperty_nonatomic_copy(self, a2, state, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_endpointListID, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_actionID, 0);
}

@end
