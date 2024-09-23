@implementation COInterestTracker

- (void)_checkTriggerReset
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  if (-[COInterestTracker triggerReset](self, "triggerReset"))
  {
    -[COInterestTracker setTriggerReset:](self, "setTriggerReset:", 0);
    -[COInterestTracker delegate](self, "delegate");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
    {
      v6 = (void *)v3;
      v5 = objc_opt_respondsToSelector();
      v4 = v6;
      if ((v5 & 1) != 0)
      {
        objc_msgSend(v6, "interestTrackerTriggerReset:", self);
        v4 = v6;
      }
    }

  }
}

- (unint64_t)_nextInterestSerial
{
  unint64_t v3;

  v3 = -[COInterestTracker interestsSerial](self, "interestsSerial") + 1;
  -[COInterestTracker setInterestsSerial:](self, "setInterestsSerial:", v3);
  return v3;
}

- (void)_setInterest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15[2];
  id location;

  v4 = a3;
  v5 = -[COInterestTracker _nextInterestSerial](self, "_nextInterestSerial");
  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __34__COInterestTracker__setInterest___block_invoke;
  v13 = &unk_24D4B2FA0;
  objc_copyWeak(v15, &location);
  v15[1] = v5;
  v6 = v4;
  v14 = v6;
  v7 = (void *)MEMORY[0x2199F3D40](&v10);
  -[COInterestTracker delegate](self, "delegate", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[COInterestTracker secondary](self, "secondary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "interestTracker:setInterests:forMember:callback:", self, v6, v9, v7);

  }
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

}

void __34__COInterestTracker__setInterest___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v6 = objc_msgSend(WeakRetained, "interestsSerial");
    v5 = v8;
    if (v6 == *(_QWORD *)(a1 + 48))
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      v5 = v8;
      if (v7)
      {
        if (a2)
        {
          objc_msgSend(v8, "setTriggerReset:", 0);
        }
        else
        {
          objc_msgSend(v8, "setRemoteInterests:", *(_QWORD *)(a1 + 48));
          objc_msgSend(v8, "_checkTriggerReset");
        }
        v5 = v8;
      }
    }
  }

}

- (void)setInterests:(id)a3
{
  void *v4;
  char v5;
  NSSet *v6;
  NSSet *interests;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[COInterestTracker interests](self, "interests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToSet:", v10);

  if ((v5 & 1) == 0)
  {
    v6 = (NSSet *)objc_msgSend(v10, "copy");
    interests = self->_interests;
    self->_interests = v6;

    if (!-[COInterestTracker primaryAvailable](self, "primaryAvailable"))
    {
      -[COInterestTracker secondary](self, "secondary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[COInterestTracker interests](self, "interests");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[COInterestTracker _setInterest:](self, "_setInterest:", v9);

      }
    }
  }

}

- (void)setPrimaryAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_primaryAvailable != a3)
  {
    v3 = a3;
    self->_primaryAvailable = a3;
    -[COInterestTracker secondary](self, "secondary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (v3)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[COInterestTracker _setInterest:](self, "_setInterest:", v6);

        -[COInterestTracker _checkTriggerReset](self, "_checkTriggerReset");
      }
      else
      {
        -[COInterestTracker setTriggerReset:](self, "setTriggerReset:", 1);
        -[COInterestTracker interests](self, "interests");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        -[COInterestTracker _setInterest:](self, "_setInterest:", v7);

      }
    }
  }
}

- (void)setSecondary:(id)a3
{
  unint64_t v5;
  COClusterMember *secondary;
  char v7;
  BOOL v8;
  void *v9;
  unint64_t v10;

  v5 = (unint64_t)a3;
  secondary = self->_secondary;
  v10 = v5;
  if (v5 && secondary)
  {
    v7 = -[COClusterMember isEqual:](secondary, "isEqual:", secondary);
    v5 = v10;
    if ((v7 & 1) != 0)
      goto LABEL_11;
  }
  else if (!(v5 | (unint64_t)secondary))
  {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_secondary, a3);
  v8 = -[COInterestTracker primaryAvailable](self, "primaryAvailable");
  v5 = v10;
  if (!v8)
  {
    if (v10)
    {
      -[COInterestTracker interests](self, "interests");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[COInterestTracker _setInterest:](self, "_setInterest:", v9);

    }
    else
    {
      -[COInterestTracker _nextInterestSerial](self, "_nextInterestSerial");
      -[COInterestTracker setTriggerReset:](self, "setTriggerReset:", 0);
    }
    v5 = v10;
  }
LABEL_11:

}

- (COInterestTracker)initWithAccessory:(id)a3 delegate:(id)a4 primaryAvailable:(BOOL)a5 secondary:(id)a6
{
  id v11;
  id v12;
  id v13;
  COInterestTracker *v14;
  COInterestTracker *v15;
  NSSet *v16;
  NSSet *interests;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)COInterestTracker;
  v14 = -[COInterestTracker init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accessory, a3);
    objc_storeWeak((id *)&v15->_delegate, v12);
    v15->_primaryAvailable = a5;
    objc_storeStrong((id *)&v15->_secondary, a6);
    v16 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    interests = v15->_interests;
    v15->_interests = v16;

    *(_OWORD *)&v15->_remoteInterests = xmmword_215F52F70;
  }

  return v15;
}

- (BOOL)canDispatchWithPrimary:(BOOL)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  unint64_t v8;

  if (-[COInterestTracker primaryAvailable](self, "primaryAvailable"))
  {
    if (!a3)
    {
      -[COInterestTracker secondary](self, "secondary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

      return v6;
    }
    return 1;
  }
  -[COInterestTracker secondary](self, "secondary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  v8 = -[COInterestTracker interestsSerial](self, "interestsSerial");
  if (v8 == -[COInterestTracker remoteInterests](self, "remoteInterests"))
    return 1;
  return -[COInterestTracker triggerReset](self, "triggerReset");
}

- (COHomeKitAccessoryMemento)accessory
{
  return self->_accessory;
}

- (NSSet)interests
{
  return self->_interests;
}

- (BOOL)primaryAvailable
{
  return self->_primaryAvailable;
}

- (COClusterMember)secondary
{
  return self->_secondary;
}

- (COInterestTrackerDelegate)delegate
{
  return (COInterestTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)triggerReset
{
  return self->_triggerReset;
}

- (void)setTriggerReset:(BOOL)a3
{
  self->_triggerReset = a3;
}

- (unint64_t)remoteInterests
{
  return self->_remoteInterests;
}

- (void)setRemoteInterests:(unint64_t)a3
{
  self->_remoteInterests = a3;
}

- (unint64_t)interestsSerial
{
  return self->_interestsSerial;
}

- (void)setInterestsSerial:(unint64_t)a3
{
  self->_interestsSerial = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondary, 0);
  objc_storeStrong((id *)&self->_interests, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
