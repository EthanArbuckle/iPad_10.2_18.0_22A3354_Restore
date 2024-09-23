@implementation CLSCurationDebugStateEntry

- (CLSCurationDebugStateEntry)initWithState:(unint64_t)a3 reason:(id)a4 agent:(id)a5 stage:(id)a6
{
  id v11;
  id v12;
  id v13;
  CLSCurationDebugStateEntry *v14;
  CLSCurationDebugStateEntry *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CLSCurationDebugStateEntry;
  v14 = -[CLSCurationDebugStateEntry init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_state = a3;
    objc_storeStrong((id *)&v14->_reason, a4);
    objc_storeStrong((id *)&v15->_agent, a5);
    objc_storeStrong((id *)&v15->_stage, a6);
  }

  return v15;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)agent
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)stage
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stage, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
