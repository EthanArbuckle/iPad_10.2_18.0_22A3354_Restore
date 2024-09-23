@implementation CAMTimelapseBackendSessionContext

- (CAMTimelapseBackendSessionContext)initWithTimelapseUUID:(id)a3
{
  id v5;
  CAMTimelapseBackendSessionContext *v6;
  CAMTimelapseBackendSessionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMTimelapseBackendSessionContext;
  v6 = -[CAMTimelapseBackendSessionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_timelapseUUID, a3);

  return v7;
}

- (CAMTimelapseBackendSessionContext)init
{
  -[CAMTimelapseBackendSessionContext doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CAMTimelapseBackendSessionContext;
  -[CAMTimelapseBackendSessionContext description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: timelapseUUID=%@"), v4, self->_timelapseUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)timelapseUUID
{
  return self->_timelapseUUID;
}

- (CAMTimelapseState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSArray)filesToDelete
{
  return self->_filesToDelete;
}

- (void)setFilesToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_filesToDelete, a3);
}

- (NSArray)filesToWrite
{
  return self->_filesToWrite;
}

- (void)setFilesToWrite:(id)a3
{
  objc_storeStrong((id *)&self->_filesToWrite, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesToWrite, 0);
  objc_storeStrong((id *)&self->_filesToDelete, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_timelapseUUID, 0);
}

@end
