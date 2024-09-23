@implementation ICBackoffTimer

- (ICBackoffTimer)init
{
  -[ICBackoffTimer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICBackoffTimer)initWithInitialInterval:(double)a3 maxInterval:(double)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7
{
  id v12;
  id v13;
  ICBackoffTimer *v14;
  ICBackoffTimer *v15;
  objc_super v17;

  v12 = a5;
  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)ICBackoffTimer;
  v14 = -[ICBackoffTimer init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[ICBackoffTimer setInitialTimeInterval:](v14, "setInitialTimeInterval:", a3);
    -[ICBackoffTimer setMaxTimeInterval:](v15, "setMaxTimeInterval:", a4);
    -[ICBackoffTimer setTarget:](v15, "setTarget:", v12);
    -[ICBackoffTimer setSelector:](v15, "setSelector:", a6);
    -[ICBackoffTimer setUserInfo:](v15, "setUserInfo:", v13);
    -[ICBackoffTimer setBackoffCount:](v15, "setBackoffCount:", 0);
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__ICBackoffTimer_dealloc__block_invoke;
  v4[3] = &unk_1EA823E80;
  v4[4] = self;
  performBlockOnMainThreadAndWait(v4);
  v3.receiver = self;
  v3.super_class = (Class)ICBackoffTimer;
  -[ICBackoffTimer dealloc](&v3, sel_dealloc);
}

void __25__ICBackoffTimer_dealloc__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "timer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

- (double)nextTimeInterval
{
  double v3;
  double v4;
  double result;

  -[ICBackoffTimer initialTimeInterval](self, "initialTimeInterval");
  v4 = v3 + pow(3.0, (double)-[ICBackoffTimer backoffCount](self, "backoffCount")) + -1.0;
  -[ICBackoffTimer maxTimeInterval](self, "maxTimeInterval");
  if (v4 < result)
    return v4;
  return result;
}

- (void)fire:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (*v7)(id, SEL, ICBackoffTimer *);
  id v8;

  v8 = a3;
  -[ICBackoffTimer timer](self, "timer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v8)
    goto LABEL_4;
  -[ICBackoffTimer target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICBackoffTimer target](self, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void (*)(id, SEL, ICBackoffTimer *))objc_msgSend(v6, "methodForSelector:", -[ICBackoffTimer selector](self, "selector"));

    -[ICBackoffTimer target](self, "target");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v7(v4, -[ICBackoffTimer selector](self, "selector"), self);
LABEL_4:

  }
}

- (void)invalidate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __28__ICBackoffTimer_invalidate__block_invoke;
  v2[3] = &unk_1EA823E80;
  v2[4] = self;
  performBlockOnMainThreadAndWait(v2);
}

uint64_t __28__ICBackoffTimer_invalidate__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setTimer:", 0);
}

- (BOOL)isScheduled
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__ICBackoffTimer_isScheduled__block_invoke;
  v4[3] = &unk_1EA823D70;
  v4[4] = self;
  v4[5] = &v5;
  performBlockOnMainThreadAndWait(v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __29__ICBackoffTimer_isScheduled__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "timer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isValid");

}

- (void)scheduleToFire
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __32__ICBackoffTimer_scheduleToFire__block_invoke;
  v2[3] = &unk_1EA823E80;
  v2[4] = self;
  performBlockOnMainThreadAndWait(v2);
}

uint64_t __32__ICBackoffTimer_scheduleToFire__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "timer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

  }
  v4 = (void *)MEMORY[0x1E0C99E88];
  objc_msgSend(*(id *)(a1 + 32), "nextTimeInterval");
  objc_msgSend(v4, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_fire_, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTimer:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "setBackoffCount:", objc_msgSend(*(id *)(a1 + 32), "backoffCount") + 1);
}

- (void)fire
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __22__ICBackoffTimer_fire__block_invoke;
  v2[3] = &unk_1EA823E80;
  v2[4] = self;
  performBlockOnMainThreadAndWait(v2);
}

uint64_t __22__ICBackoffTimer_fire__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fire");

  return objc_msgSend(*(id *)(a1 + 32), "setTimer:", 0);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (double)initialTimeInterval
{
  return self->_initialTimeInterval;
}

- (void)setInitialTimeInterval:(double)a3
{
  self->_initialTimeInterval = a3;
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

- (unint64_t)backoffCount
{
  return self->_backoffCount;
}

- (void)setBackoffCount:(unint64_t)a3
{
  self->_backoffCount = a3;
}

- (double)maxTimeInterval
{
  return self->_maxTimeInterval;
}

- (void)setMaxTimeInterval:(double)a3
{
  self->_maxTimeInterval = a3;
}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong(&self->_userInfo, 0);
}

@end
