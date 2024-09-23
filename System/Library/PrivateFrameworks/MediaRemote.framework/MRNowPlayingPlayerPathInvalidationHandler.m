@implementation MRNowPlayingPlayerPathInvalidationHandler

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (MRNowPlayingPlayerPathInvalidationHandler)initWithPlayerPath:(id)a3 invalidateImmediatlyIfInvalid:(BOOL)a4 queue:(id)a5 invalidationCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  MRNowPlayingPlayerPathInvalidationHandler *v13;
  MRPlayerPath *v14;
  MRPlayerPath *playerPath;
  id v16;
  uint64_t v17;
  id callback;
  objc_super v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MRNowPlayingPlayerPathInvalidationHandler;
  v13 = -[MRNowPlayingPlayerPathInvalidationHandler init](&v20, sel_init);
  if (v13)
  {
    if (v10)
      v14 = (MRPlayerPath *)objc_msgSend(v10, "copy");
    else
      v14 = objc_alloc_init(MRPlayerPath);
    playerPath = v13->_playerPath;
    v13->_playerPath = v14;

    if (!v11)
    {
      v11 = (id)MEMORY[0x1E0C80D38];
      v16 = MEMORY[0x1E0C80D38];
    }
    v13->_invalidateImmediatlyIfInvalid = a4;
    objc_storeStrong((id *)&v13->_queue, v11);
    v17 = objc_msgSend(v12, "copy");
    callback = v13->_callback;
    v13->_callback = (id)v17;

  }
  return v13;
}

- (id)description
{
  return -[MRPlayerPath description](self->_playerPath, "description");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)callback
{
  return self->_callback;
}

- (BOOL)invalidateImmediatlyIfInvalid
{
  return self->_invalidateImmediatlyIfInvalid;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
}

@end
