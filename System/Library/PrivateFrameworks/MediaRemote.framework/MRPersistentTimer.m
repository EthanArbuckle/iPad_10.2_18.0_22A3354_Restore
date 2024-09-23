@implementation MRPersistentTimer

- (MRPersistentTimer)initWithInterval:(double)a3 name:(id)a4 queue:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  MRPersistentTimer *v13;
  uint64_t v14;
  MSVPersistentTimer *pTimer;
  uint64_t v16;
  objc_super v18;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MRPersistentTimer;
  v13 = -[MRPersistentTimer init](&v18, sel_init);
  if (v13)
  {
    if (objc_msgSend((id)objc_opt_class(), "usePersistentTimer"))
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0C0]), "initWithInterval:name:queue:block:", v10, v11, v12, a3);
      pTimer = v13->_pTimer;
      v13->_pTimer = (MSVPersistentTimer *)v14;
    }
    else
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D110]), "initWithInterval:repeats:queue:block:", 0, v11, v12, a3);
      pTimer = v13->_timer;
      v13->_timer = (MSVTimer *)v16;
    }

  }
  return v13;
}

- (void)invalidate
{
  -[MSVPersistentTimer invalidate](self->_pTimer, "invalidate");
  -[MSVTimer invalidate](self->_timer, "invalidate");
}

- (void)invalidateWithReason:(id)a3
{
  -[MSVPersistentTimer invalidateWithReason:](self->_pTimer, "invalidateWithReason:", a3);
  -[MSVTimer invalidate](self->_timer, "invalidate");
}

- (BOOL)isValid
{
  return (-[MSVPersistentTimer isValid](self->_pTimer, "isValid") & 1) != 0 || self->_timer != 0;
}

+ (BOOL)usePersistentTimer
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_pTimer, 0);
}

@end
