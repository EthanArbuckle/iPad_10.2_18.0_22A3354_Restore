@implementation _MPCPlayerSeekCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredForwardJumpIntervals, 0);
  objc_storeStrong((id *)&self->_preferredBackwardJumpIntervals, 0);
}

- (unint64_t)seekSupport
{
  return self->_seekSupport;
}

- (_MPCPlayerSeekCommand)initWithResponse:(id)a3 seekSupport:(unint64_t)a4
{
  _MPCPlayerSeekCommand *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MPCPlayerSeekCommand;
  result = -[_MPCPlayerCommand initWithResponse:](&v6, sel_initWithResponse_, a3);
  if (result)
    result->_seekSupport = a4;
  return result;
}

- (NSArray)preferredBackwardJumpIntervals
{
  return self->_preferredBackwardJumpIntervals;
}

- (void)setPreferredBackwardJumpIntervals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)preferredForwardJumpIntervals
{
  return self->_preferredForwardJumpIntervals;
}

- (id)beginSeekWithDirection:(int64_t)a3
{
  uint64_t v3;

  if (a3 == -1)
  {
    if ((self->_seekSupport & 8) != 0)
    {
      v3 = 10;
      goto LABEL_8;
    }
    return 0;
  }
  if (a3 != 1 || (self->_seekSupport & 2) == 0)
    return 0;
  v3 = 8;
LABEL_8:
  -[_MPCPlayerSeekCommand _seekCommandWithMediaRemoteCommand:options:](self, "_seekCommandWithMediaRemoteCommand:options:", v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)endSeek
{
  unint64_t seekSupport;
  uint64_t v4;

  seekSupport = self->_seekSupport;
  if ((seekSupport & 4) != 0)
  {
    v4 = 9;
  }
  else
  {
    if ((seekSupport & 0x10) == 0)
      return 0;
    v4 = 11;
  }
  -[_MPCPlayerSeekCommand _seekCommandWithMediaRemoteCommand:options:](self, "_seekCommandWithMediaRemoteCommand:options:", v4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_seekCommandWithMediaRemoteCommand:(unsigned int)a3 options:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  MPCPlayerCommandRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  MPCPlayerCommandRequest *v15;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[_MPCPlayerItemCommand contentItemID](self, "contentItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[_MPCPlayerItemCommand contentItemID](self, "contentItemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE65928]);

  }
  -[_MPCPlayerCommand response](self, "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [MPCPlayerCommandRequest alloc];
  objc_msgSend(v10, "controller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v11, "initWithMediaRemoteCommand:options:controller:label:", v4, v6, v12, v14);

  return v15;
}

- (id)jumpByInterval:(double)a3
{
  double v3;
  void *v5;
  void *v6;
  _MPCPlayerSeekCommand *v7;
  uint64_t v8;
  void *v10;
  void *v11;

  v3 = a3;
  if (a3 <= 0.0)
  {
    if (a3 < 0.0 && (self->_seekSupport & 0x40) != 0)
    {
      if (!-[_MPCPlayerSeekCommand prefersNegativeBackwardSkipIntervals](self, "prefersNegativeBackwardSkipIntervals"))
        v3 = -v3;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE659C0]);

      v7 = self;
      v8 = 18;
      goto LABEL_10;
    }
    return 0;
  }
  if ((self->_seekSupport & 0x20) == 0)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE659C0]);

  v7 = self;
  v8 = 17;
LABEL_10:
  -[_MPCPlayerSeekCommand _seekCommandWithMediaRemoteCommand:options:](v7, "_seekCommandWithMediaRemoteCommand:options:", v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setPrefersNegativeBackwardSkipIntervals:(BOOL)a3
{
  self->_prefersNegativeBackwardSkipIntervals = a3;
}

- (void)setPreferredForwardJumpIntervals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)changePositionToElapsedInterval:(double)a3
{
  void *v3;
  void *v6;
  void *v7;

  if ((self->_seekSupport & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE65940]);

    -[_MPCPlayerSeekCommand _seekCommandWithMediaRemoteCommand:options:](self, "_seekCommandWithMediaRemoteCommand:options:", 24, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)changePositionToElapsedInterval:(double)a3 referenceInterval:(double)a4
{
  void *v4;
  void *v8;
  void *v9;
  void *v10;

  if ((self->_seekSupport & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE65940]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE65988]);

    -[_MPCPlayerSeekCommand _seekCommandWithMediaRemoteCommand:options:](self, "_seekCommandWithMediaRemoteCommand:options:", 24, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)prefersNegativeBackwardSkipIntervals
{
  return self->_prefersNegativeBackwardSkipIntervals;
}

@end
