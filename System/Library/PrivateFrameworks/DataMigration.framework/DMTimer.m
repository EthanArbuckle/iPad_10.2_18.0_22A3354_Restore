@implementation DMTimer

- (DMTimer)initWithSecondsBeforeFirstFire:(unint64_t)a3 secondsOfLeeway:(unint64_t)a4 fireBlock:(id)a5
{
  id v8;
  DMTimer *v9;
  DMTimer *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)DMTimer;
  v9 = -[DMTimer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[DMTimer setTimer:](v9, "setTimer:", 0);
    -[DMTimer setFireBlock:](v10, "setFireBlock:", v8);
    -[DMTimer setSecondsBeforeFirstFire:](v10, "setSecondsBeforeFirstFire:", a3);
    -[DMTimer setSecondsOfLeeway:](v10, "setSecondsOfLeeway:", a4);
  }

  return v10;
}

- (void)resume
{
  __assert_rtn("-[DMTimer resume]", "DMTimer.m", 35, "self.timer == nil");
}

void __17__DMTimer_resume__block_invoke(uint64_t a1)
{
  uint64_t (**v2)(_QWORD, _QWORD);
  uint64_t v3;
  NSObject *v4;
  intptr_t v5;
  dispatch_time_t v6;
  NSObject *source;

  objc_msgSend(*(id *)(a1 + 32), "fireBlock");
  v2 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3 = v2[2](v2, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "timer");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_source_testcancel(v4);

  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "timer");
    source = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_time(0, 1000000000 * v3);
    dispatch_source_set_timer(source, v6, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * objc_msgSend(*(id *)(a1 + 32), "secondsOfLeeway"));

  }
}

- (void)cancel
{
  NSObject *v2;

  -[DMTimer timer](self, "timer");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

}

- (void)cancelSynchronously
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[DMTimer cancel](self, "cancel");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__DMTimer_cancelSynchronously__block_invoke;
    block[3] = &unk_1E951EEA0;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __30__DMTimer_cancelSynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (void)setFireBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)secondsBeforeFirstFire
{
  return self->_secondsBeforeFirstFire;
}

- (void)setSecondsBeforeFirstFire:(unint64_t)a3
{
  self->_secondsBeforeFirstFire = a3;
}

- (unint64_t)secondsOfLeeway
{
  return self->_secondsOfLeeway;
}

- (void)setSecondsOfLeeway:(unint64_t)a3
{
  self->_secondsOfLeeway = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
