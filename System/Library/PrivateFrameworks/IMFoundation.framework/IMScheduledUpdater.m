@implementation IMScheduledUpdater

- (IMScheduledUpdater)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  IMScheduledUpdater *v7;
  const char *v8;
  uint64_t v9;
  IMScheduledUpdater *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMScheduledUpdater;
  v7 = -[IMScheduledUpdater init](&v17, sel_init);
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setTarget_(v7, v8, (uint64_t)v6, v9);
    objc_msgSend_setAction_(v10, v11, (uint64_t)a4, v12);
    v13 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    objc_msgSend_setHoldingUpdatesKeys_(v10, v14, (uint64_t)v13, v15);

  }
  return v10;
}

- (void)setHoldingUpdatesKeys:(id)a3
{
  objc_storeStrong((id *)&self->_holdingUpdatesKeys, a3);
}

- (void)setNeedsUpdate
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;

  if ((objc_msgSend_needsUpdate(self, a2, v2, v3) & 1) == 0)
  {
    objc_msgSend_setNeedsUpdate_(self, v5, 1, v6);
    if ((objc_msgSend_isHoldingUpdates(self, v7, v8, v9) & 1) == 0)
    {
      objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E0DE7910], v10, (uint64_t)self, (uint64_t)sel_updateIfNeeded, 0);
      objc_msgSend_performSelector_withObject_afterDelay_(self, v11, (uint64_t)sel_updateIfNeeded, 0, 0.0);
    }
  }
}

- (void)updateIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  if ((objc_msgSend_isHoldingUpdates(self, a2, v2, v3) & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)IMScheduledUpdater;
    -[IMManualUpdater updateIfNeeded](&v5, sel_updateIfNeeded);
  }
}

- (BOOL)isHoldingUpdates
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  objc_msgSend_holdingUpdatesKeys(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v4, v5, v6, v7) != 0;

  return v8;
}

- (NSCountedSet)holdingUpdatesKeys
{
  return self->_holdingUpdatesKeys;
}

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E0DE7910], a2, (uint64_t)self, (uint64_t)sel_updateIfNeeded, 0);
  objc_msgSend_invalidate(self, v3, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)IMScheduledUpdater;
  -[IMScheduledUpdater dealloc](&v6, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IMScheduledUpdater;
  -[IMManualUpdater description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_holdingUpdatesKeys(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ holdingUpdatesKeys:%@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)beginHoldingUpdatesForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_holdingUpdatesKeys(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v10, v8, (uint64_t)v4, v9);

}

- (void)endHoldingUpdatesForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;

  v4 = a3;
  objc_msgSend_holdingUpdatesKeys(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v8, v9, (uint64_t)v4, v10);

  if ((objc_msgSend_isHoldingUpdates(self, v11, v12, v13) & 1) == 0)
  {
    if (objc_msgSend_needsUpdate(self, v14, v15, v16))
    {
      objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E0DE7910], v17, (uint64_t)self, (uint64_t)sel_updateIfNeeded, 0);
      objc_msgSend_performSelector_withObject_afterDelay_(self, v18, (uint64_t)sel_updateIfNeeded, 0, 0.0);
    }
  }
}

- (void)endHoldingUpdatesForAllKeys
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;

  objc_msgSend_holdingUpdatesKeys(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v5, v6, v7, v8);

  if (objc_msgSend_needsUpdate(self, v9, v10, v11))
  {
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E0DE7910], v12, (uint64_t)self, (uint64_t)sel_updateIfNeeded, 0);
    objc_msgSend_performSelector_withObject_afterDelay_(self, v13, (uint64_t)sel_updateIfNeeded, 0, 0.0);
  }
}

- (BOOL)isHoldingUpdatesForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  if (!a3)
    return 0;
  v4 = a3;
  objc_msgSend_holdingUpdatesKeys(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countForObject_(v8, v9, (uint64_t)v4, v10);

  v12 = v11 != 0;
  return v12;
}

- (void)invalidate
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E0DE7910], a2, (uint64_t)self, (uint64_t)sel_updateIfNeeded, 0);
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_(MEMORY[0x1E0DE7910], v3, (uint64_t)self, v4);
  objc_msgSend_setTarget_(self, v5, 0, v6);
  objc_msgSend_setAction_(self, v7, 0, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdingUpdatesKeys, 0);
}

@end
