@implementation FCOnce

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

- (FCOnce)initWithOptions:(unint64_t)a3
{
  char v3;
  FCOnce *v4;
  FCOnce *v5;
  NFUnfairLock *v6;
  NFUnfairLock *lock;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCOnce;
  v4 = -[FCOnce init](&v9, sel_init);
  v5 = v4;
  if ((v3 & 1) != 0 && v4)
  {
    v6 = (NFUnfairLock *)objc_alloc_init(MEMORY[0x1E0D60B18]);
    lock = v5->_lock;
    v5->_lock = v6;

  }
  return v5;
}

- (BOOL)trigger
{
  BOOL v3;

  -[NFUnfairLock lock](self->_lock, "lock");
  v3 = !self->_finished;
  self->_finished = 1;
  -[NFUnfairLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)executeOnce:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[NFUnfairLock lock](self->_lock, "lock");
  if (!self->_finished)
  {
    if (v4)
      v4[2]();
    self->_finished = 1;
  }
  -[NFUnfairLock unlock](self->_lock, "unlock");

}

- (FCOnce)init
{
  return -[FCOnce initWithOptions:](self, "initWithOptions:", 0);
}

- (BOOL)hasBeenTriggered
{
  BOOL finished;

  -[NFUnfairLock lock](self->_lock, "lock");
  finished = self->_finished;
  -[NFUnfairLock unlock](self->_lock, "unlock");
  return finished;
}

@end
