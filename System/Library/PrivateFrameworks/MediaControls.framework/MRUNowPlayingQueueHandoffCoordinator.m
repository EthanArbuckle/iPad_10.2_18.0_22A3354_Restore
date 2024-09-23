@implementation MRUNowPlayingQueueHandoffCoordinator

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  NSStringFromCGSize(self->_artworkSize);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingQueueHandoffCoordinator stateDescription:](self, "stateDescription:", self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ state: %@ | artwork size: %@ | response: %@"), objc_opt_class(), v4, v3, self->_response);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setResponse:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_response, a3);
  if (self->_state != 4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "queueHandoffCoordinator:didChangeResponse:", self, v6);

  }
}

- (void)setState:(int64_t)a3
{
  NSObject *v5;
  id WeakRetained;
  int v7;
  MRUNowPlayingQueueHandoffCoordinator *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    self->_state = a3;
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "queueHandoffCoordinator:didChangeState:", self, a3);

  }
}

- (void)setupTransition
{
  -[MRUNowPlayingQueueHandoffCoordinator setState:](self, "setState:", 1);
}

- (void)beginTransition
{
  -[MRUNowPlayingQueueHandoffCoordinator setState:](self, "setState:", 2);
}

- (void)endTransition
{
  -[MRUNowPlayingQueueHandoffCoordinator setState:](self, "setState:", 3);
}

- (void)completeHandoff
{
  -[MRUNowPlayingQueueHandoffCoordinator setState:](self, "setState:", 4);
}

- (id)stateDescription:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("Prepare");
  else
    return off_1E5819D78[a3 - 1];
}

- (int64_t)state
{
  return self->_state;
}

- (MRNowPlayingPlayerResponse)response
{
  return self->_response;
}

- (BOOL)hideArtwork
{
  return self->_hideArtwork;
}

- (void)setHideArtwork:(BOOL)a3
{
  self->_hideArtwork = a3;
}

- (CGSize)artworkSize
{
  double width;
  double height;
  CGSize result;

  width = self->_artworkSize.width;
  height = self->_artworkSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setArtworkSize:(CGSize)a3
{
  self->_artworkSize = a3;
}

- (MRUNowPlayingQueueHandoffCoordinatorDelegate)delegate
{
  return (MRUNowPlayingQueueHandoffCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
