@implementation CMContinuityCaptureState

- (CMContinuityCaptureState)initWithAttributes:(id)a3 entryAction:(id)a4 exitAction:(id)a5
{
  id v8;
  id v9;
  id v10;
  CMContinuityCaptureState *v11;
  CMContinuityCaptureState *v12;
  id v13;
  CMContinuityCaptureState *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CMContinuityCaptureState;
  v11 = -[CMContinuityCaptureState init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[CMContinuityCaptureState setName:](v11, "setName:", v8);
    -[CMContinuityCaptureState setEntryAction:](v12, "setEntryAction:", v9);
    -[CMContinuityCaptureState setExitAction:](v12, "setExitAction:", v10);
    v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[CMContinuityCaptureState setPendingEvents:](v12, "setPendingEvents:", v13);

    -[CMContinuityCaptureState pendingEvents](v12, "pendingEvents");
    v14 = (CMContinuityCaptureState *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v14 = v12;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), self->_name);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSMutableSet)pendingEvents
{
  return self->_pendingEvents;
}

- (void)setPendingEvents:(id)a3
{
  objc_storeStrong((id *)&self->_pendingEvents, a3);
}

- (id)entryAction
{
  return self->_entryAction;
}

- (void)setEntryAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)exitAction
{
  return self->_exitAction;
}

- (void)setExitAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_exitAction, 0);
  objc_storeStrong(&self->_entryAction, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
