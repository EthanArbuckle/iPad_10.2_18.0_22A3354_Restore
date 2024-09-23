@implementation HMDManagedStagedValue

- (HMDManagedStagedValue)initWithValue:(id)a3 commitBlock:(id)a4
{
  id v6;
  id v7;
  HMDManagedStagedValue *v8;
  HMDManagedStagedValue *v9;
  uint64_t v10;
  id initialValue;
  uint64_t v12;
  id commitBlock;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDManagedStagedValue;
  v8 = -[HMDManagedStagedValue init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend(v6, "copy");
    initialValue = v9->_initialValue;
    v9->_initialValue = (id)v10;

    v12 = objc_msgSend(v7, "copy");
    commitBlock = v9->_commitBlock;
    v9->_commitBlock = (id)v12;

    -[HMDManagedStagedValue _resetStagedValue](v9, "_resetStagedValue");
  }

  return v9;
}

- (id)value
{
  void *v2;
  void *v3;

  -[HMDManagedStagedValue stagedValue](self, "stagedValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)stageValue:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDManagedStagedValue stagedValue](self, "stagedValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stageValue:", v5);
  os_unfair_lock_unlock(&self->_lock);
  -[HMDManagedStagedValue _commitIfStaged:](self, "_commitIfStaged:", v4);

}

- (void)resetAndStagePriorValue
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDManagedStagedValue stagedValue](self, "stagedValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDManagedStagedValue _resetStagedValue](self, "_resetStagedValue");
  -[HMDManagedStagedValue stagedValue](self, "stagedValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stageValue:", v5);

  os_unfair_lock_unlock(p_lock);
  -[HMDManagedStagedValue _commitIfStaged:](self, "_commitIfStaged:", v6);

}

- (void)_resetStagedValue
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE3F278]);
  -[HMDManagedStagedValue initialValue](self, "initialValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithValue:", v4);
  -[HMDManagedStagedValue setStagedValue:](self, "setStagedValue:", v5);

  -[HMDManagedStagedValue setState:](self, "setState:", 0);
}

- (void)_commitIfStaged:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDManagedStagedValue stagedValue](self, "stagedValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4 && objc_msgSend(v4, "isStaged") && !-[HMDManagedStagedValue state](self, "state"))
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDManagedStagedValue setState:](self, "setState:", 1);
    os_unfair_lock_unlock(&self->_lock);
    objc_initWeak(&location, self);
    -[HMDManagedStagedValue commitBlock](self, "commitBlock");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __41__HMDManagedStagedValue__commitIfStaged___block_invoke;
    v9[3] = &unk_24E790578;
    objc_copyWeak(&v12, &location);
    v10 = v4;
    v8 = v6;
    v11 = v8;
    ((void (**)(_QWORD, id, _QWORD *))v7)[2](v7, v8, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)_handleCommitCompletionWithStagedValue:(id)a3 success:(BOOL)a4 committingValue:(id)a5
{
  _BOOL4 v6;
  id v8;
  os_unfair_lock_s *p_lock;
  id v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  char v15;
  id v16;

  v6 = a4;
  v16 = a3;
  v8 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDManagedStagedValue stagedValue](self, "stagedValue");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v16)
    goto LABEL_2;
  -[HMDManagedStagedValue setState:](self, "setState:", 0);
  objc_msgSend(v16, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isStaged"))
  {
    if (!v6)
    {
LABEL_12:
      v15 = objc_msgSend(v16, "isStaged");

      os_unfair_lock_unlock(&self->_lock);
      if ((v15 & 1) == 0)
        goto LABEL_3;
      goto LABEL_15;
    }
    v13 = 0;
LABEL_10:
    objc_msgSend(v16, "commitValue:", v8);
    if ((v13 & 1) != 0)
      goto LABEL_11;
    objc_msgSend(v16, "stageValue:", v11);

    os_unfair_lock_unlock(&self->_lock);
LABEL_15:
    -[HMDManagedStagedValue _commitIfStaged:](self, "_commitIfStaged:", v16);
    goto LABEL_3;
  }
  v12 = HMFEqualObjects();
  v13 = v12;
  if (v6)
    goto LABEL_10;
  if (!v12)
    goto LABEL_12;
  objc_msgSend(v16, "committedValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commitValue:", v14);

LABEL_11:
LABEL_2:
  os_unfair_lock_unlock(p_lock);
LABEL_3:

}

- (id)commitBlock
{
  return self->_commitBlock;
}

- (void)setCommitBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HMFStagedValue)stagedValue
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStagedValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)initialValue
{
  return self->_initialValue;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialValue, 0);
  objc_storeStrong((id *)&self->_stagedValue, 0);
  objc_storeStrong(&self->_commitBlock, 0);
}

void __41__HMDManagedStagedValue__commitIfStaged___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleCommitCompletionWithStagedValue:success:committingValue:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));

}

@end
