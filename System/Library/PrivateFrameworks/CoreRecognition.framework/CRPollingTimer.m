@implementation CRPollingTimer

- (CRPollingTimer)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  CRPollingTimer *v7;
  CRPollingTimer *v8;
  __int128 v10;
  uint64_t v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRPollingTimer;
  v7 = -[CRPollingTimer init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CRPollingTimer setTarget:](v7, "setTarget:", v6);
    -[CRPollingTimer setSelector:](v8, "setSelector:", a4);
    v10 = *MEMORY[0x24BDC0D58];
    v11 = *(_QWORD *)(MEMORY[0x24BDC0D58] + 16);
    -[CRPollingTimer setFireTime:](v8, "setFireTime:", &v10);
    -[CRPollingTimer setFired:](v8, "setFired:", 0);
    -[CRPollingTimer setValid:](v8, "setValid:", 1);
  }

  return v8;
}

- (void)setFireTime:(id *)a3
{
  int64_t var3;
  CRPollingTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  var3 = a3->var3;
  *(_OWORD *)&obj->_fireTime.value = *(_OWORD *)&a3->var0;
  obj->_fireTime.epoch = var3;
  objc_sync_exit(obj);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fireTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CRPollingTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  *retstr = ($3CC8671D27C23BF42ADDB32F2B5E48AE)obj->_fireTime;
  objc_sync_exit(obj);

  return result;
}

- (void)evalAtTime:(id *)a3
{
  CRPollingTimer *v4;
  void *v5;
  void (*v6)(void *, SEL);
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  CMTime time2;

  v4 = self;
  objc_sync_enter(v4);
  if (-[CRPollingTimer valid](v4, "valid"))
  {
    if (!-[CRPollingTimer fired](v4, "fired"))
    {
      -[CRPollingTimer fireTime](v4, "fireTime");
      v8 = *a3;
      if (CMTimeCompare((CMTime *)&v8, &time2) >= 1)
      {
        -[CRPollingTimer target](v4, "target");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void (*)(void *, SEL))objc_msgSend(v5, "methodForSelector:", -[CRPollingTimer selector](v4, "selector"));
        -[CRPollingTimer target](v4, "target");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6(v7, -[CRPollingTimer selector](v4, "selector"));

        -[CRPollingTimer setFired:](v4, "setFired:", 1);
      }
    }
  }
  objc_sync_exit(v4);

}

- (void)invalidate
{
  CRPollingTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CRPollingTimer setValid:](obj, "setValid:", 0);
  objc_sync_exit(obj);

}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (BOOL)fired
{
  return self->_fired;
}

- (void)setFired:(BOOL)a3
{
  self->_fired = a3;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

@end
