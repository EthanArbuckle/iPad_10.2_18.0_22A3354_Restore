@implementation MRNowPlayingClientCommandQueueEntry

- (id)description
{
  void *v3;
  void *v4;

  v3 = MRMediaRemoteCopyCommandDescription(self->_command);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p, command = %@, playerPath=%@, options = %@\n>"), objc_opt_class(), self, v3, self->_playerPath, self->_options);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unsigned)command
{
  return self->_command;
}

- (void)setCommand:(unsigned int)a3
{
  self->_command = a3;
}

- (NSMutableDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  objc_storeStrong((id *)&self->_dateCreated, a3);
}

- (id)commandCompletion
{
  return self->_commandCompletion;
}

- (void)setCommandCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_commandCompletion, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
