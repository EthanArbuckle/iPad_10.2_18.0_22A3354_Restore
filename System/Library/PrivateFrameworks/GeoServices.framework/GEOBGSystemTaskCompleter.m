@implementation GEOBGSystemTaskCompleter

- (GEOBGSystemTaskCompleter)initWithTask:(id)a3
{
  id v5;
  GEOBGSystemTaskCompleter *v6;
  GEOBGSystemTaskCompleter *v7;
  GEOBGSystemTaskCompleter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOBGSystemTaskCompleter;
  v6 = -[GEOBGSystemTaskCompleter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_completed.lock._os_unfair_lock_opaque = 0;
    v6->_completed.didRun = 0;
    objc_storeStrong((id *)&v6->_task, a3);
    v8 = v7;
  }

  return v7;
}

- (void)complete
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__GEOBGSystemTaskCompleter_complete__block_invoke;
  v2[3] = &unk_1E1BFF6F8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_completed, v2);
}

void __36__GEOBGSystemTaskCompleter_complete__block_invoke(uint64_t a1)
{
  void (**v2)(void);
  void (**v3)(void);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setTaskCompleted");
  v2 = (void (**)(void))MEMORY[0x18D765024](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[GEOBGSystemTaskCompleter complete](self, "complete");
  v3.receiver = self;
  v3.super_class = (Class)GEOBGSystemTaskCompleter;
  -[GEOBGSystemTaskCompleter dealloc](&v3, sel_dealloc);
}

- (BGSystemTask)task
{
  return self->_task;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
