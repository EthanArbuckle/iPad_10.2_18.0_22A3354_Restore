@implementation CKManualUpdater

- (void)setNeedsUpdate
{
  if (!-[CKManualUpdater needsUpdate](self, "needsUpdate"))
    -[CKManualUpdater setNeedsUpdate:](self, "setNeedsUpdate:", 1);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (CKManualUpdater)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  CKManualUpdater *v7;
  CKManualUpdater *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKManualUpdater;
  v7 = -[CKManualUpdater init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CKManualUpdater setTarget:](v7, "setTarget:", v6);
    -[CKManualUpdater setAction:](v8, "setAction:", a4);
  }

  return v8;
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CKManualUpdater;
  -[CKManualUpdater description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ needsUpdate:%d"), v4, -[CKManualUpdater needsUpdate](self, "needsUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateIfNeeded
{
  id v3;

  if (-[CKManualUpdater needsUpdate](self, "needsUpdate"))
  {
    -[CKManualUpdater setNeedsUpdate:](self, "setNeedsUpdate:", 0);
    -[CKManualUpdater target](self, "target");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performSelector:", -[CKManualUpdater action](self, "action"));

  }
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

@end
