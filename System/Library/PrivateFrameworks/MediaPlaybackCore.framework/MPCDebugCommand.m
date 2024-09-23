@implementation MPCDebugCommand

- (void)setSupportedSubsystems:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *supportedSubsystems;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_supportedSubsystems;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      supportedSubsystems = self->_supportedSubsystems;
      self->_supportedSubsystems = v6;

      -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
    }
  }

}

- (void)setSubsystemRevisions:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *subsystemRevisions;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_subsystemRevisions;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      subsystemRevisions = self->_subsystemRevisions;
      self->_subsystemRevisions = v6;

      -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
    }
  }

}

void __49__MPCDebugCommand__mediaRemoteCommandInfoOptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = *MEMORY[0x24BE65638];
  v10[0] = a3;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

}

- (MPCDebugCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  MPCDebugCommand *v3;
  MPCDebugCommand *v4;
  NSArray *supportedSubsystems;
  NSDictionary *subsystemRevisions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPCDebugCommand;
  v3 = -[MPRemoteCommand initWithMediaRemoteCommandType:](&v8, sel_initWithMediaRemoteCommandType_, *(_QWORD *)&a3);
  v4 = v3;
  if (v3)
  {
    supportedSubsystems = v3->_supportedSubsystems;
    v3->_supportedSubsystems = (NSArray *)MEMORY[0x24BDBD1A8];

    subsystemRevisions = v4->_subsystemRevisions;
    v4->_subsystemRevisions = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v4;
}

- (id)_mediaRemoteCommandInfoOptions
{
  void *v3;
  NSDictionary *subsystemRevisions;
  id v5;
  NSArray *supportedSubsystems;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSDictionary count](self->_subsystemRevisions, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  subsystemRevisions = self->_subsystemRevisions;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __49__MPCDebugCommand__mediaRemoteCommandInfoOptions__block_invoke;
  v14 = &unk_24CAB80F8;
  v15 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](subsystemRevisions, "enumerateKeysAndObjectsUsingBlock:", &v11);
  supportedSubsystems = self->_supportedSubsystems;
  if (!supportedSubsystems)
    supportedSubsystems = (NSArray *)MEMORY[0x24BDBD1A8];
  v7 = *MEMORY[0x24BE656C0];
  v16[0] = *MEMORY[0x24BE656C8];
  v16[1] = v7;
  v8 = (id)MEMORY[0x24BDBD1B8];
  if (v5)
    v8 = v5;
  v17[0] = supportedSubsystems;
  v17[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)supportedSubsystems
{
  return self->_supportedSubsystems;
}

- (NSDictionary)subsystemRevisions
{
  return self->_subsystemRevisions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsystemRevisions, 0);
  objc_storeStrong((id *)&self->_supportedSubsystems, 0);
}

@end
