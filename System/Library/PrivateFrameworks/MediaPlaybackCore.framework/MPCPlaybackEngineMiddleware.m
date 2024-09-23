@implementation MPCPlaybackEngineMiddleware

- (void)setInvalidationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationObservers, a3);
}

- (id)playerVideoView:(id)a3 chain:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "nextObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerVideoView:chain:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)videoOutput:(id)a3 chain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  -[MPCPlaybackEngineMiddleware playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v6;
  if (v8)
  {
    -[MPCPlaybackEngineMiddleware playbackEngine](self, "playbackEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "type");

    v9 = v6;
    if (v13 == 2)
    {
      -[MPCPlaybackEngineMiddleware playbackEngine](self, "playbackEngine");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "videoOutput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v7, "nextObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "videoOutput:chain:", v9, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (MPCPlaybackEngine)playbackEngine
{
  return self->_playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeStrong((id *)&self->_playbackEngine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackEngine, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (id)operationsForRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPCPlaybackEngineMiddleware operationsForPlayerRequest:](self, "operationsForPlayerRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (id)operationsForPlayerRequest:(id)a3
{
  id v4;
  MPCPlaybackEngineMiddlewareOperation *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[MPCPlaybackEngineMiddlewareOperation initWithMiddleware:playerRequest:]([MPCPlaybackEngineMiddlewareOperation alloc], "initWithMiddleware:playerRequest:", self, v4);

  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stateDumpObject
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("playbackEngine");
  -[MPCPlaybackEngineMiddleware playbackEngine](self, "playbackEngine");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("<NULL>");
  v13[1] = v6;
  v12[2] = CFSTR("invalidationObservers");
  -[MPCPlaybackEngineMiddleware invalidationObservers](self, "invalidationObservers");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("<NULL>");
  v13[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

@end
