@implementation CKScheduledUpdater

- (void)dealloc
{
  objc_super v3;

  -[CKScheduledUpdater invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CKScheduledUpdater;
  -[CKScheduledUpdater dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)CKScheduledUpdater;
  -[CKManualUpdater description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKManualUpdater needsUpdate](self, "needsUpdate");
  v6 = -[CKScheduledUpdater isHoldingUpdates](self, "isHoldingUpdates");
  -[CKScheduledUpdater holdingUpdatesKeys](self, "holdingUpdatesKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ needsUpdate:%d isHoldingUpdates:%d holdingUpdatesKeys:%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CKScheduledUpdater)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  CKScheduledUpdater *v7;
  CKScheduledUpdater *v8;
  id v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKScheduledUpdater;
  v7 = -[CKScheduledUpdater init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CKManualUpdater setTarget:](v7, "setTarget:", v6);
    -[CKManualUpdater setAction:](v8, "setAction:", a4);
    v9 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    -[CKScheduledUpdater setHoldingUpdatesKeys:](v8, "setHoldingUpdatesKeys:", v9);

  }
  return v8;
}

- (void)setNeedsUpdate
{
  if (!-[CKManualUpdater needsUpdate](self, "needsUpdate"))
  {
    -[CKManualUpdater setNeedsUpdate:](self, "setNeedsUpdate:", 1);
    if (!-[CKScheduledUpdater isHoldingUpdates](self, "isHoldingUpdates"))
    {
      if (-[CKScheduledUpdater updateSynchronouslyIfPossible](self, "updateSynchronouslyIfPossible"))
        -[CKScheduledUpdater updateIfNeeded](self, "updateIfNeeded");
      else
        -[CKScheduledUpdater performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateIfNeeded, 0, 0.0);
    }
  }
}

- (void)beginHoldingUpdatesForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKScheduledUpdater holdingUpdatesKeys](self, "holdingUpdatesKeys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)endHoldingUpdatesForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CKScheduledUpdater holdingUpdatesKeys](self, "holdingUpdatesKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  if (!-[CKScheduledUpdater isHoldingUpdates](self, "isHoldingUpdates"))
  {
    if (-[CKManualUpdater needsUpdate](self, "needsUpdate"))
      -[CKScheduledUpdater performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateIfNeeded, 0, 0.0);
  }
}

- (BOOL)isHoldingUpdates
{
  void *v2;
  BOOL v3;

  -[CKScheduledUpdater holdingUpdatesKeys](self, "holdingUpdatesKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isHoldingUpdatesForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  if (!a3)
    return 0;
  v4 = a3;
  -[CKScheduledUpdater holdingUpdatesKeys](self, "holdingUpdatesKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countForObject:", v4);

  v7 = v6 != 0;
  return v7;
}

- (void)updateIfNeeded
{
  objc_super v3;

  if (!-[CKScheduledUpdater isHoldingUpdates](self, "isHoldingUpdates"))
  {
    v3.receiver = self;
    v3.super_class = (Class)CKScheduledUpdater;
    -[CKManualUpdater updateIfNeeded](&v3, sel_updateIfNeeded);
  }
}

- (void)invalidate
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[CKManualUpdater setTarget:](self, "setTarget:", 0);
  -[CKManualUpdater setAction:](self, "setAction:", 0);
}

- (void)endHoldingAllUpdatesForKey:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKScheduledUpdater holdingUpdatesKeys](self, "holdingUpdatesKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countForObject:", v7);

  for (; v5; --v5)
  {
    -[CKScheduledUpdater holdingUpdatesKeys](self, "holdingUpdatesKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v7);

  }
  if (!-[CKScheduledUpdater isHoldingUpdates](self, "isHoldingUpdates")
    && -[CKManualUpdater needsUpdate](self, "needsUpdate"))
  {
    -[CKScheduledUpdater performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateIfNeeded, 0, 0.0);
  }

}

- (void)endHoldingAllUpdates
{
  void *v3;

  -[CKScheduledUpdater holdingUpdatesKeys](self, "holdingUpdatesKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  if (!-[CKScheduledUpdater isHoldingUpdates](self, "isHoldingUpdates"))
  {
    if (-[CKManualUpdater needsUpdate](self, "needsUpdate"))
      -[CKScheduledUpdater performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateIfNeeded, 0, 0.0);
  }
}

- (NSCountedSet)holdingUpdatesKeys
{
  return self->_holdingUpdatesKeys;
}

- (void)setHoldingUpdatesKeys:(id)a3
{
  objc_storeStrong((id *)&self->_holdingUpdatesKeys, a3);
}

- (BOOL)updateSynchronouslyIfPossible
{
  return self->_updateSynchronouslyIfPossible;
}

- (void)setUpdateSynchronouslyIfPossible:(BOOL)a3
{
  self->_updateSynchronouslyIfPossible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdingUpdatesKeys, 0);
}

@end
