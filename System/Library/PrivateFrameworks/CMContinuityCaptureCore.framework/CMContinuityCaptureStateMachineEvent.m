@implementation CMContinuityCaptureStateMachineEvent

- (CMContinuityCaptureStateMachineEvent)initWithName:(id)a3 isEntry:(BOOL)a4 eventAction:(id)a5
{
  id v9;
  id v10;
  CMContinuityCaptureStateMachineEvent *v11;
  CMContinuityCaptureStateMachineEvent *v12;
  uint64_t v13;
  id action;
  CMContinuityCaptureStateMachineEvent *v15;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CMContinuityCaptureStateMachineEvent;
  v11 = -[CMContinuityCaptureStateMachineEvent init](&v17, sel_init);
  v12 = v11;
  if (v11 && (objc_storeStrong((id *)&v11->_name, a3), v12->_name))
  {
    v12->_isEntry = a4;
    v13 = MEMORY[0x22E2A7CB0](v10);
    action = v12->_action;
    v12->_action = (id)v13;

    v15 = v12;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), self->_name);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isEntry
{
  return self->_isEntry;
}

- (id)action
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)data
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
