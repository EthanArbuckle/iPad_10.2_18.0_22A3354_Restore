@implementation ManagedStreamGroup

- (ManagedStreamGroup)init
{
  ManagedStreamGroup *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *outputStreams;
  NSMutableDictionary *v5;
  NSMutableDictionary *inputStreams;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ManagedStreamGroup;
  v2 = -[ManagedStreamGroup init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    outputStreams = v2->_outputStreams;
    v2->_outputStreams = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    inputStreams = v2->_inputStreams;
    v2->_inputStreams = v5;

  }
  return v2;
}

- (NSUUID)controllingClientID
{
  return self->_controllingClientID;
}

- (void)setControllingClientID:(id)a3
{
  objc_storeStrong((id *)&self->_controllingClientID, a3);
}

- (NSMutableDictionary)outputStreams
{
  return self->_outputStreams;
}

- (void)setOutputStreams:(id)a3
{
  objc_storeStrong((id *)&self->_outputStreams, a3);
}

- (NSMutableDictionary)inputStreams
{
  return self->_inputStreams;
}

- (void)setInputStreams:(id)a3
{
  objc_storeStrong((id *)&self->_inputStreams, a3);
}

- (id)stateChangeBlock
{
  return self->_stateChangeBlock;
}

- (void)setStateChangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangeBlock, 0);
  objc_storeStrong((id *)&self->_inputStreams, 0);
  objc_storeStrong((id *)&self->_outputStreams, 0);
  objc_storeStrong((id *)&self->_controllingClientID, 0);
}

@end
