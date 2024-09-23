@implementation JFXCompositionPlayerRequest

- (JFXCompositionPlayerRequest)initWithBlock:(id)a3 ofType:(unint64_t)a4
{
  id v6;
  JFXCompositionPlayerRequest *v7;
  void *v8;
  uint64_t v9;
  NSString *uniqueID;
  uint64_t v11;
  id block;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)JFXCompositionPlayerRequest;
  v7 = -[JFXCompositionPlayerRequest init](&v14, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    uniqueID = v7->_uniqueID;
    v7->_uniqueID = (NSString *)v9;

    v7->_type = a4;
    v11 = MEMORY[0x2276A1F6C](v6);
    block = v7->_block;
    v7->_block = (id)v11;

  }
  return v7;
}

+ (id)stringFromRequestType:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return 0;
  else
    return off_24EE5B050[a3 - 1];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)JFXCompositionPlayerRequest;
  -[JFXCompositionPlayerRequest description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXCompositionPlayerRequest uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringFromRequestType:", -[JFXCompositionPlayerRequest type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXCompositionPlayerRequest player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ id %@ type %@ player %@>"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)didEnqueue
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  int v6;
  JFXCompositionPlayerRequest *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  JFXPlaybackEventSignpostPointCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[JFXCompositionPlayerRequest signPostID](self, "signPostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      v6 = 138412290;
      v7 = self;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v3, OS_SIGNPOST_EVENT, v5, "PlayerRequest", "enqueue %@", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (void)didBegin
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  int v6;
  JFXCompositionPlayerRequest *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  JFXPlaybackIntervalSignpostCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[JFXCompositionPlayerRequest signPostID](self, "signPostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      v6 = 138543362;
      v7 = self;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PlayerRequest", "Request %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (void)didComplete
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  JFXPlaybackIntervalSignpostCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[JFXCompositionPlayerRequest signPostID](self, "signPostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v3, OS_SIGNPOST_INTERVAL_END, v5, "PlayerRequest", "succeeded", v6, 2u);
    }
  }

}

- (void)didCancel
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  JFXPlaybackIntervalSignpostCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[JFXCompositionPlayerRequest signPostID](self, "signPostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v3, OS_SIGNPOST_INTERVAL_END, v5, "PlayerRequest", "cancelled", v6, 2u);
    }
  }

}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)queuedTime
{
  return self->_queuedTime;
}

- (void)setQueuedTime:(double)a3
{
  self->_queuedTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (JFXCompositionPlayer)player
{
  return (JFXCompositionPlayer *)objc_loadWeakRetained((id *)&self->_player);
}

- (void)setPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_player, a3);
}

- (unint64_t)signPostID
{
  return self->_signPostID;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_player);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
