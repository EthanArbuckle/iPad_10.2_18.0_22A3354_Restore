@implementation IMManualUpdater

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void)updateIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;

  if (objc_msgSend_needsUpdate(self, a2, v2, v3))
  {
    objc_msgSend_setNeedsUpdate_(self, v5, 0, v6);
    objc_msgSend_target(self, v7, v8, v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_action(self, v10, v11, v12);
    objc_msgSend_performSelector_(v16, v14, v13, v15);

  }
}

- (void)setNeedsUpdate:(BOOL)a3
{
  *((_BYTE *)self + 24) = *((_BYTE *)self + 24) & 0xFE | a3;
}

- (BOOL)needsUpdate
{
  return *((_BYTE *)self + 24) & 1;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)action
{
  return self->_action;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IMManualUpdater;
  -[IMManualUpdater description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_needsUpdate(self, v5, v6, v7);
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ needsUpdate:%d"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (IMManualUpdater)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  IMManualUpdater *v7;
  const char *v8;
  uint64_t v9;
  IMManualUpdater *v10;
  const char *v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMManualUpdater;
  v7 = -[IMManualUpdater init](&v14, sel_init);
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setTarget_(v7, v8, (uint64_t)v6, v9);
    objc_msgSend_setAction_(v10, v11, (uint64_t)a4, v12);
  }

  return v10;
}

- (void)setNeedsUpdate
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;

  if ((objc_msgSend_needsUpdate(self, a2, v2, v3) & 1) == 0)
    objc_msgSend_setNeedsUpdate_(self, v5, 1, v6);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

@end
