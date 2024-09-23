@implementation _MPCPlayerCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (_MPCPlayerCommand)initWithResponse:(id)a3
{
  id v5;
  void *v6;
  _MPCPlayerCommand *v7;

  v5 = a3;
  objc_msgSend(v5, "playerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_MPCPlayerCommand initWithPlayerPath:](self, "initWithPlayerPath:", v6);

  if (v7)
    objc_storeStrong((id *)&v7->_response, a3);

  return v7;
}

- (_MPCPlayerCommand)initWithPlayerPath:(id)a3
{
  id v4;
  _MPCPlayerCommand *v5;
  uint64_t v6;
  MPCPlayerPath *playerPath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MPCPlayerCommand;
  v5 = -[_MPCPlayerCommand init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    playerPath = v5->_playerPath;
    v5->_playerPath = (MPCPlayerPath *)v6;

  }
  return v5;
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

@end
