@implementation MPCPlayerCommandRequest

- (MPCPlayerCommandRequest)initWithMediaRemoteCommand:(unsigned int)a3 options:(id)a4 controller:(id)a5 label:(id)a6
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  MPCPlayerCommandRequest *v15;

  v9 = *(_QWORD *)&a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  objc_msgSend(v11, "resolvedPlayerPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:playerPath:label:](self, "initWithMediaRemoteCommand:options:playerPath:label:", v9, v13, v14, v12);

  if (v15)
    objc_storeStrong((id *)&v15->_controller, a5);

  return v15;
}

- (MPCPlayerCommandRequest)initWithMediaRemoteCommand:(unsigned int)a3 options:(id)a4 playerPath:(id)a5 label:(id)a6
{
  id v10;
  id v11;
  id v12;
  MPCPlayerCommandRequest *v13;
  MPCPlayerCommandRequest *v14;
  uint64_t v15;
  NSDictionary *options;
  uint64_t v17;
  MPCPlayerPath *playerPath;
  uint64_t v19;
  NSString *label;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MPCPlayerCommandRequest;
  v13 = -[MPCPlayerCommandRequest init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_command = a3;
    v15 = objc_msgSend(v10, "copy");
    options = v14->_options;
    v14->_options = (NSDictionary *)v15;

    v17 = objc_msgSend(v11, "copy");
    playerPath = v14->_playerPath;
    v14->_playerPath = (MPCPlayerPath *)v17;

    v19 = objc_msgSend(v12, "copy");
    label = v14->_label;
    v14->_label = (NSString *)v19;

    objc_storeStrong((id *)&v14->_originalLabel, v14->_label);
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusTransformer, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_userInitiatedOptions, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_originalLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setCommandOptionValue:(id)a3 forKey:(id)a4
{
  NSDictionary *options;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSDictionary *v12;
  NSDictionary *v13;
  id v14;

  options = self->_options;
  v7 = a4;
  v8 = a3;
  v9 = (void *)-[NSDictionary mutableCopy](options, "mutableCopy");
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v11;

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, v7);
  v12 = (NSDictionary *)objc_msgSend(v14, "copy");
  v13 = self->_options;
  self->_options = v12;

}

- (void)setLabel:(id)a3
{
  NSString *v4;
  NSString *v5;
  int v6;
  NSString *v7;
  NSString *label;
  NSString *v9;

  v9 = (NSString *)a3;
  if (!v9)
    v9 = self->_originalLabel;
  v4 = self->_label;
  if (v9 == v4)
  {

  }
  else
  {
    v5 = v9;
    v6 = -[NSString isEqual:](v5, "isEqual:", v4);

    if (!v6)
      goto LABEL_8;
  }
  v7 = (NSString *)-[NSString copy](v9, "copy");
  label = self->_label;
  self->_label = v7;

LABEL_8:
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = (void *)MRMediaRemoteCopyCommandDescription();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p command=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)originalLabel
{
  return self->_originalLabel;
}

- (unsigned)command
{
  return self->_command;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSDictionary)userInitiatedOptions
{
  return self->_userInitiatedOptions;
}

- (void)setUserInitiatedOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MPCMediaRemoteController)controller
{
  return self->_controller;
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (id)statusTransformer
{
  return self->_statusTransformer;
}

- (void)setStatusTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

@end
