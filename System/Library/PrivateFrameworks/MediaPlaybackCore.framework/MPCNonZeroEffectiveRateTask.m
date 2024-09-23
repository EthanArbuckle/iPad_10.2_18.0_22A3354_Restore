@implementation MPCNonZeroEffectiveRateTask

- (MPCNonZeroEffectiveRateTask)initWithPlayerItem:(id)a3 identifier:(id)a4 timeout:(double)a5 queue:(id)a6 block:(id)a7
{
  id v12;
  MPCNonZeroEffectiveRateTask *v13;
  MPCNonZeroEffectiveRateTask *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  MPCNonZeroEffectiveRateTask *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPCNonZeroEffectiveRateTask;
  v13 = -[MPCDeferrableTask initWithIdentifier:timeout:queue:block:](&v20, sel_initWithIdentifier_timeout_queue_block_, a4, a6, a7, a5);
  v14 = v13;
  if (v13)
  {
    -[MPCNonZeroEffectiveRateTask setPlayerItem:](v13, "setPlayerItem:", v12);
    if (CMTimebaseGetEffectiveRate((CMTimebaseRef)objc_msgSend(v12, "timebase")) <= 0.00000011920929)
    {
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v14;
        _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Started waiting for a EffectiveRateChanged notification", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:object:", v14, sel_effectiveRateDidChange_, *MEMORY[0x24BDC0DA0], 0);

    }
    else
    {
      -[MPCDeferrableTask guard](v14, "guard");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "disarm");

      if (v16)
        -[MPCDeferrableTask execute:](v14, "execute:", 0);
    }
  }

  return v14;
}

- (void)effectiveRateDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  Float64 EffectiveRate;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  -[MPCNonZeroEffectiveRateTask playerItem](self, "playerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "timebase");

  objc_msgSend(v4, "object");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v11;
  if (v11 == v6
    && (EffectiveRate = CMTimebaseGetEffectiveRate((CMTimebaseRef)v6), v7 = v11, EffectiveRate > 0.00000011920929))
  {
    -[MPCDeferrableTask guard](self, "guard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "disarm");

    if (v10)
      -[MPCDeferrableTask execute:](self, "execute:", 0);
  }
  else
  {

  }
}

- (void)taskDidExecute
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPCNonZeroEffectiveRateTask;
  -[MPCDeferrableTask taskDidExecute](&v4, sel_taskDidExecute);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDC0DA0], 0);

}

- (AVPlayerItem)playerItem
{
  return (AVPlayerItem *)objc_loadWeakRetained((id *)&self->_playerItem);
}

- (void)setPlayerItem:(id)a3
{
  objc_storeWeak((id *)&self->_playerItem, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playerItem);
}

@end
